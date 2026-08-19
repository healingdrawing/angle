const std = @import("std");
const dp = @import("utils/debug.zig");
const report = @import("tests/report.zig");

const test_from = @import("tests/test_from.zig").test_from;
const test_add = @import("tests/test_add.zig").test_add;
const test_from_sin = @import("tests/test_from_sin.zig").test_from_sin;
const test_from_cos = @import("tests/test_from_cos.zig").test_from_cos;
const test_from_tan = @import("tests/test_from_tan.zig").test_from_tan;
const test_from_cot = @import("tests/test_from_cot.zig").test_from_cot;
const test_from_sec = @import("tests/test_from_sec.zig").test_from_sec;

pub fn main(init: std.process.Init) !void {
    dp.init_from_env_map(init.environ_map);

    const epsilon: f32 = 1e-6; //warning f32 with 1e-6 fails with values about 1000000, so apadtive epsilon implemented in (float.zig).floats_equal()

    const results = [_]report.MethodResult{
        try test_from(epsilon),
        try test_add(epsilon),
        try test_from_sin(epsilon),
        try test_from_cos(epsilon),
        try test_from_tan(epsilon),
        try test_from_cot(epsilon),
        try test_from_sec(epsilon),
    };

    report.print_test_sum_report(&results);
}
