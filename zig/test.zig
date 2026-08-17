const std = @import("std");
const dp = @import("utils/debug.zig");
const report = @import("tests/report.zig");

const test_from = @import("tests/test_from.zig").test_from;

pub fn main(init: std.process.Init) !void {
    dp.init_from_env_map(init.environ_map);

    const epsilon: f32 = 1e-6;

    const results = [_]report.MethodResult{
        try test_from(epsilon),
    };

    report.print_test_sum_report(&results);
}
