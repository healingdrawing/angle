const std = @import("std");
const an = @import("angle.zig").AngleF32;

pub fn main(init: std.process.Init) !void {
    _ = init;
    var a = an.init();
    _ = a.add_deg(90);
    a.info_print(6);
}
