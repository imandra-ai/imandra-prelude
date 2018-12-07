# imandra-prelude
Extracted version of imandra's prelude

## Bucklescript setup

    npm install
    npm run build
    
To develop - watches files and incrementally compiles

    npm run watch
    
To run tests in JS (having already built):

    node src-test/tests.bs.js

## OCaml setup

    opam switch create . ocaml-base-compiler.4.06.1
    eval $(opam env)
    make test
