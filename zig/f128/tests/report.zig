const std = @import("std");
const dp = @import("../utils/debug.zig");

pub const MethodResult = struct {
    name: []const u8,
    total: usize,
    failed: usize,

    pub fn passed(self: MethodResult) usize {
        return self.total - self.failed;
    }
};

pub fn print_test_sum_report(results: []const MethodResult) void {
    var total_executed: usize = 0;
    var total_failed: usize = 0;

    for (results) |r| {
        total_executed += r.total;
        total_failed += r.failed;
    }
    const total_passed = total_executed - total_failed;

    const pct = struct {
        fn f(part: usize, whole: usize) usize {
            if (whole == 0) return 0;
            return (part * 100) / whole;
        }
    }.f;

    dp.rawlog(.{ "summary ", results.len, " methods tested" }, .green);
    dp.rawlog(.{ pct(total_executed, total_executed), "% tests executed: ", total_executed }, .green);
    const passed = pct(total_passed, total_executed);
    dp.rawlog(.{ passed, "% tests passed: ", total_passed }, .green);

    if (total_failed > 0) {
        dp.rawlog(.{ 100 - passed, "% tests failed : ", total_failed }, .magenta);
        for (results) |r| {
            if (r.failed > 0) {
                dp.rawerrlog(.{ r.failed, if (r.failed == 1) " test failed by " else " tests failed by ", r.name });
            }
        }
    } else {
        dp.rawlog(.{ 100 - passed, "% tests failed : ", total_failed }, .green);
    }
}
