const std = @import("std");
const math = std.math;
const unit = @import("../angle.zig").AngleUnit;

pub fn TestCase(comptime T: type) type {
    return struct {
        in_unit: unit,
        in_value: T,
        out_unit: unit,
        outarr: [1]T,
    };
}

pub fn cases(comptime T: type) []const TestCase(T) {
    const uh = @import("helper.zig").unit_helper(T);
    const pi = uh.pi;
    const pix2 = pi * 2;

    return &[_]TestCase(T){
        // === ZERO VALUES ===
        .{
            .in_unit = unit.rad,
            .in_value = @as(T, 0),
            .out_unit = unit.rad,
            .outarr = .{@as(T, 0)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, 0),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 0)},
        },
        .{
            .in_unit = unit.turn,
            .in_value = @as(T, 0),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0)},
        },

        // === SMALL POSITIVE VALUES ===
        .{
            .in_unit = unit.rad,
            .in_value = pi / @as(T, 4),
            .out_unit = unit.rad,
            .outarr = .{pi / @as(T, 4)},
        },
        .{
            .in_unit = unit.rad,
            .in_value = pi,
            .out_unit = unit.rad,
            .outarr = .{pi},
        },
        .{
            .in_unit = unit.rad,
            .in_value = pi * @as(T, 1.5),
            .out_unit = unit.rad,
            .outarr = .{pi * @as(T, 1.5)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, 45),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 45)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, 180),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 180)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, 359),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 359)},
        },

        // === 2π BOUNDARY ===
        .{
            .in_unit = unit.rad,
            .in_value = pix2,
            .out_unit = unit.rad,
            .outarr = .{@as(T, 0)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, 360),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 0)},
        },
        .{
            .in_unit = unit.turn,
            .in_value = @as(T, 1),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0)},
        },

        // === ABOVE 2π ===
        .{
            .in_unit = unit.rad,
            .in_value = pix2 + pi / @as(T, 4),
            .out_unit = unit.rad,
            .outarr = .{pi / @as(T, 4)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, 405),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 45)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, 450),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 90)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, 780), // 720 + 60
            .out_unit = unit.deg,
            .outarr = .{@as(T, 60)},
        },
        .{
            .in_unit = unit.turn,
            .in_value = @as(T, 1.25),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0.25)},
        },
        .{
            .in_unit = unit.turn,
            .in_value = @as(T, 2.75),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0.75)},
        },

        // === ABOVE MULTIPLE 2π ===
        .{
            .in_unit = unit.rad,
            .in_value = pix2 * @as(T, 3) + pi / @as(T, 3),
            .out_unit = unit.rad,
            .outarr = .{pi / @as(T, 3)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, 1200), // 1080 + 120
            .out_unit = unit.deg,
            .outarr = .{@as(T, 120)},
        },
        .{
            .in_unit = unit.turn,
            .in_value = @as(T, 5.5),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0.5)},
        },
        .{
            .in_unit = unit.turn,
            .in_value = @as(T, 10),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0)},
        },

        // === NEGATIVE VALUES ===
        .{
            .in_unit = unit.rad,
            .in_value = -pi / @as(T, 4),
            .out_unit = unit.rad,
            .outarr = .{pix2 - pi / @as(T, 4)},
        },
        .{
            .in_unit = unit.rad,
            .in_value = -pi,
            .out_unit = unit.rad,
            .outarr = .{pi},
        },
        .{
            .in_unit = unit.rad,
            .in_value = -pi * @as(T, 1.5),
            .out_unit = unit.rad,
            .outarr = .{pi / @as(T, 2)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, -45),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 315)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, -90),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 270)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, -180),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 180)},
        },
        .{
            .in_unit = unit.turn,
            .in_value = @as(T, -0.25),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0.75)},
        },
        .{
            .in_unit = unit.turn,
            .in_value = @as(T, -0.5),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0.5)},
        },
        .{
            .in_unit = unit.turn,
            .in_value = @as(T, -1),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0)},
        },

        // === LARGE NEGATIVE ===
        .{
            .in_unit = unit.rad,
            .in_value = -(pix2 + pi / @as(T, 4)),
            .out_unit = unit.rad,
            .outarr = .{pix2 - pi / @as(T, 4)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, -405), // -360 - 45
            .out_unit = unit.deg,
            .outarr = .{@as(T, 315)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, -810), // -720 - 90
            .out_unit = unit.deg,
            .outarr = .{@as(T, 270)},
        },
        .{
            .in_unit = unit.turn,
            .in_value = @as(T, -1.5),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0.5)},
        },
        .{
            .in_unit = unit.turn,
            .in_value = @as(T, -2.25),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0.75)},
        },

        // === EDGE CASES ===
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, 359.9999),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 359.9999)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, 360.0001),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 0.0001)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, -0.0001),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 359.9999)},
        },

        // === GRAD ===
        .{
            .in_unit = unit.grad,
            .in_value = @as(T, 400),
            .out_unit = unit.grad,
            .outarr = .{@as(T, 0)},
        },
        .{
            .in_unit = unit.grad,
            .in_value = @as(T, 500),
            .out_unit = unit.grad,
            .outarr = .{@as(T, 100)},
        },
        .{
            .in_unit = unit.grad,
            .in_value = @as(T, -100),
            .out_unit = unit.grad,
            .outarr = .{@as(T, 300)},
        },

        // === HEXACONDADE ===
        .{
            .in_unit = unit.hexa,
            .in_value = @as(T, 60),
            .out_unit = unit.hexa,
            .outarr = .{@as(T, 0)},
        },
        .{
            .in_unit = unit.hexa,
            .in_value = @as(T, 75),
            .out_unit = unit.hexa,
            .outarr = .{@as(T, 15)},
        },
        .{
            .in_unit = unit.hexa,
            .in_value = @as(T, -15),
            .out_unit = unit.hexa,
            .outarr = .{@as(T, 45)},
        },

        // === BINARY DEGREE ===
        .{
            .in_unit = unit.bdeg,
            .in_value = @as(T, 256),
            .out_unit = unit.bdeg,
            .outarr = .{@as(T, 0)},
        },
        .{
            .in_unit = unit.bdeg,
            .in_value = @as(T, 320),
            .out_unit = unit.bdeg,
            .outarr = .{@as(T, 64)},
        },
        .{
            .in_unit = unit.bdeg,
            .in_value = @as(T, -64),
            .out_unit = unit.bdeg,
            .outarr = .{@as(T, 192)},
        },

        // === CROSS-UNIT ===
        .{
            .in_unit = unit.rad,
            .in_value = pix2 * @as(T, 2) + pi / @as(T, 2),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 90)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, 780), // 720 + 60
            .out_unit = unit.rad,
            .outarr = .{pi / @as(T, 3)},
        },
        .{
            .in_unit = unit.turn,
            .in_value = @as(T, 3.5),
            .out_unit = unit.deg,
            .outarr = .{@as(T, 180)},
        },
        .{
            .in_unit = unit.deg,
            .in_value = @as(T, -180),
            .out_unit = unit.turn,
            .outarr = .{@as(T, 0.5)},
        },
    };
}
