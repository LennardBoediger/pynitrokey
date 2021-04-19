#!/bin/bash



pushd wine-build

#sudo rm -rf out TODO replace with if out ->print user has to delete out
docker build -t nk/wine-build .


mkdir -p out 
git clone .. out/pynitrokey


docker run "$@" --mount type=bind,source="$(pwd)"/out,target=/build/wine_base/drive_c/build nk/wine-build



popd
