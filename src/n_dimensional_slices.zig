const std = @import("std");
usingnamespace @import("apply_to_type.zig");

pub fn @"[]"(comptime dim: anytype, comptime T: type) type {
    return @This().ApplyToType(dim, T, (struct {
        pub fn apply(comptime V: type) type {
            return []V;
        }
    }).apply);
}
