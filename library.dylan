module: dylan-user
synopsis: Disposal library.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND

define library disposal
  use common-dylan;
  use io;
  use system;
  export disposal;
  export file-stream;
end library;

define module disposal
  use common-dylan, exclude: { format-to-string };
  export <disposable>, disposed?, disposed?-setter;
  export dispose, dispose-object, with-disposal ;
end module;

define module file-stream
  use common-dylan, exclude: { format-to-string };
  use streams, exclude: { open-file-stream };
  use locators;
  use file-system, exclude: { with-open-file };
  use disposal;
  export open-file-stream, with-open-file;
end module file-stream;

define module disposable-file-stream-example
  use common-dylan, exclude: { format-to-string };
  use format-out;
  use streams, exclude: { open-file-stream };
  use file-stream;
end module disposable-file-stream-example;