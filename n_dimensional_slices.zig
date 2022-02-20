const std = @import("std");

pub fn @"[]"(comptime dim: anytype, comptime T: type) type {
    return switch (@typeInfo(@TypeOf(dim))) {
        .ComptimeInt => if (dim > 0) @"[]"(dim - 1, []T) else T,
        else => T,
    };
}
