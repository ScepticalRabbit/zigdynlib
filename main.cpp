#include <iostream>
#include <dlfcn.h>

int main() {
    void* handle = dlopen("./zig-out/lib/libzigdyn.so", RTLD_LAZY);

    int (*addInts)(int, int) = (int (*)(int, int)) dlsym(handle, "addInts");
    int (*subInts)(int, int) = (int (*)(int, int)) dlsym(handle, "subInts");
    int (*giveBack)(int) = (int (*)(int)) dlsym(handle, "giveBack");

    std::cout << addInts(1, 2) << "\n";
    std::cout << subInts(1, 2) << "\n";
    std::cout << giveBack(1) << "\n";

    dlclose(handle);
    return 0;
}
