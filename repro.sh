#!/bin/sh

cd "$(dirname "$0")"

[ -e dist-newstyle/ ] && rm -r dist-newstyle/

cabal new-build -v0 --constraint 'bytestring ==0.9.2.1' flib:myflib
cabal new-build -v0 --constraint 'bytestring ==0.10.8.1' flib:myflib

echo '$ ldd $(find . -name libmyflib.so) | grep bytestring'
ldd $(find . -name libmyflib.so) | grep bytestring

echo
echo
echo '$ objdump -x "$(find . -name libmyflib.so)" | grep -e "RUNPATH\|RPATH" | tr : '\n' | grep bytestring'
objdump -x "$(find . -name libmyflib.so)" | grep -e "RUNPATH\|RPATH" | tr : '\n' | grep bytestring
