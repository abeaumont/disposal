module: disposal
synopsis: Disposal library.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: 2013, Alfredo Beaumont.

define class <disposable> (<object>)
  slot disposed? :: <boolean>, init-value: #f;
end class <disposable>;

// Dispose a ``<disposable>`` object.
// Disposable objects should usually specialize dispose-object
define generic dispose (disposable :: false-or(<disposable>)) => ();

// A disposable may be false if disposable resource fails to be adquire.
// Do nothing in such a case
define method dispose (disposable == #f) => ()
end method dispose;

define method dispose (disposable :: <disposable>) => ()
  unless(disposable.disposed?)
    dispose-object(disposable);
    disposable.disposed? := #t;
  end unless;
end method dispose;

// Dispose a ``<disposable>`` object.
// This method takes care of object disposal and should be specialized
// by disposal library users.
define generic dispose-object (disposable :: <disposable>) => ();

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