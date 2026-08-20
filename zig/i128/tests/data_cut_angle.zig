const std = @import("std");
const math = std.math;
const unit = @import("../angle.zig").AngleUnit;
const uh = @import("helper.zig").unit_helper;

pub const TestCase = struct {
    base_unit: unit,
    base_value: f32,
    cut_unit: unit,
    cut_value: f32,
    out_unit: unit,
    outarr: [1]f32,
};

const pi = uh.pi;
const pix2 = pi * 2;

pub const cases = [_]TestCase{
    // === BASIC RAD SUBTRACTIONS ===
    .{
        .base_unit = unit.rad,
        .base_value = 0,
        .cut_unit = unit.rad,
        .cut_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .base_unit = unit.rad,
        .base_value = 2,
        .cut_unit = unit.rad,
        .cut_value = 1,
        .out_unit = unit.rad,
        .outarr = .{1},
    },
    .{
        .base_unit = unit.rad,
        .base_value = pi / 2.0,
        .cut_unit = unit.rad,
        .cut_value = pi / 4.0,
        .out_unit = unit.rad,
        .outarr = .{pi / 4.0},
    },
    .{
        .base_unit = unit.rad,
        .base_value = pix2,
        .cut_unit = unit.rad,
        .cut_value = pi,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },

    // === DEGREE SUBTRACTIONS ===
    .{
        .base_unit = unit.deg,
        .base_value = 90,
        .cut_unit = unit.deg,
        .cut_value = 90,
        .out_unit = unit.deg,
        .outarr = .{0},
    },
    .{
        .base_unit = unit.deg,
        .base_value = 180,
        .cut_unit = unit.deg,
        .cut_value = 90,
        .out_unit = unit.deg,
        .outarr = .{90},
    },
    .{
        .base_unit = unit.deg,
        .base_value = 360,
        .cut_unit = unit.deg,
        .cut_value = 180,
        .out_unit = unit.deg,
        .outarr = .{180},
    },
    .{
        .base_unit = unit.deg,
        .base_value = 270,
        .cut_unit = unit.deg,
        .cut_value = 90,
        .out_unit = unit.deg,
        .outarr = .{180},
    },

    // === CROSS-UNIT SUBTRACTIONS ===
    .{
        .base_unit = unit.rad,
        .base_value = pi,
        .cut_unit = unit.deg,
        .cut_value = 90,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .base_unit = unit.deg,
        .base_value = 180,
        .cut_unit = unit.rad,
        .cut_value = pi / 2.0,
        .out_unit = unit.deg,
        .outarr = .{90},
    },
    .{
        .base_unit = unit.rad,
        .base_value = pix2,
        .cut_unit = unit.turn,
        .cut_value = 0.5,
        .out_unit = unit.deg,
        .outarr = .{180},
    },
    .{
        .base_unit = unit.deg,
        .base_value = 360,
        .cut_unit = unit.turn,
        .cut_value = 0.25,
        .out_unit = unit.rad,
        .outarr = .{pix2 * 0.75},
    },

    // === TURN SUBTRACTIONS ===
    .{
        .base_unit = unit.turn,
        .base_value = 1.0,
        .cut_unit = unit.turn,
        .cut_value = 0.5,
        .out_unit = unit.turn,
        .outarr = .{0.5},
    },
    .{
        .base_unit = unit.turn,
        .base_value = 0.75,
        .cut_unit = unit.turn,
        .cut_value = 0.25,
        .out_unit = unit.turn,
        .outarr = .{0.5},
    },
    .{
        .base_unit = unit.turn,
        .base_value = 1.0,
        .cut_unit = unit.turn,
        .cut_value = 1.0,
        .out_unit = unit.turn,
        .outarr = .{0},
    },

    // === GRAD SUBTRACTIONS ===
    .{
        .base_unit = unit.grad,
        .base_value = 200,
        .cut_unit = unit.grad,
        .cut_value = 100,
        .out_unit = unit.grad,
        .outarr = .{100},
    },
    .{
        .base_unit = unit.grad,
        .base_value = 400,
        .cut_unit = unit.grad,
        .cut_value = 200,
        .out_unit = unit.grad,
        .outarr = .{200},
    },
    .{
        .base_unit = unit.grad,
        .base_value = 100,
        .cut_unit = unit.grad,
        .cut_value = 100,
        .out_unit = unit.grad,
        .outarr = .{0},
    },

    // === HEXA SUBTRACTIONS ===
    .{
        .base_unit = unit.hexa,
        .base_value = 60,
        .cut_unit = unit.hexa,
        .cut_value = 30,
        .out_unit = unit.hexa,
        .outarr = .{30},
    },
    .{
        .base_unit = unit.hexa,
        .base_value = 30,
        .cut_unit = unit.hexa,
        .cut_value = 15,
        .out_unit = unit.hexa,
        .outarr = .{15},
    },
    .{
        .base_unit = unit.hexa,
        .base_value = 30,
        .cut_unit = unit.hexa,
        .cut_value = 30,
        .out_unit = unit.hexa,
        .outarr = .{0},
    },

    // === BDEG SUBTRACTIONS ===
    .{
        .base_unit = unit.bdeg,
        .base_value = 256,
        .cut_unit = unit.bdeg,
        .cut_value = 128,
        .out_unit = unit.bdeg,
        .outarr = .{128},
    },
    .{
        .base_unit = unit.bdeg,
        .base_value = 128,
        .cut_unit = unit.bdeg,
        .cut_value = 64,
        .out_unit = unit.bdeg,
        .outarr = .{64},
    },
    .{
        .base_unit = unit.bdeg,
        .base_value = 64,
        .cut_unit = unit.bdeg,
        .cut_value = 64,
        .out_unit = unit.bdeg,
        .outarr = .{0},
    },

    // === MARC SUBTRACTIONS ===
    .{
        .base_unit = unit.marc,
        .base_value = 21600,
        .cut_unit = unit.marc,
        .cut_value = 10800,
        .out_unit = unit.marc,
        .outarr = .{10800},
    },
    .{
        .base_unit = unit.marc,
        .base_value = 10800,
        .cut_unit = unit.marc,
        .cut_value = 5400,
        .out_unit = unit.marc,
        .outarr = .{5400},
    },
    .{
        .base_unit = unit.marc,
        .base_value = 5400,
        .cut_unit = unit.marc,
        .cut_value = 5400,
        .out_unit = unit.marc,
        .outarr = .{0},
    },

    // === SARC SUBTRACTIONS ===
    .{
        .base_unit = unit.sarc,
        .base_value = 1296000,
        .cut_unit = unit.sarc,
        .cut_value = 648000,
        .out_unit = unit.sarc,
        .outarr = .{648000},
    },
    .{
        .base_unit = unit.sarc,
        .base_value = 648000,
        .cut_unit = unit.sarc,
        .cut_value = 324000,
        .out_unit = unit.sarc,
        .outarr = .{324000},
    },
    .{
        .base_unit = unit.sarc,
        .base_value = 324000,
        .cut_unit = unit.sarc,
        .cut_value = 324000,
        .out_unit = unit.sarc,
        .outarr = .{0},
    },

    // === NEGATIVE SUBTRACTIONS ===
    .{
        .base_unit = unit.deg,
        .base_value = 90,
        .cut_unit = unit.deg,
        .cut_value = -90,
        .out_unit = unit.deg,
        .outarr = .{180},
    },
    .{
        .base_unit = unit.rad,
        .base_value = pi,
        .cut_unit = unit.rad,
        .cut_value = -pi,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === MULP (PI) SUBTRACTIONS ===
    .{
        .base_unit = unit.mulp,
        .base_value = 2,
        .cut_unit = unit.mulp,
        .cut_value = 1,
        .out_unit = unit.mulp,
        .outarr = .{1},
    },
    .{
        .base_unit = unit.mulp,
        .base_value = 3,
        .cut_unit = unit.mulp,
        .cut_value = 2,
        .out_unit = unit.mulp,
        .outarr = .{1},
    },

    // === QUAD SUBTRACTIONS ===
    .{
        .base_unit = unit.quad,
        .base_value = 4,
        .cut_unit = unit.quad,
        .cut_value = 2,
        .out_unit = unit.quad,
        .outarr = .{2},
    },
    .{
        .base_unit = unit.quad,
        .base_value = 2,
        .cut_unit = unit.quad,
        .cut_value = 1,
        .out_unit = unit.quad,
        .outarr = .{1},
    },

    // === SEXT SUBTRACTIONS ===
    .{
        .base_unit = unit.sext,
        .base_value = 6,
        .cut_unit = unit.sext,
        .cut_value = 3,
        .out_unit = unit.sext,
        .outarr = .{3},
    },
    .{
        .base_unit = unit.sext,
        .base_value = 3,
        .cut_unit = unit.sext,
        .cut_value = 1,
        .out_unit = unit.sext,
        .outarr = .{2},
    },

    // === LARGE VALUES ===
    .{
        .base_unit = unit.turn,
        .base_value = 150,
        .cut_unit = unit.turn,
        .cut_value = 50,
        .out_unit = unit.rad,
        .outarr = .{pix2 * 100},
    },
    .{
        .base_unit = unit.deg,
        .base_value = 15000,
        .cut_unit = unit.deg,
        .cut_value = 5000,
        .out_unit = unit.rad,
        .outarr = .{(10000.0 * pi) / 180.0},
    },

    // === ZERO CUT (identity) ===
    .{
        .base_unit = unit.deg,
        .base_value = 45,
        .cut_unit = unit.deg,
        .cut_value = 0,
        .out_unit = unit.deg,
        .outarr = .{45},
    },
    .{
        .base_unit = unit.rad,
        .base_value = pi / 4.0,
        .cut_unit = unit.rad,
        .cut_value = 0,
        .out_unit = unit.rad,
        .outarr = .{pi / 4.0},
    },
};
