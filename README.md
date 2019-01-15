# imandra-prelude

Imandra provides a prelude, Imandra_prelude, which is available when verifying and executing `.iml` programs via Imandra.

As `.iml` and `.ml` syntax has some small differences, we provide `imandra-extract` to extract `.ml` syntax source from `.iml` source.

This package contains the extracted `.ml` version of `Imandra_prelude.iml` so it can be used via standard OCaml (and bucklescript) build processes alongside other programs that have been verified and extracted from `.iml`.

## Usage from an native OCaml project:

    opam install imandra-prelude https://github.com/aestheticintegration/imandra-prelude.git

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

    npm test

### OCaml setup

    opam switch create . ocaml-base-compiler.4.06.1
    eval $(opam env)
    make test

## Licence information

This repository contains parts of the `ocaml-containers` library https://github.com/c-cube/ocaml-containers/, so those source files (in `src-bs/containers`) preserve the license of that library. The files have been modified slightly from the originals to be compatible with the Bucklescript compiler.

See `LICENSE.md` and `src-bs/containers/LICENSE.md` for further details.

