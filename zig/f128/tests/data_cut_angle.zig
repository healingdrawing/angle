const std = @import("std");
const math = std.math;
const unit = @import("../angle.zig").AngleUnit;

pub fn TestCase(comptime T: type) type {
    return struct {
        base_unit: unit,
        base_value: T,
        cut_unit: unit,
        cut_value: T,
        out_unit: unit,
        outarr: [1]T,
    };
}

pub fn cases(comptime T: type) []const TestCase(T) {
    const uh = @import("helper.zig").unit_helper(T);
    const pi = uh.pi;
    const pix2 = pi * @as(T, 2);

    return &[_]TestCase(T){
        // === BASIC RAD SUBTRACTIONS ===
        .{
            .base_unit = unit.rad,
            .base_value = @as(T, 0),
            .cut_unit = unit.rad,
            .cut_value = @as(T, 0),
            .out_unit = unit.rad,
            .outarr = .{@as(T, 0)},
        },
        .{
            .base_unit = unit.rad,
            .base_value = @as(T, 2),
            .cut_unit = unit.rad,
            .cut_value = @as(T, 1),
            .out_unit = unit.rad,
            .outarr = .{@as(T, 1)},
        },
        .{
            .base_unit = unit.rad,
            .base_value = pi / @as(T, 2),
            .cut_unit = unit.rad,
            .cut_value = pi / @as(T, 4),
            .out_unit = unit.rad,
            .outarr = .{pi / @as(T, 4)},
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
            .base_value = @as(T, 90),
            .cut_unit = unit.deg,
            .cut_value = @as(T, 90),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 0)},
        },
        .{
            .base_unit = unit.deg,
            .base_value = @as(T, 180),
            .cut_unit = unit.deg,
            .cut_value = @as(T, 90),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 90)},
        },
        .{
            .base_unit = unit.deg,
            .base_value = @as(T, 360),
            .cut_unit = unit.deg,
            .cut_value = @as(T, 180),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 180)},
        },
        .{
            .base_unit = unit.deg,
            .base_value = @as(T, 270),
            .cut_unit = unit.deg,
            .cut_value = @as(T, 90),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 180)},
        },

        // === CROSS-UNIT SUBTRACTIONS ===
        .{
            .base_unit = unit.rad,
            .base_value = pi,
            .cut_unit = unit.deg,
            .cut_value = @as(T, 90),
            .out_unit = unit.rad,
            .outarr = .{pi / @as(T, 2)},
        },
        .{
            .base_unit = unit.deg,
            .base_value = @as(T, 180),
            .cut_unit = unit.rad,
            .cut_value = pi / @as(T, 2),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 90)},
        },
        .{
            .base_unit = unit.rad,
            .base_value = pix2,
            .cut_unit = unit.turn,
            .cut_value = @as(T, 0.5),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 180)},
        },
        .{
            .base_unit = unit.deg,
            .base_value = @as(T, 360),
            .cut_unit = unit.turn,
            .cut_value = @as(T, 0.25),
            .out_unit = unit.rad,
            .outarr = .{pix2 * @as(T, 0.75)},
        },

        // === TURN SUBTRACTIONS ===
        .{
            .base_unit = unit.turn,
            .base_value = @as(T, 1.0),
            .cut_unit = unit.turn,
            .cut_value = @as(T, 0.5),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0.5)},
        },
        .{
            .base_unit = unit.turn,
            .base_value = @as(T, 0.75),
            .cut_unit = unit.turn,
            .cut_value = @as(T, 0.25),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0.5)},
        },
        .{
            .base_unit = unit.turn,
            .base_value = @as(T, 1.0),
            .cut_unit = unit.turn,
            .cut_value = @as(T, 1.0),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0)},
        },

        // === GRAD SUBTRACTIONS ===
        .{
            .base_unit = unit.grad,
            .base_value = @as(T, 200),
            .cut_unit = unit.grad,
            .cut_value = @as(T, 100),
            .out_unit = unit.grad,
            .outarr = .{@as(T, 100)},
        },
        .{
            .base_unit = unit.grad,
            .base_value = @as(T, 400),
            .cut_unit = unit.grad,
            .cut_value = @as(T, 200),
            .out_unit = unit.grad,
            .outarr = .{@as(T, 200)},
        },
        .{
            .base_unit = unit.grad,
            .base_value = @as(T, 100),
            .cut_unit = unit.grad,
            .cut_value = @as(T, 100),
            .out_unit = unit.grad,
            .outarr = .{@as(T, 0)},
        },

        // === HEXA SUBTRACTIONS ===
        .{
            .base_unit = unit.hexa,
            .base_value = @as(T, 60),
            .cut_unit = unit.hexa,
            .cut_value = @as(T, 30),
            .out_unit = unit.hexa,
            .outarr = .{@as(T, 30)},
        },
        .{
            .base_unit = unit.hexa,
            .base_value = @as(T, 30),
            .cut_unit = unit.hexa,
            .cut_value = @as(T, 15),
            .out_unit = unit.hexa,
            .outarr = .{@as(T, 15)},
        },
        .{
            .base_unit = unit.hexa,
            .base_value = @as(T, 30),
            .cut_unit = unit.hexa,
            .cut_value = @as(T, 30),
            .out_unit = unit.hexa,
            .outarr = .{@as(T, 0)},
        },

        // === BDEG SUBTRACTIONS ===
        .{
            .base_unit = unit.bdeg,
            .base_value = @as(T, 256),
            .cut_unit = unit.bdeg,
            .cut_value = @as(T, 128),
            .out_unit = unit.bdeg,
            .outarr = .{@as(T, 128)},
        },
        .{
            .base_unit = unit.bdeg,
            .base_value = @as(T, 128),
            .cut_unit = unit.bdeg,
            .cut_value = @as(T, 64),
            .out_unit = unit.bdeg,
            .outarr = .{@as(T, 64)},
        },
        .{
            .base_unit = unit.bdeg,
            .base_value = @as(T, 64),
            .cut_unit = unit.bdeg,
            .cut_value = @as(T, 64),
            .out_unit = unit.bdeg,
            .outarr = .{@as(T, 0)},
        },

        // === MARC SUBTRACTIONS ===
        .{
            .base_unit = unit.marc,
            .base_value = @as(T, 21600),
            .cut_unit = unit.marc,
            .cut_value = @as(T, 10800),
            .out_unit = unit.marc,
            .outarr = .{@as(T, 10800)},
        },
        .{
            .base_unit = unit.marc,
            .base_value = @as(T, 10800),
            .cut_unit = unit.marc,
            .cut_value = @as(T, 5400),
            .out_unit = unit.marc,
            .outarr = .{@as(T, 5400)},
        },
        .{
            .base_unit = unit.marc,
            .base_value = @as(T, 5400),
            .cut_unit = unit.marc,
            .cut_value = @as(T, 5400),
            .out_unit = unit.marc,
            .outarr = .{@as(T, 0)},
        },

        // === SARC SUBTRACTIONS ===
        .{
            .base_unit = unit.sarc,
            .base_value = @as(T, 1296000),
            .cut_unit = unit.sarc,
            .cut_value = @as(T, 648000),
            .out_unit = unit.sarc,
            .outarr = .{@as(T, 648000)},
        },
        .{
            .base_unit = unit.sarc,
            .base_value = @as(T, 648000),
            .cut_unit = unit.sarc,
            .cut_value = @as(T, 324000),
            .out_unit = unit.sarc,
            .outarr = .{@as(T, 324000)},
        },
        .{
            .base_unit = unit.sarc,
            .base_value = @as(T, 324000),
            .cut_unit = unit.sarc,
            .cut_value = @as(T, 324000),
            .out_unit = unit.sarc,
            .outarr = .{@as(T, 0)},
        },

        // === NEGATIVE SUBTRACTIONS ===
        .{
            .base_unit = unit.deg,
            .base_value = @as(T, 90),
            .cut_unit = unit.deg,
            .cut_value = @as(T, -90),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 180)},
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
            .base_value = @as(T, 2),
            .cut_unit = unit.mulp,
            .cut_value = @as(T, 1),
            .out_unit = unit.mulp,
            .outarr = .{@as(T, 1)},
        },
        .{
            .base_unit = unit.mulp,
            .base_value = @as(T, 3),
            .cut_unit = unit.mulp,
            .cut_value = @as(T, 2),
            .out_unit = unit.mulp,
            .outarr = .{@as(T, 1)},
        },

        // === QUAD SUBTRACTIONS ===
        .{
            .base_unit = unit.quad,
            .base_value = @as(T, 4),
            .cut_unit = unit.quad,
            .cut_value = @as(T, 2),
            .out_unit = unit.quad,
            .outarr = .{@as(T, 2)},
        },
        .{
            .base_unit = unit.quad,
            .base_value = @as(T, 2),
            .cut_unit = unit.quad,
            .cut_value = @as(T, 1),
            .out_unit = unit.quad,
            .outarr = .{@as(T, 1)},
        },

        // === SEXT SUBTRACTIONS ===
        .{
            .base_unit = unit.sext,
            .base_value = @as(T, 6),
            .cut_unit = unit.sext,
            .cut_value = @as(T, 3),
            .out_unit = unit.sext,
            .outarr = .{@as(T, 3)},
        },
        .{
            .base_unit = unit.sext,
            .base_value = @as(T, 3),
            .cut_unit = unit.sext,
            .cut_value = @as(T, 1),
            .out_unit = unit.sext,
            .outarr = .{@as(T, 2)},
        },

        // === LARGE VALUES ===
        .{
            .base_unit = unit.turn,
            .base_value = @as(T, 150),
            .cut_unit = unit.turn,
            .cut_value = @as(T, 50),
            .out_unit = unit.rad,
            .outarr = .{pix2 * @as(T, 100)},
        },
        .{
            .base_unit = unit.deg,
            .base_value = @as(T, 15000),
            .cut_unit = unit.deg,
            .cut_value = @as(T, 5000),
            .out_unit = unit.rad,
            .outarr = .{(@as(T, 10000) * pi) / @as(T, 180)},
        },

        // === ZERO CUT (identity) ===
        .{
            .base_unit = unit.deg,
            .base_value = @as(T, 45),
            .cut_unit = unit.deg,
            .cut_value = @as(T, 0),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 45)},
        },
        .{
            .base_unit = unit.rad,
            .base_value = pi / @as(T, 4),
            .cut_unit = unit.rad,
            .cut_value = @as(T, 0),
            .out_unit = unit.rad,
            .outarr = .{pi / @as(T, 4)},
        },
    };
}
