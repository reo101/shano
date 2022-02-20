const std = @import("std");
const meta = std.meta;
const testing = std.testing;

// usingnamespace @import("shano.zig");
const @"[]" = @import("shano.zig").@"[]";

test "Not ComptimeInt" {
    try testing.expect(meta.eql(@"[]"([_]u1{ 1, 0, 1 }, u5), u5));
}

test "Below Zero" {
    try testing.expect(meta.eql(@"[]"(-5, i42), i42));
}

test "Zero" {
    try testing.expect(meta.eql(@"[]"(0, u0), u0));
}

test "Above Zero" {
    try testing.expect(meta.eql(@"[]"(3, u5), [][][]u5));
}
