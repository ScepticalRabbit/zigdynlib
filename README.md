# zigdynlib
Simple example loading a dynamic library with zig. The dynamic library can be built using: `zig build`. The main script will then load the library and call the functions by running `zig run main.zig`.

Output on Ubuntu 22.04.5 LTS using Zig compiler 0.14.0 where the number returned by give keeps changing:
```shell
Dynamic lib path: zig-out/lib/libzigdyn.so
Dynamic lib give: 1830420592
Dynamic lib add: 1+2=1830420593
Dynamic lib sub: 1-2=1830420591
```

Expected output:
```shell
Dynamic lib path: zig-out/lib/libzigdyn.so
Dynamic lib give: 1
Dynamic lib add: 1+2=3
Dynamic lib sub: 1-2=-1
```

## Checking against C
```shell
g++ -o main main.cpp -ldl
```

Output (as expected):
```
3
-1
1
```