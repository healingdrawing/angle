const std = @import("std");
const math = std.math;
const unit = @import("../angle.zig").AngleUnit;

pub const TestCase = struct {
    in_unit: unit,
    value: f32,
    out_unit: unit,
    outarr: [1]f32,
};

const pi = math.pi;
const pix2 = math.pi * 2;

pub const cases = [_]TestCase{
    // === RADIAN BASE TESTS ===
    .{
        .in_unit = unit.rad,
        .value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.rad,
        .value = 2,
        .out_unit = unit.rad,
        .outarr = .{2},
    },
    .{
        .in_unit = unit.rad,
        .value = pi,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.rad,
        .value = -pi,
        .out_unit = unit.rad,
        .outarr = .{-pi},
    },

    // === TURN TESTS ===
    .{
        .in_unit = unit.turn,
        .value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.turn,
        .value = 1,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },
    .{
        .in_unit = unit.turn,
        .value = 0.5,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.turn,
        .value = 0.25,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.turn,
        .value = 2,
        .out_unit = unit.rad,
        .outarr = .{pix2 * 2},
    },

    // === MULP (PI) TESTS ===
    .{
        .in_unit = unit.mulp,
        .value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.mulp,
        .value = 1,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.mulp,
        .value = 2,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },
    .{
        .in_unit = unit.mulp,
        .value = -1,
        .out_unit = unit.rad,
        .outarr = .{-pi},
    },

    // === QUAD TESTS ===
    .{
        .in_unit = unit.quad,
        .value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.quad,
        .value = 1,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.quad,
        .value = 2,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.quad,
        .value = 4,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === SEXT TESTS ===
    .{
        .in_unit = unit.sext,
        .value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.sext,
        .value = 1,
        .out_unit = unit.rad,
        .outarr = .{pi / 3.0},
    },
    .{
        .in_unit = unit.sext,
        .value = 3,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.sext,
        .value = 6,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === DEGREE TESTS ===
    .{
        .in_unit = unit.deg,
        .value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.deg,
        .value = 45,
        .out_unit = unit.rad,
        .outarr = .{pi / 4.0},
    },
    .{
        .in_unit = unit.deg,
        .value = 90,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.deg,
        .value = 180,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.deg,
        .value = 360,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },
    .{
        .in_unit = unit.deg,
        .value = -90,
        .out_unit = unit.rad,
        .outarr = .{-pi / 2.0},
    },

    // === GRAD TESTS ===
    .{
        .in_unit = unit.grad,
        .value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.grad,
        .value = 100,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.grad,
        .value = 200,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.grad,
        .value = 400,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === HEXA TESTS (π/30 per hexa) ===
    .{
        .in_unit = unit.hexa,
        .value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.hexa,
        .value = 15,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.hexa,
        .value = 30,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.hexa,
        .value = 60,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === BINARY DEGREES (π/128 per bdeg) ===
    .{
        .in_unit = unit.bdeg,
        .value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.bdeg,
        .value = 64,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.bdeg,
        .value = 128,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.bdeg,
        .value = 256,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === MINUTE OF ARC TESTS ===
    .{
        .in_unit = unit.marc,
        .value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.marc,
        .value = 5400,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.marc,
        .value = 10800,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.marc,
        .value = 21600,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === SECOND OF ARC TESTS ===
    .{
        .in_unit = unit.sarc,
        .value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.sarc,
        .value = 324000,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.sarc,
        .value = 648000,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.sarc,
        .value = 1296000,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === CROSS-UNIT OUTPUT TESTS ===
    .{
        .in_unit = unit.rad,
        .value = pi / 2.0,
        .out_unit = unit.deg,
        .outarr = .{90},
    },
    .{
        .in_unit = unit.rad,
        .value = pi,
        .out_unit = unit.turn,
        .outarr = .{0.5},
    },
    .{
        .in_unit = unit.deg,
        .value = 180,
        .out_unit = unit.turn,
        .outarr = .{0.5},
    },
    .{
        .in_unit = unit.turn,
        .value = 0.25,
        .out_unit = unit.deg,
        .outarr = .{90},
    },
    .{
        .in_unit = unit.grad,
        .value = 100,
        .out_unit = unit.deg,
        .outarr = .{90},
    },

    // === NONE UNIT (alias for radian) ===
    .{
        .in_unit = unit.none,
        .value = 2,
        .out_unit = unit.rad,
        .outarr = .{2},
    },
    .{
        .in_unit = unit.rad,
        .value = 2,
        .out_unit = unit.none,
        .outarr = .{2},
    },

    // === SMALL VALUES (precision check) ===
    .{
        .in_unit = unit.deg,
        .value = 0.001,
        .out_unit = unit.rad,
        .outarr = .{pi / 180000.0},
    },
    .{
        .in_unit = unit.sarc,
        .value = 1,
        .out_unit = unit.rad,
        .outarr = .{pi / 648000.0},
    },

    // === LARGE VALUES ===
    .{
        .in_unit = unit.turn,
        .value = 100,
        .out_unit = unit.rad,
        .outarr = .{pix2 * 100},
    },
    .{
        .in_unit = unit.marc,
        .value = 1000000.0,
        .out_unit = unit.rad,
        .outarr = .{(1000000.0 * pi) / 10800.0},
    },
};
