const std = @import("std");
const dp = @import("../utils/debug.zig");
const data_cut_angle = @import("data_cut_angle.zig");
const floatUtils = @import("float.zig");
const angle = @import("../angle.zig").AngleF32;
const unit = @import("../angle.zig").AngleUnit;
const report = @import("report.zig");

pub fn test_cut_angle(epsilon: f32) !report.MethodResult {
    const allocator = std.heap.page_allocator;
    var failed: usize = 0;

    dp.devlog(.{"Running Angle.cut_angle tests..."});

    for (data_cut_angle.cases) |tcase| {
        // Call Zig method
        var zig_angle = angle.from(tcase.base_unit, tcase.base_value);
        const cut_angle_obj = angle.from(tcase.cut_unit, tcase.cut_value);
        _ = zig_angle.cut_angle(&cut_angle_obj);

        const zig_result = switch (tcase.out_unit) {
            unit.turn => try floatUtils.to_array(allocator, zig_angle.turn()),
            unit.mulp => try floatUtils.to_array(allocator, zig_angle.mulp()),
            unit.quad => try floatUtils.to_array(allocator, zig_angle.quad()),
            unit.sext => try floatUtils.to_array(allocator, zig_angle.sext()),
            unit.rad => try floatUtils.to_array(allocator, zig_angle.rad()),
            unit.hexa => try floatUtils.to_array(allocator, zig_angle.hexa()),
            unit.bdeg => try floatUtils.to_array(allocator, zig_angle.bdeg()),
            unit.deg => try floatUtils.to_array(allocator, zig_angle.deg()),
            unit.grad => try floatUtils.to_array(allocator, zig_angle.grad()),
            unit.marc => try floatUtils.to_array(allocator, zig_angle.marc()),
            unit.sarc => try floatUtils.to_array(allocator, zig_angle.sarc()),
        };
        defer allocator.free(zig_result);

        // Call TS bridge
        const data_str = try floatUtils.vectors_to_string(allocator, .{ @intFromEnum(tcase.base_unit), tcase.base_value, @intFromEnum(tcase.cut_unit), tcase.cut_value, @intFromEnum(tcase.out_unit) });
        defer allocator.free(data_str);
        // std.debug.print("data_str {s}", .{data_str});

        var t_io = std.Io.Threaded.init(allocator, .{});
        defer t_io.deinit();
        const io = t_io.io();

        const cmd = try std.fmt.allocPrint(allocator, "/home/user/.bun/bin/bun ../../ts/terminalcall.ts cut_angle {s}", .{data_str});
        defer allocator.free(cmd);

        const result = try std.process.run(allocator, io, .{
            .argv = &.{ "sh", "-c", cmd },
            .cwd = .inherit,
        });

        defer allocator.free(result.stdout);
        defer allocator.free(result.stderr);

        // Parse TS result
        const ts_result = try floatUtils.parse_float_result(allocator, result.stdout);
        defer allocator.free(ts_result);

        // expected from data file (zero-cost)
        const expected: []const f32 = &tcase.outarr;

        const ok_zig_exp = try floatUtils.arrays_equal(zig_result, expected, epsilon);
        const ok_ts_exp = try floatUtils.arrays_equal(ts_result, expected, epsilon);
        const ok_zig_ts = try floatUtils.arrays_equal(zig_result, ts_result, epsilon);

        if (ok_zig_ts and ok_zig_exp and ok_ts_exp) {
            std.debug.print("✓ Angle.from({any}, {any}).cut_angle(from({any}, {any})){any}() = {any}\n", .{ tcase.base_unit, tcase.base_value, tcase.cut_unit, tcase.cut_value, tcase.out_unit, zig_result });
        } else {
            failed += 1;
            dp.errlog(.{
                "✗ Angle.cut_angle",
                "base_unit",
                tcase.base_unit,
                "base_value",
                tcase.base_value,
                "cut_unit",
                tcase.cut_unit,
                "cut_value",
                tcase.cut_value,
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
        .name = "Angle.cut_angle",
        .total = data_cut_angle.cases.len,
        .failed = failed,
    };
}
