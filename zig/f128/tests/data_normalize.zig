const std = @import("std");
const math = std.math;
const unit = @import("../angle.zig").AngleUnit;
const uh = @import("helper.zig").unit_helper;

pub const TestCase = struct {
    in_unit: unit,
    in_value: f128,
    out_unit: unit,
    outarr: [1]f128,
};

const pi = uh.pi;
const pix2 = pi * 2;

pub const cases = [_]TestCase{
    // === ZERO VALUES ===
    .{
        .in_unit = unit.rad,
        .in_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 0,
        .out_unit = unit.deg,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 0,
        .out_unit = unit.turn,
        .outarr = .{0},
    },

    // === SMALL POSITIVE VALUES (within [0, 2π)) ===
    .{
        .in_unit = unit.rad,
        .in_value = pi / 4.0,
        .out_unit = unit.rad,
        .outarr = .{pi / 4.0},
    },
    .{
        .in_unit = unit.rad,
        .in_value = pi,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.rad,
        .in_value = pi * 1.5,
        .out_unit = unit.rad,
        .outarr = .{pi * 1.5},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 45,
        .out_unit = unit.deg,
        .outarr = .{45},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 180,
        .out_unit = unit.deg,
        .outarr = .{180},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 359,
        .out_unit = unit.deg,
        .outarr = .{359},
    },

    // === EXACT 2π BOUNDARY ===
    .{
        .in_unit = unit.rad,
        .in_value = pix2,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 360,
        .out_unit = unit.deg,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 1.0,
        .out_unit = unit.turn,
        .outarr = .{0},
    },

    // === ABOVE 2π (wrap around once) ===
    .{
        .in_unit = unit.rad,
        .in_value = pix2 + pi / 4.0,
        .out_unit = unit.rad,
        .outarr = .{pi / 4.0},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 405,
        .out_unit = unit.deg,
        .outarr = .{45},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 450,
        .out_unit = unit.deg,
        .outarr = .{90},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 720 + 60,
        .out_unit = unit.deg,
        .outarr = .{60},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 1.25,
        .out_unit = unit.turn,
        .outarr = .{0.25},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 2.75,
        .out_unit = unit.turn,
        .outarr = .{0.75},
    },

    // === ABOVE MULTIPLE 2π ===
    .{
        .in_unit = unit.rad,
        .in_value = pix2 * 3 + pi / 3.0,
        .out_unit = unit.rad,
        .outarr = .{pi / 3.0},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 1080 + 120,
        .out_unit = unit.deg,
        .outarr = .{120},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 5.5,
        .out_unit = unit.turn,
        .outarr = .{0.5},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 10.0,
        .out_unit = unit.turn,
        .outarr = .{0},
    },

    // === NEGATIVE VALUES (wrap to positive) ===
    .{
        .in_unit = unit.rad,
        .in_value = -pi / 4.0,
        .out_unit = unit.rad,
        .outarr = .{pix2 - pi / 4.0},
    },
    .{
        .in_unit = unit.rad,
        .in_value = -pi,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.rad,
        .in_value = -pi * 1.5,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.deg,
        .in_value = -45,
        .out_unit = unit.deg,
        .outarr = .{315},
    },
    .{
        .in_unit = unit.deg,
        .in_value = -90,
        .out_unit = unit.deg,
        .outarr = .{270},
    },
    .{
        .in_unit = unit.deg,
        .in_value = -180,
        .out_unit = unit.deg,
        .outarr = .{180},
    },
    .{
        .in_unit = unit.turn,
        .in_value = -0.25,
        .out_unit = unit.turn,
        .outarr = .{0.75},
    },
    .{
        .in_unit = unit.turn,
        .in_value = -0.5,
        .out_unit = unit.turn,
        .outarr = .{0.5},
    },
    .{
        .in_unit = unit.turn,
        .in_value = -1.0,
        .out_unit = unit.turn,
        .outarr = .{0},
    },

    // === LARGE NEGATIVE VALUES ===
    .{
        .in_unit = unit.rad,
        .in_value = -(pix2 + pi / 4.0),
        .out_unit = unit.rad,
        .outarr = .{pix2 - pi / 4.0},
    },
    .{
        .in_unit = unit.deg,
        .in_value = -360 - 45,
        .out_unit = unit.deg,
        .outarr = .{315},
    },
    .{
        .in_unit = unit.deg,
        .in_value = -720 - 90,
        .out_unit = unit.deg,
        .outarr = .{270},
    },
    .{
        .in_unit = unit.turn,
        .in_value = -1.5,
        .out_unit = unit.turn,
        .outarr = .{0.5},
    },
    .{
        .in_unit = unit.turn,
        .in_value = -2.25,
        .out_unit = unit.turn,
        .outarr = .{0.75},
    },

    // === EDGE CASES (very close to boundary) ===
    .{
        .in_unit = unit.deg,
        .in_value = 359.9999,
        .out_unit = unit.deg,
        .outarr = .{359.9999},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 360.0001,
        .out_unit = unit.deg,
        .outarr = .{0.0001},
    },
    .{
        .in_unit = unit.deg,
        .in_value = -0.0001,
        .out_unit = unit.deg,
        .outarr = .{359.9999},
    },

    // === OTHER UNITS TESTS ===
    // Grad (400 grad = 360 deg = 2π)
    .{
        .in_unit = unit.grad,
        .in_value = 400,
        .out_unit = unit.grad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.grad,
        .in_value = 500,
        .out_unit = unit.grad,
        .outarr = .{100},
    },
    .{
        .in_unit = unit.grad,
        .in_value = -100,
        .out_unit = unit.grad,
        .outarr = .{300},
    },

    // Hexacontade (60 hexa = 360 deg)
    .{
        .in_unit = unit.hexa,
        .in_value = 60,
        .out_unit = unit.hexa,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.hexa,
        .in_value = 75,
        .out_unit = unit.hexa,
        .outarr = .{15},
    },
    .{
        .in_unit = unit.hexa,
        .in_value = -15,
        .out_unit = unit.hexa,
        .outarr = .{45},
    },

    // Binary Degree (256 bdeg = 360 deg)
    .{
        .in_unit = unit.bdeg,
        .in_value = 256,
        .out_unit = unit.bdeg,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.bdeg,
        .in_value = 320,
        .out_unit = unit.bdeg,
        .outarr = .{64},
    },
    .{
        .in_unit = unit.bdeg,
        .in_value = -64,
        .out_unit = unit.bdeg,
        .outarr = .{192},
    },

    // Cross-unit normalization (input in one unit, output in another)
    .{
        .in_unit = unit.rad,
        .in_value = pix2 * 2 + pi / 2.0,
        .out_unit = unit.deg,
        .outarr = .{90},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 720 + 60,
        .out_unit = unit.rad,
        .outarr = .{pi / 3.0},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 3.5,
        .out_unit = unit.deg,
        .outarr = .{180},
    },
    .{
        .in_unit = unit.deg,
        .in_value = -180,
        .out_unit = unit.turn,
        .outarr = .{0.5},
    },
};
