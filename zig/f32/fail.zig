// bullshit.zig
const std = @import("std");

pub fn main() !void {
    const f32_a: f32 = 9_000_000_000.5;
    const f32_b: f32 = 1_000_000_000.0;

    const f64_a: f64 = 9_000_000_000.5;
    const f64_b: f64 = 1_000_000_000.0;

    std.debug.print("f32:\n", .{});
    std.debug.print("  {d} - {d} = {d}\n", .{ f32_a, f32_b, f32_a - f32_b });
    std.debug.print("  Expected: 8000000000.5\n", .{});
    std.debug.print("  Got:      {d}\n", .{f32_a - f32_b});
    std.debug.print("\n", .{});

    std.debug.print("f64:\n", .{});
    std.debug.print("  {d} - {d} = {d}\n", .{ f64_a, f64_b, f64_a - f64_b });
    std.debug.print("  Expected: 8000000000.5\n", .{});
    std.debug.print("  Got:      {d}\n", .{f64_a - f64_b});
}
