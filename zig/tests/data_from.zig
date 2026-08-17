const std = @import("std");
const math = std.math;
const unit = @import("../angle.zig").AngleUnit;

pub const TestCase = struct {
    in_unit: unit,
    value: f32,
    out_unit: unit,
    outarr: [1]f32,
};

pub const cases = [_]TestCase{
    .{
        .in_unit = unit.rad,
        .value = 2,
        .out_unit = unit.rad,
        .outarr = .{2}, // rad(default/none) input -> rad out
    },
    .{
        .in_unit = unit.turn,
        .value = 2,
        .out_unit = unit.rad,
        .outarr = .{4 * math.pi}, // turn input -> rad out
    },
};
