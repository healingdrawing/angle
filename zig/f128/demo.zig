const std = @import("std");
const anf32 = @import("angle.zig").AngleF32;
const an = @import("angle.zig").Angle;
const unit = @import("angle.zig").AngleUnit;

pub fn main(init: std.process.Init) !void {
    _ = init;
    var a = anf32.init();
    _ = a.add_deg(90);
    a.info_print(6);

    var b = an(f128).init();
    _ = b.add(unit.deg, 45).add_deg(-15);
    b.info_print(10);

    var c = an(f64).init();
    std.debug.print("about 60 deg + 360 deg(1 turn) - 360 deg(normalize) = {any}\n", .{c.add_deg(60).add_turn(1).normalize().deg()});
    std.debug.print("chain mutated c to 60 deg = {any} deg\n", .{c.deg()});
}
