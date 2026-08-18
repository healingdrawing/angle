const std = @import("std");
const math = std.math;
const unit = @import("../angle.zig").AngleUnit;

pub const TestCase = struct {
    in_unit: unit,
    in_value: f32,
    add_unit: unit,
    add_value: f32,
    out_unit: unit,
    outarr: [1]f32,
};

const pi = math.pi;
const pix2 = pi * 2;

pub const cases = [_]TestCase{
    // === BASIC RAD ADDITIONS ===
    .{
        .in_unit = unit.rad,
        .in_value = 0,
        .add_unit = unit.rad,
        .add_value = 0,
        .out_unit = unit.rad,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.rad,
        .in_value = 1,
        .add_unit = unit.rad,
        .add_value = 1,
        .out_unit = unit.rad,
        .outarr = .{2},
    },
    .{
        .in_unit = unit.rad,
        .in_value = pi / 4.0,
        .add_unit = unit.rad,
        .add_value = pi / 4.0,
        .out_unit = unit.rad,
        .outarr = .{pi / 2.0},
    },
    .{
        .in_unit = unit.rad,
        .in_value = pi,
        .add_unit = unit.rad,
        .add_value = pi,
        .out_unit = unit.rad,
        .outarr = .{pix2},
    },

    // === DEGREE ADDITIONS ===
    .{
        .in_unit = unit.deg,
        .in_value = 0,
        .add_unit = unit.deg,
        .add_value = 90,
        .out_unit = unit.deg,
        .outarr = .{90},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 45,
        .add_unit = unit.deg,
        .add_value = 45,
        .out_unit = unit.deg,
        .outarr = .{90},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 90,
        .add_unit = unit.deg,
        .add_value = 90,
        .out_unit = unit.deg,
        .outarr = .{180},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 180,
        .add_unit = unit.deg,
        .add_value = 180,
        .out_unit = unit.deg,
        .outarr = .{360},
    },

    // === CROSS-UNIT ADDITIONS ===
    .{
        .in_unit = unit.rad,
        .in_value = pi / 2.0,
        .add_unit = unit.deg,
        .add_value = 90,
        .out_unit = unit.rad,
        .outarr = .{pi},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 90,
        .add_unit = unit.rad,
        .add_value = pi / 2.0,
        .out_unit = unit.deg,
        .outarr = .{180},
    },
    .{
        .in_unit = unit.rad,
        .in_value = pi,
        .add_unit = unit.turn,
        .add_value = 0.25,
        .out_unit = unit.deg,
        .outarr = .{270},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 180,
        .add_unit = unit.turn,
        .add_value = 0.25,
        .out_unit = unit.rad,
        .outarr = .{pix2 * 0.75},
    },

    // === TURN ADDITIONS ===
    .{
        .in_unit = unit.turn,
        .in_value = 0,
        .add_unit = unit.turn,
        .add_value = 0.5,
        .out_unit = unit.turn,
        .outarr = .{0.5},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 0.25,
        .add_unit = unit.turn,
        .add_value = 0.25,
        .out_unit = unit.turn,
        .outarr = .{0.5},
    },
    .{
        .in_unit = unit.turn,
        .in_value = 0.5,
        .add_unit = unit.turn,
        .add_value = 0.5,
        .out_unit = unit.turn,
        .outarr = .{1.0},
    },

    // === GRAD ADDITIONS ===
    .{
        .in_unit = unit.grad,
        .in_value = 0,
        .add_unit = unit.grad,
        .add_value = 100,
        .out_unit = unit.grad,
        .outarr = .{100},
    },
    .{
        .in_unit = unit.grad,
        .in_value = 100,
        .add_unit = unit.grad,
        .add_value = 100,
        .out_unit = unit.grad,
        .outarr = .{200},
    },
    .{
        .in_unit = unit.grad,
        .in_value = 200,
        .add_unit = unit.grad,
        .add_value = 200,
        .out_unit = unit.grad,
        .outarr = .{400},
    },

    // === HEXA ADDITIONS ===
    .{
        .in_unit = unit.hexa,
        .in_value = 0,
        .add_unit = unit.hexa,
        .add_value = 15,
        .out_unit = unit.hexa,
        .outarr = .{15},
    },
    .{
        .in_unit = unit.hexa,
        .in_value = 30,
        .add_unit = unit.hexa,
        .add_value = 30,
        .out_unit = unit.hexa,
        .outarr = .{60},
    },

    // === BDEG ADDITIONS ===
    .{
        .in_unit = unit.bdeg,
        .in_value = 0,
        .add_unit = unit.bdeg,
        .add_value = 64,
        .out_unit = unit.bdeg,
        .outarr = .{64},
    },
    .{
        .in_unit = unit.bdeg,
        .in_value = 128,
        .add_unit = unit.bdeg,
        .add_value = 128,
        .out_unit = unit.bdeg,
        .outarr = .{256},
    },

    // === MARC ADDITIONS ===
    .{
        .in_unit = unit.marc,
        .in_value = 0,
        .add_unit = unit.marc,
        .add_value = 5400,
        .out_unit = unit.marc,
        .outarr = .{5400},
    },
    .{
        .in_unit = unit.marc,
        .in_value = 10800,
        .add_unit = unit.marc,
        .add_value = 10800,
        .out_unit = unit.marc,
        .outarr = .{21600},
    },

    // === SARC ADDITIONS ===
    .{
        .in_unit = unit.sarc,
        .in_value = 0,
        .add_unit = unit.sarc,
        .add_value = 324000,
        .out_unit = unit.sarc,
        .outarr = .{324000},
    },
    .{
        .in_unit = unit.sarc,
        .in_value = 648000,
        .add_unit = unit.sarc,
        .add_value = 648000,
        .out_unit = unit.sarc,
        .outarr = .{1296000},
    },

    // === NEGATIVE ADDITIONS ===
    .{
        .in_unit = unit.deg,
        .in_value = 90,
        .add_unit = unit.deg,
        .add_value = -90,
        .out_unit = unit.deg,
        .outarr = .{0},
    },
    .{
        .in_unit = unit.rad,
        .in_value = pi,
        .add_unit = unit.rad,
        .add_value = -pi,
        .out_unit = unit.rad,
        .outarr = .{0},
    },

    // === MULE (PI) ADDITIONS ===
    .{
        .in_unit = unit.mulp,
        .in_value = 0,
        .add_unit = unit.mulp,
        .add_value = 1,
        .out_unit = unit.mulp,
        .outarr = .{1},
    },
    .{
        .in_unit = unit.mulp,
        .in_value = 1,
        .add_unit = unit.mulp,
        .add_value = 1,
        .out_unit = unit.mulp,
        .outarr = .{2},
    },

    // === QUAD ADDITIONS ===
    .{
        .in_unit = unit.quad,
        .in_value = 0,
        .add_unit = unit.quad,
        .add_value = 1,
        .out_unit = unit.quad,
        .outarr = .{1},
    },
    .{
        .in_unit = unit.quad,
        .in_value = 2,
        .add_unit = unit.quad,
        .add_value = 2,
        .out_unit = unit.quad,
        .outarr = .{4},
    },

    // === SEXT ADDITIONS ===
    .{
        .in_unit = unit.sext,
        .in_value = 0,
        .add_unit = unit.sext,
        .add_value = 1,
        .out_unit = unit.sext,
        .outarr = .{1},
    },
    .{
        .in_unit = unit.sext,
        .in_value = 3,
        .add_unit = unit.sext,
        .add_value = 3,
        .out_unit = unit.sext,
        .outarr = .{6},
    },

    // === LARGE VALUES ===
    .{
        .in_unit = unit.turn,
        .in_value = 100,
        .add_unit = unit.turn,
        .add_value = 50,
        .out_unit = unit.rad,
        .outarr = .{pix2 * 150},
    },
    .{
        .in_unit = unit.deg,
        .in_value = 10000,
        .add_unit = unit.deg,
        .add_value = 5000,
        .out_unit = unit.rad,
        .outarr = .{(15000.0 * pi) / 180.0},
    },
};
