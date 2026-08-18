const std = @import("std");
const math = std.math;
const unit = @import("../angle.zig").AngleUnit;

pub const TestCase = struct {
    in_value: f32,
    out_unit: unit,
    outarr: [1]f32,
};

const pi = math.pi;

const sin0 = math.sin(0 * pi / 180.0); //0
const sin20 = math.sin(20 * pi / 180.0); //0.3+
const sin30 = math.sin(30 * pi / 180.0); //0.5
const sin45 = math.sin(45 * pi / 180.0); // 0.7+
const sin90 = math.sin(90 * pi / 180.0); // 1

const deg_to_rad = math.rad_per_deg; // degrees to radians
const deg_to_bdeg = 256.0 / 360.0; // degress to binary degrees

pub const cases = [_]TestCase{
    // === ZERO SINE TESTS ===
    .{
        .in_value = sin0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_value = sin0,
        .out_unit = unit.deg,
        .outarr = .{0},
    },
    .{
        .in_value = sin0,
        .out_unit = unit.turn,
        .outarr = .{0},
    },
    .{
        .in_value = sin0,
        .out_unit = unit.grad,
        .outarr = .{0},
    },

    // === POSITIVE SINE TESTS (0.5 -> 30°) ===
    .{
        .in_value = sin30,
        .out_unit = unit.rad,
        .outarr = .{pi / 6.0},
    },
    .{
        .in_value = sin30,
        .out_unit = unit.deg,
        .outarr = .{30},
    },
    .{
        .in_value = sin30,
        .out_unit = unit.turn,
        .outarr = .{1.0 / 12.0},
    },
    .{
        .in_value = sin30,
        .out_unit = unit.grad,
        .outarr = .{100.0 / 3.0},
    },

    // === MAXIMUM SINE (1.0 -> 90°) ===
    .{
        .in_value = sin90,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_value = sin90,
        .out_unit = unit.deg,
        .outarr = .{90},
    },
    .{
        .in_value = sin90,
        .out_unit = unit.turn,
        .outarr = .{0.25},
    },
    .{
        .in_value = sin90,
        .out_unit = unit.quad,
        .outarr = .{1},
    },
    .{
        .in_value = sin90,
        .out_unit = unit.marc,
        .outarr = .{5400},
    },

    // === NEGATIVE SINE TESTS (-0.5 -> -30°) ===
    .{
        .in_value = -sin30,
        .out_unit = unit.rad,
        .outarr = .{-pi / 6.0},
    },
    .{
        .in_value = -sin30,
        .out_unit = unit.deg,
        .outarr = .{-30},
    },
    .{
        .in_value = -sin30,
        .out_unit = unit.turn,
        .outarr = .{-1.0 / 12.0},
    },

    // === MINIMUM SINE (-1.0 -> -90°) ===
    .{
        .in_value = -sin90,
        .out_unit = unit.rad,
        .outarr = .{-pi / 2.0},
    },
    .{
        .in_value = -sin90,
        .out_unit = unit.deg,
        .outarr = .{-90},
    },
    .{
        .in_value = -sin90,
        .out_unit = unit.turn,
        .outarr = .{-0.25},
    },
    .{
        .in_value = -sin90,
        .out_unit = unit.quad,
        .outarr = .{-1},
    },

    // === FRACTIONAL VALUES ===
    .{
        .in_value = sin45,
        .out_unit = unit.rad,
        .outarr = .{pi / 4.0},
    },
    .{
        .in_value = sin45,
        .out_unit = unit.deg,
        .outarr = .{45},
    },
    .{
        .in_value = sin20,
        .out_unit = unit.rad,
        .outarr = .{20 * deg_to_rad},
    },
    .{
        .in_value = sin20,
        .out_unit = unit.deg,
        .outarr = .{20},
    },

    // === BINARY DEGREES AND OTHER UNITS ===
    .{
        .in_value = sin30,
        .out_unit = unit.bdeg,
        .outarr = .{30.0 * deg_to_bdeg},
    },
    .{
        .in_value = sin30,
        .out_unit = unit.hexa,
        .outarr = .{5},
    },
    .{
        .in_value = sin90,
        .out_unit = unit.sext,
        .outarr = .{1.5},
    },
    .{
        .in_value = -sin90,
        .out_unit = unit.marc,
        .outarr = .{-5400},
    },
    .{
        .in_value = sin90,
        .out_unit = unit.sarc,
        .outarr = .{324000},
    },

    // === NONE UNIT (alias for radian) ===
    .{
        .in_value = sin30,
        .out_unit = unit.none,
        .outarr = .{pi / 6.0},
    },
    .{
        .in_value = sin90,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
};
