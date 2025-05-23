const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const dyn_lib_path = "zig-out/lib/libzigdyn.so";
    print("Dynamic lib path: {s}\n",.{dyn_lib_path});

    var dyn_lib = try std.DynLib.open(dyn_lib_path);
    defer dyn_lib.close();

    const giveBack = dyn_lib.lookup(
        *const fn (i32) i32,
        "giveBack",
    ) orelse return error.NoFunction;

    const addInts = dyn_lib.lookup(
        *const fn (i32,i32) i32,
        "addInts",
    ) orelse return error.NoFunction;

    const subInts = dyn_lib.lookup(
        *const fn (i32,i32) i32,
        "subInts",
    ) orelse return error.NoFunction;

    const a: i32 = 1;
    const b: i32 = 2;
    print("Dynamic lib giveBack: {d}\n",.{giveBack(a)});
    print("Dynamic lib addInts: 1+2={d}\n",.{addInts(a,b)});
    print("Dynamic lib subInts: 1-2={d}\n\n",.{subInts(a,b)});
}