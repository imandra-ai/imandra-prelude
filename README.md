# imandra-prelude

Imandra provides a prelude, Imandra_prelude, which is available when verifying and executing `.iml` programs via Imandra.

As `.iml` and `.ml` syntax has some small differences, we provide `imandra-extract` to extract `.ml` syntax source from `.iml` source.

This package contains the extracted `.ml` version of `Imandra_prelude.iml` so it can be used via standard OCaml (and bucklescript) build processes alongside other programs that have been verified and extracted from `.iml`.

## Usage from an native OCaml project:

    opam pin imandra-prelude https://github.com/aestheticintegration/imandra-prelude.git

## Usage from a bucklescript project:

```
npm install --save https://github.com/aestheticintegration/imandra-prelude.git
```
Then add `{ ... "bs-dependencies": ['imandra-prelude'] }` to your `.bsconfig.json`

## Development

### Bucklescript setup

    npm install
    npm run build
    
To develop - watches files and incrementally compiles

    npm run watch
    
To run tests in JS (having already built):

    node src-test/tests.bs.js

### OCaml setup

    opam switch create . ocaml-base-compiler.4.06.1
    eval $(opam env)
    make test

