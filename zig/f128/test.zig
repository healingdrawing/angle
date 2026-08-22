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

    const epsilon: f128 = 1e-13;

    const results = [_]report.MethodResult{
        try test_from(epsilon),
        try test_add(epsilon),
        try test_from_sin(epsilon),
        try test_from_cos(epsilon),
        try test_from_tan(epsilon),
        try test_from_cot(epsilon),
        try test_from_sec(epsilon),
        try test_from_csc(epsilon),
        try test_from_sinh(epsilon),
        try test_from_cosh(epsilon),
        try test_from_tanh(epsilon),
        try test_from_coth(epsilon),
        try test_from_sech(epsilon),
        try test_from_csch(epsilon),
        try test_cut_angle(epsilon),
        try test_normalize(epsilon),
    };

    report.print_test_sum_report(&results);
}
