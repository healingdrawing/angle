const std = @import("std");
const dp = @import("utils/debug.zig");
const report = @import("tests/report.zig");

const USETYPE = f64; // only f32 or f64
const epsilon: USETYPE = if (USETYPE == f32) 1e-6 else 1e-12;

const test_from = @import("tests/test_from.zig").test_from;
const test_add = @import("tests/test_add.zig").test_add;
const test_from_sin = @import("tests/test_from_sin.zig").test_from_sin;
const test_from_cos = @import("tests/test_from_cos.zig").test_from_cos;
const test_from_tan = @import("tests/test_from_tan.zig").test_from_tan;
const test_from_cot = @import("tests/test_from_cot.zig").test_from_cot;
const test_from_sec = @import("tests/test_from_sec.zig").test_from_sec;
const test_from_csc = @import("tests/test_from_csc.zig").test_from_csc;
const test_from_sinh = @import("tests/test_from_sinh.zig").test_from_sinh;
const test_from_cosh = @import("tests/test_from_cosh.zig").test_from_cosh;
const test_from_tanh = @import("tests/test_from_tanh.zig").test_from_tanh;
const test_from_coth = @import("tests/test_from_coth.zig").test_from_coth;
const test_from_sech = @import("tests/test_from_sech.zig").test_from_sech;
const test_from_csch = @import("tests/test_from_csch.zig").test_from_csch;
const test_cut_angle = @import("tests/test_cut_angle.zig").test_cut_angle;
const test_normalize = @import("tests/test_normalize.zig").test_normalize;

pub fn main(init: std.process.Init) !void {
    dp.init_from_env_map(init.environ_map);

    // const epsilon: f32 = 1e-6; //warning f32 with 1e-6 fails with values about 1000000, so apadtive epsilon implemented in (float.zig).floats_equal()

    const results = [_]report.MethodResult{
        // try test_from(USETYPE, epsilon),
        // try test_add(USETYPE, epsilon),
        // try test_from_sin(USETYPE, epsilon),
        // try test_from_cos(USETYPE, epsilon),
        // try test_from_tan(USETYPE, epsilon),
        // try test_from_cot(USETYPE, epsilon),
        // try test_from_sec(USETYPE, epsilon),
        // try test_from_csc(USETYPE, epsilon),
        // try test_from_sinh(USETYPE, epsilon),
        // try test_from_cosh(USETYPE, epsilon),
        // try test_from_tanh(USETYPE, epsilon),
        // try test_from_coth(USETYPE, epsilon),
        // try test_from_sech(USETYPE, epsilon),
        // try test_from_csch(USETYPE, epsilon),
        // try test_cut_angle(USETYPE, epsilon),
        try test_normalize(USETYPE, epsilon),
    };

    report.print_test_sum_report(&results);
}
