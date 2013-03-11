module: dylan-user
synopsis: Disposal library.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND

define library disposal
  use common-dylan;
  export disposal;
end library;

define module disposal
  use common-dylan, exclude: { format-to-string };
  export <disposable>, disposed?, disposed?-setter;
  export dispose, dispose-object, with-disposal ;
end module;

