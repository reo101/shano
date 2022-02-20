pub fn ApplyToType(comptime dim: anytype, comptime T: type, apply: fn (type) type) type {
    const rec = (struct {
        pub fn rec(comptime cur_dim: comptime_int, comptime cur_T: type) type {
            return if (cur_dim > 0) rec(cur_dim - 1, apply(cur_T)) else cur_T;
        }
    }).rec;

    return switch (@typeInfo(@TypeOf(dim))) {
        .ComptimeInt => rec(@as(comptime_int, dim), T),
        else => T,
    };
}
