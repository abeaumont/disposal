module: disposal
synopsis: Disposal library.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: 2013, Alfredo Beaumont.

define class <disposable> (<object>)
  slot disposed? :: <boolean>, init-value: #f;
end class <disposable>;

define generic dispose (disposable :: false-or(<disposable>)) => ();

define macro with-disposal
  { with-disposal (?disposable:variable = ?resource:expression)
      ?body:body
    end }
  => { begin
         let _resource = #f;
         block ()
           _resource := ?resource;
           let ?disposable :: <disposable> = _resource;
           ?body;
         cleanup
           dispose(_resource);
         end block;
       end }
end macro with-disposal;