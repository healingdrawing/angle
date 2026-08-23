const std = @import("std");

/// Parse space-separated values into an array of type T
pub inline fn parse_float_result(comptime T: type, allocator: std.mem.Allocator, output: []const u8) ![]T {
    const trimmed = std.mem.trim(u8, output, " \n\r\t");

    var values = try std.ArrayList(T).initCapacity(allocator, 256);
    defer values.deinit(allocator);

    var parts = std.mem.splitSequence(u8, trimmed, " ");

    while (parts.next()) |part| {
        const clean = std.mem.trim(u8, part, " \t");
        if (clean.len == 0) continue;
        const value = try std.fmt.parseFloat(T, clean);
        try values.append(allocator, value);
    }
    return try values.toOwnedSlice(allocator);
}

/// Compare two values of type T with epsilon tolerance
pub inline fn floats_equal(comptime T: type, a: T, b: T, epsilon: T) bool {
    if (std.math.isNan(a) and std.math.isNan(b)) {
        return true;
    }
    if (std.math.isNan(a) or std.math.isNan(b)) {
        return false;
    }
    if (std.math.isInf(a) or std.math.isInf(b)) {
        return a == b;
    }

    const magnitude = @max(@abs(a), @abs(b));
    const adaptive_epsilon = epsilon * @max(@as(T, 1), magnitude);

    return @abs(a - b) <= adaptive_epsilon;
}

/// Compare two arrays of type T with epsilon tolerance
pub inline fn arrays_equal(comptime T: type, a: []const T, b: []const T, epsilon: T) !bool {
    if (a.len != b.len) {
        std.debug.print("\nlength mismatch: {d} vs {d}\na={any}\nb={any}\n", .{ a.len, b.len, a, b });
        return false;
    }

    for (0..a.len) |i| {
        if (!floats_equal(T, a[i], b[i], epsilon)) {
            std.debug.print("  [{d}] mismatch: {any} vs {any}\n", .{ i, a[i], b[i] });
            return false;
        }
    }
    return true;
}

/// Convert any numeric type/vector to []T
pub inline fn to_array(comptime T: type, allocator: std.mem.Allocator, value: anytype) ![]T {
    const SrcT = @TypeOf(value);
    const type_info = @typeInfo(SrcT);

    return switch (type_info) {
        .float => blk: {
            const arr = try allocator.alloc(T, 1);
            arr[0] = @floatCast(value);
            break :blk arr;
        },
        .vector => |vec_info| blk: {
            const arr = try allocator.alloc(T, vec_info.len);
            inline for (0..vec_info.len) |i| {
                arr[i] = @floatCast(value[i]);
            }
            break :blk arr;
        },
        .pointer => |ptr_info| blk: {
            if (ptr_info.size == .slice or ptr_info.size == .many) {
                if (ptr_info.child == T) {
                    break :blk @constCast(value);
                } else {
                    const arr = try allocator.alloc(T, value.len);
                    for (0..value.len) |i| {
                        arr[i] = @floatCast(value[i]);
                    }
                    break :blk arr;
                }
            } else {
                @compileError("Unsupported pointer type");
            }
        },
        .array => |arr_info| blk: {
            const arr = try allocator.alloc(T, arr_info.len);
            inline for (0..arr_info.len) |i| {
                arr[i] = @floatCast(value[i]);
            }
            break :blk arr;
        },
        else => @compileError("Unsupported type for to_array"),
    };
}

/// Convert any numeric type or vector to string (space-separated)
pub fn vectors_to_string(comptime T: type, allocator: std.mem.Allocator, inputs: anytype) ![]u8 {
    var result = try std.ArrayList(u8).initCapacity(allocator, 256);
    defer result.deinit(allocator);

    inline for (inputs, 0..) |item, idx| {
        if (idx > 0) try result.appendSlice(allocator, " ");

        const T_item = @TypeOf(item);
        const type_info = @typeInfo(T_item);

        if (type_info == .vector) {
            const len = type_info.vector.len;
            inline for (0..len) |i| {
                if (i > 0) try result.appendSlice(allocator, " ");
                try append_float_string(allocator, &result, @as(T, item[i]));
            }
        } else if (type_info == .array) {
            const len = type_info.array.len;
            inline for (0..len) |i| {
                if (i > 0) try result.appendSlice(allocator, " ");
                try append_float_string(allocator, &result, @as(T, item[i]));
            }
        } else if (type_info == .float) {
            try append_float_string(allocator, &result, @as(T, item));
        } else if (type_info == .int) {
            try append_float_string(allocator, &result, @as(T, item));
        }
    }

    return result.toOwnedSlice(allocator);
}

fn append_float_string(allocator: std.mem.Allocator, result: *std.ArrayList(u8), val: anytype) !void {
    if (std.math.isNan(val)) {
        try result.appendSlice(allocator, "NaN");
    } else if (std.math.isInf(val)) {
        if (val > 0) try result.appendSlice(allocator, "Infinity") else try result.appendSlice(allocator, "-Infinity");
    } else {
        var buf: [128]u8 = undefined;
        const str = try std.fmt.bufPrint(&buf, "{d}", .{val});
        try result.appendSlice(allocator, str);
    }
}
