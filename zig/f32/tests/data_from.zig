const std = @import("std");
const math = std.math;
const unit = @import("../angle.zig").AngleUnit;
const uh = @import("helper.zig").unit_helper;

pub const TestCase = struct {
    in_unit: unit,
    in_value: f32,
    out_unit: unit,
    outarr: [1]f32,
};

const pi = uh.pi;
const pix2 = pi * 2;

pub const cases = [_]TestCase{
    // === RADIAN BASE TESTS ===
    .{
        .in_unit = unit.rad,
        .in_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.rad,
        .in_value = 2,
        .out_unit = unit.rad,
        .outarr = .{2},
    },
    .{
        .in_unit = unit.rad,
        .in_value = pi,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.rad,
        .in_value = -pi,
        .out_unit = unit.rad,
        .outarr = .{-pi},
    },

    // === TURN TESTS ===
    .{
        .in_unit = unit.turn,
        .in_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 1,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 0.5,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 0.25,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 2,
        .out_unit = unit.rad,
        .outarr = .{pix2 * 2},
    },

    // === MULP (PI) TESTS ===
    .{
        .in_unit = unit.mulp,
        .in_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.mulp,
        .in_value = 1,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.mulp,
        .in_value = 2,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },
    .{
        .in_unit = unit.mulp,
        .in_value = -1,
        .out_unit = unit.rad,
        .outarr = .{-pi},
    },

    // === QUAD TESTS ===
    .{
        .in_unit = unit.quad,
        .in_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.quad,
        .in_value = 1,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.quad,
        .in_value = 2,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.quad,
        .in_value = 4,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === SEXT TESTS ===
    .{
        .in_unit = unit.sext,
        .in_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.sext,
        .in_value = 1,
        .out_unit = unit.rad,
        .outarr = .{pi / 3.0},
    },
    .{
        .in_unit = unit.sext,
        .in_value = 3,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.sext,
        .in_value = 6,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === DEGREE TESTS ===
    .{
        .in_unit = unit.deg,
        .in_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 45,
        .out_unit = unit.rad,
        .outarr = .{pi / 4.0},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 90,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 180,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 360,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },
    .{
        .in_unit = unit.deg,
        .in_value = -90,
        .out_unit = unit.rad,
        .outarr = .{-pi / 2.0},
    },

    // === GRAD TESTS ===
    .{
        .in_unit = unit.grad,
        .in_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.grad,
        .in_value = 100,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.grad,
        .in_value = 200,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.grad,
        .in_value = 400,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === HEXA TESTS (π/30 per hexa) ===
    .{
        .in_unit = unit.hexa,
        .in_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.hexa,
        .in_value = 15,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.hexa,
        .in_value = 30,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.hexa,
        .in_value = 60,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === BINARY DEGREES (π/128 per bdeg) ===
    .{
        .in_unit = unit.bdeg,
        .in_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.bdeg,
        .in_value = 64,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.bdeg,
        .in_value = 128,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.bdeg,
        .in_value = 256,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === MINUTE OF ARC TESTS ===
    .{
        .in_unit = unit.marc,
        .in_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.marc,
        .in_value = 5400,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.marc,
        .in_value = 10800,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.marc,
        .in_value = 21600,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === SECOND OF ARC TESTS ===
    .{
        .in_unit = unit.sarc,
        .in_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.sarc,
        .in_value = 324000,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.sarc,
        .in_value = 648000,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.sarc,
        .in_value = 1296000,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === CROSS-UNIT OUTPUT TESTS ===
    .{
        .in_unit = unit.rad,
        .in_value = pi / 2.0,
        .out_unit = unit.deg,
        .outarr = .{90},
    },
    .{
        .in_unit = unit.rad,
        .in_value = pi,
        .out_unit = unit.turn,
        .outarr = .{0.5},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 180,
        .out_unit = unit.turn,
        .outarr = .{0.5},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 0.25,
        .out_unit = unit.deg,
        .outarr = .{90},
    },
    .{
        .in_unit = unit.grad,
        .in_value = 100,
        .out_unit = unit.deg,
        .outarr = .{90},
    },

    // === NONE UNIT (alias for radian) ===
    .{
        .in_unit = unit.none,
        .in_value = 2,
        .out_unit = unit.rad,
        .outarr = .{2},
    },
    .{
        .in_unit = unit.rad,
        .in_value = 2,
        .out_unit = unit.none,
        .outarr = .{2},
    },

    // === SMALL VALUES (precision check) ===
    .{
        .in_unit = unit.deg,
        .in_value = 0.001,
        .out_unit = unit.rad,
        .outarr = .{pi / 180000.0},
    },
    .{
        .in_unit = unit.sarc,
        .in_value = 1,
        .out_unit = unit.rad,
        .outarr = .{pi / 648000.0},
    },

    // === LARGE VALUES ===
    .{
        .in_unit = unit.turn,
        .in_value = 100,
        .out_unit = unit.rad,
        .outarr = .{pix2 * 100},
    },
    .{
        .in_unit = unit.marc,
        .in_value = 1000000.0,
        .out_unit = unit.rad,
        .outarr = .{(1000000.0 * pi) / 10800.0},
    },
};
