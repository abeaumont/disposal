module: disposable-file-stream-example
synopsis: Example of use of a disposable file stream.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: 2013, Alfredo Beaumont.

define function main (name :: <string>, arguments :: <vector>)
  let file-name = if (arguments.size > 0) arguments[0] else "/tmp/dfe" end;
  with-open-file (out-stream = file-name, direction: #"output")
    write(out-stream, "hello world\n");
  end with-open-file;
  exit-application(0);
end function main;

main(application-name(), application-arguments());