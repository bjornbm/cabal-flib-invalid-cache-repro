```
$ ./repro.sh
$ ldd $(find . -name libmyflib.so) | grep bytestring
	libHSbytestring-0.10.8.1-ghc8.0.1.so => not found
	libHSbytestring-0.10.8.1-ghc8.0.1.so => /usr/lib/ghc/bytestring-0.10.8.1/libHSbytestring-0.10.8.1-ghc8.0.1.so (0x00007f5dba958000)


$ objdump -x "$(find . -name libmyflib.so)" | grep -e "RUNPATH\|RPATH" | tr : '\n' | grep bytestring
/home/daniel/var/cabal/store/ghc-8.0.1/bytestring-0.9.2.1-49f3cb1313ac757d44b28a909d41ffac9349bb3cdc03e8e6b3fe8b20daec66a6/lib
```
