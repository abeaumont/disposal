module: file-stream
synopsis: Implemementation of a disposable file stream.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define class <disposable-file-stream> (<disposable>, <file-stream>)
end class <disposable-file-stream>;

define method dispose-object (stream :: <disposable-file-stream>) => ()
  stream.stream-open? & close(stream);
end method dispose-object;

define sideways sealed method open-file-stream
    (locator :: <file-locator>, #rest keywords, #key, #all-keys)
 => (stream :: <disposable-file-stream>)
  apply(make, <disposable-file-stream>, locator: locator, keywords)
end method open-file-stream;

define sideways sealed method open-file-stream
    (string :: <string>, #rest keywords, #key, #all-keys)
 => (stream :: <disposable-file-stream>)
  apply(open-file-stream, as(<file-locator>, string), keywords)
end method open-file-stream;

define macro with-open-file
  { with-open-file (?stream:variable = ?locator:expression,
                    #rest ?keys:expression)
      ?body:body
    end }
    => { begin
           with-disposal (?stream = open-file-stream(?locator, ?keys))
             ?body
           end with-disposal;
         end }
end macro with-open-file;
