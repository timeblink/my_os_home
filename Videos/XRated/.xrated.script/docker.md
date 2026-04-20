
docker build --rm --tag ghc:9.14 -f ghc.dockerfile

docker run --rm -it -v ${PWD}/ws:/workspace haskell:9.14 /bin/bash

docker run --rm -v ${PWD}/ws:/workspace -w /workspace haskell:9.14 ghc Main.hs

docker run -u 1000:1000 --rm -v ${PWD}:/workspace -w /workspace haskell:9.14 ghc debug.hs