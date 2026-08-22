const std = @import("std");
const dp = @import("../utils/debug.zig");
const data_from_csc = @import("data_from_csc.zig");
const floatUtils = @import("float.zig");
const Angle = @import("../angle.zig").Angle;
const unit = @import("../angle.zig").AngleUnit;
const report = @import("report.zig");

pub fn test_from_csc(comptime T: type, epsilon: T) !report.MethodResult {
    const allocator = std.heap.page_allocator;
    var failed: usize = 0;

    const angle = Angle(T);

    dp.devlog(.{"Running Angle.from_csc tests..."});

    for (data_from_csc.cases(T)) |tcase| {
        // Call Zig method
        const zig_angle = angle.from_csc(tcase.in_value);

        const zig_result = switch (tcase.out_unit) {
            unit.turn => try floatUtils.to_array(T, allocator, zig_angle.turn()),
            unit.mulp => try floatUtils.to_array(T, allocator, zig_angle.mulp()),
            unit.quad => try floatUtils.to_array(T, allocator, zig_angle.quad()),
            unit.sext => try floatUtils.to_array(T, allocator, zig_angle.sext()),
            unit.rad => try floatUtils.to_array(T, allocator, zig_angle.rad()),
            unit.hexa => try floatUtils.to_array(T, allocator, zig_angle.hexa()),
            unit.bdeg => try floatUtils.to_array(T, allocator, zig_angle.bdeg()),
            unit.deg => try floatUtils.to_array(T, allocator, zig_angle.deg()),
            unit.grad => try floatUtils.to_array(T, allocator, zig_angle.grad()),
            unit.marc => try floatUtils.to_array(T, allocator, zig_angle.marc()),
            unit.sarc => try floatUtils.to_array(T, allocator, zig_angle.sarc()),
        };
        defer allocator.free(zig_result);

        // Call TS bridge
        const data_str = try floatUtils.vectors_to_string(T, allocator, .{ tcase.in_value, @intFromEnum(tcase.out_unit) });
        defer allocator.free(data_str);

        var t_io = std.Io.Threaded.init(allocator, .{});
        defer t_io.deinit();
        const io = t_io.io();

        const cmd = try std.fmt.allocPrint(allocator, "/home/user/.bun/bin/bun ../../ts/terminalcall.ts from_csc {s}", .{data_str});
        defer allocator.free(cmd);

        const result = try std.process.run(allocator, io, .{
            .argv = &.{ "sh", "-c", cmd },
            .cwd = .inherit,
        });

        defer allocator.free(result.stdout);
        defer allocator.free(result.stderr);

        // Parse TS result
        const ts_result = try floatUtils.parse_float_result(T, allocator, result.stdout);
        defer allocator.free(ts_result);

        // Expected from data file (zero-cost)
        const expected: []const T = &tcase.outarr;

        const ok_zig_exp = try floatUtils.arrays_equal(T, zig_result, expected, epsilon);
        const ok_ts_exp = try floatUtils.arrays_equal(T, ts_result, expected, epsilon);
        const ok_zig_ts = try floatUtils.arrays_equal(T, zig_result, ts_result, epsilon);

        if (ok_zig_ts and ok_zig_exp and ok_ts_exp) {
            std.debug.print("✓ Angle.from_csc({d}){any}() = {any}\n", .{ tcase.in_value, tcase.out_unit, zig_result });
        } else {
            failed += 1;
            dp.errlog(.{
                "✗ Angle.from_csc",
                "in_value",
                tcase.in_value,
                "out_unit",
                tcase.out_unit,
                "zig_result",
                zig_result,
                "ts_result",
                ts_result,
                "expected",
                expected,
                "data_str",
                data_str,
            });
        }
    }
    return .{
        .name = "Angle.from_csc",
        .total = data_from_csc.cases(T).len,
        .failed = failed,
    };
}
