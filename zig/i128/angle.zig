const std = @import("std");
const math = std.math;

pub const AngleUnit = enum(u8) {
    turn = 0,
    mulp = 1,
    quad = 2,
    sext = 3,
    rad = 4,
    hexa = 5,
    bdeg = 6,
    deg = 7,
    grad = 8,
    marc = 9,
    sarc = 10,
};

fn compile_focus(comptime T: type) struct {
    value_type: type,
    epsilon: T,
} {
    return switch (T) {
        f32 => .{ .value_type = i32, .epsilon = @as(T, 1e-7) },
        f64 => .{ .value_type = i64, .epsilon = @as(T, 1e-15) },
        f128 => .{ .value_type = i128, .epsilon = @as(T, 1e-33) },
        else => @compileError("Angle only supports f32, f64, or f128"),
    };
}

pub fn Angle(comptime T: type) type {
    const focus = compile_focus(T);
    const value_type = focus.value_type;
    const epsilon = focus.epsilon;

    return struct {
        const Self = @This();
        pub const pi = @as(T, math.pi);
        pub const pix2 = @as(T, pi * 2);
        pub const inf = math.inf(T); // +infinity for type T
        pub const neg_inf = -math.inf(T); // -infinity for type T
        const sarc_to_rad = pi / @as(T, 648000);
        const rad_to_sarc = @as(T, 648000) / pi;

        const UNIT_TO_SARC = blk: {
            var factors: [11]T = undefined;
            factors[@intFromEnum(AngleUnit.turn)] = @as(T, 1296000);
            factors[@intFromEnum(AngleUnit.mulp)] = @as(T, 648000);
            factors[@intFromEnum(AngleUnit.quad)] = @as(T, 324000);
            factors[@intFromEnum(AngleUnit.sext)] = @as(T, 216000);
            factors[@intFromEnum(AngleUnit.rad)] = rad_to_sarc;
            factors[@intFromEnum(AngleUnit.hexa)] = @as(T, 21600);
            factors[@intFromEnum(AngleUnit.bdeg)] = @as(T, 5062.5);
            factors[@intFromEnum(AngleUnit.deg)] = @as(T, 3600);
            factors[@intFromEnum(AngleUnit.grad)] = @as(T, 3240);
            factors[@intFromEnum(AngleUnit.marc)] = @as(T, 60);
            factors[@intFromEnum(AngleUnit.sarc)] = @as(T, 1);
            break :blk factors;
        };

        const SARC_TO_UNIT = blk: {
            var factors: [11]T = undefined;
            factors[@intFromEnum(AngleUnit.turn)] = @as(T, 1) / @as(T, 1296000);
            factors[@intFromEnum(AngleUnit.mulp)] = @as(T, 1) / @as(T, 648000);
            factors[@intFromEnum(AngleUnit.quad)] = @as(T, 1) / @as(T, 324000);
            factors[@intFromEnum(AngleUnit.sext)] = @as(T, 1) / @as(T, 216000);
            factors[@intFromEnum(AngleUnit.rad)] = sarc_to_rad;
            factors[@intFromEnum(AngleUnit.hexa)] = @as(T, 1) / @as(T, 21600);
            factors[@intFromEnum(AngleUnit.bdeg)] = @as(T, 1) / @as(T, 5062.5);
            factors[@intFromEnum(AngleUnit.deg)] = @as(T, 1) / @as(T, 3600);
            factors[@intFromEnum(AngleUnit.grad)] = @as(T, 1) / @as(T, 3240);
            factors[@intFromEnum(AngleUnit.marc)] = @as(T, 1) / @as(T, 60);
            factors[@intFromEnum(AngleUnit.sarc)] = @as(T, 1);
            break :blk factors;
        };

        value: value_type,

        /// Parameterless init - creates zero angle (matching TS constructor())
        pub fn init() Self {
            return Self{
                .value = 0,
            };
        }

        pub fn asinh(v: T) T {
            const abs_v = @abs(v);

            // Very small: return v
            if (abs_v < epsilon) return v;

            // Large: avoid overflow, use log(|v|) + ln(2)
            if (abs_v > @as(T, 1e20)) {
                const LN2 = @log(@as(T, 2));
                const sgn = if (v < 0) -@as(T, 1) else @as(T, 1);
                return sgn * (@log(abs_v) + LN2);
            }

            // Standard formula
            return @log(v + math.sqrt(v * v + @as(T, 1)));
        }

        pub fn acosh(v: T) T {
            // Domain error: v < 1
            if (v < @as(T, 1)) return std.math.nan(T);

            // v == 1
            if (v == @as(T, 1)) return @as(T, 0);

            // Small excess above 1: use log1p for precision
            const excess = v - @as(T, 1);
            if (excess < epsilon) {
                return math.sqrt(excess * @as(T, 2));
            }

            // Large: avoid overflow, use log(2*v)
            if (v > @as(T, 1e20)) {
                const LN2 = @log(@as(T, 2));
                return @log(v) + LN2;
            }

            // Standard formula
            return @log(v + math.sqrt(v * v - @as(T, 1)));
        }

        pub fn atanh(v: T) T {
            const abs_v = @abs(v);

            // Domain error: |v| >= 1
            if (abs_v >= @as(T, 1)) return if (v > 0) std.math.inf(T) else -std.math.inf(T);

            // Very small: return v
            if (abs_v < epsilon) return v;

            // Standard formula
            return @log((@as(T, 1) + v) / (@as(T, 1) - v)) / @as(T, 2);
        }

        // --- Wrapper factories for each unit ---

        pub fn from_turn(val: T) Self {
            return Self.from(AngleUnit.turn, val);
        }

        pub fn from_mulp(val: T) Self {
            return Self.from(AngleUnit.mulp, val);
        }

        pub fn from_quad(val: T) Self {
            return Self.from(.quad, val);
        }

        pub fn from_sext(val: T) Self {
            return Self.from(.sext, val);
        }

        pub fn from_rad(val: T) Self {
            return Self.from(.rad, val);
        }

        pub fn from_hexa(val: T) Self {
            return Self.from(.hexa, val);
        }

        pub fn from_bdeg(val: T) Self {
            return Self.from(.bdeg, val);
        }

        pub fn from_deg(val: T) Self {
            return Self.from(.deg, val);
        }

        pub fn from_grad(val: T) Self {
            return Self.from(.grad, val);
        }

        pub fn from_marc(val: T) Self {
            return Self.from(.marc, val);
        }

        pub fn from_sarc(val: T) Self {
            return Self.from(.sarc, val);
        }

        // Trig factory methods
        pub fn from_sin(v: T) Self {
            var a = Self.init();
            _ = a.use_sin(v);
            return a;
        }

        pub fn from_cos(v: T) Self {
            var a = Self.init();
            _ = a.use_cos(v);
            return a;
        }

        pub fn from_tan(v: T) Self {
            var a = Self.init();
            _ = a.use_tan(v);
            return a;
        }

        pub fn from_cot(v: T) Self {
            var a = Self.init();
            _ = a.use_cot(v);
            return a;
        }

        pub fn from_sec(v: T) Self {
            var a = Self.init();
            _ = a.use_sec(v);
            return a;
        }

        pub fn from_csc(v: T) Self {
            var a = Self.init();
            _ = a.use_csc(v);
            return a;
        }

        // Hyperbolic factories
        pub fn from_sinh(v: T) Self {
            var a = Self.init();
            _ = a.use_sinh(v);
            return a;
        }

        pub fn from_cosh(v: T) Self {
            var a = Self.init();
            _ = a.use_cosh(v);
            return a;
        }

        pub fn from_tanh(v: T) Self {
            var a = Self.init();
            _ = a.use_tanh(v);
            return a;
        }

        pub fn from_coth(v: T) Self {
            var a = Self.init();
            _ = a.use_coth(v);
            return a;
        }

        pub fn from_sech(v: T) Self {
            var a = Self.init();
            _ = a.use_sech(v);
            return a;
        }

        pub fn from_csch(v: T) Self {
            var a = Self.init();
            _ = a.use_csch(v);
            return a;
        }

        // ==================== SET VALUE METHODS ====================

        pub fn use_turn(self: *Self, val: T) *Self {
            return self.use(.turn, val);
        }

        pub fn use_mulp(self: *Self, val: T) *Self {
            return self.use(.mulp, val);
        }

        pub fn use_quad(self: *Self, val: T) *Self {
            return self.use(.quad, val);
        }

        pub fn use_sext(self: *Self, val: T) *Self {
            return self.use(.sext, val);
        }

        pub fn use_rad(self: *Self, val: T) *Self {
            return self.use(.rad, val);
        }

        pub fn use_hexa(self: *Self, val: T) *Self {
            return self.use(.hexa, val);
        }

        pub fn use_bdeg(self: *Self, val: T) *Self {
            return self.use(.bdeg, val);
        }

        pub fn use_deg(self: *Self, val: T) *Self {
            return self.use(.deg, val);
        }

        pub fn use_grad(self: *Self, val: T) *Self {
            return self.use(.grad, val);
        }

        pub fn use_marc(self: *Self, val: T) *Self {
            return self.use(.marc, val);
        }

        pub fn use_sarc(self: *Self, val: T) *Self {
            return self.use(.sarc, val);
        }

        pub fn use_angle(self: *Self, angle: Self) !void {
            self.value = angle.value;
        }

        // ==================== ADD VALUE METHODS ====================

        pub fn add_turn(self: *Self, val: T) *Self {
            return self.add(.turn, val);
        }

        pub fn add_mulp(self: *Self, val: T) *Self {
            return self.add(.mulp, val);
        }

        pub fn add_quad(self: *Self, val: T) *Self {
            return self.add(.quad, val);
        }

        pub fn add_sext(self: *Self, val: T) *Self {
            return self.add(.sext, val);
        }

        pub fn add_rad(self: *Self, val: T) *Self {
            return self.add(.rad, val);
        }

        pub fn add_hexa(self: *Self, val: T) *Self {
            return self.add(.hexa, val);
        }

        pub fn add_bdeg(self: *Self, val: T) *Self {
            return self.add(.bdeg, val);
        }

        pub fn add_deg(self: *Self, val: T) *Self {
            return self.add(.deg, val);
        }

        pub fn add_grad(self: *Self, val: T) *Self {
            return self.add(.grad, val);
        }

        pub fn add_marc(self: *Self, val: T) *Self {
            return self.add(.marc, val);
        }

        pub fn add_sarc(self: *Self, val: T) *Self {
            return self.add(.sarc, val);
        }

        // ==================== GET VALUE METHODS ====================

        pub fn turn(self: Self) T {
            return @as(T, @floatFromInt(self.value)) * SARC_TO_UNIT[@intFromEnum(AngleUnit.turn)];
        }

        pub fn mulp(self: Self) T {
            return @as(T, @floatFromInt(self.value)) * SARC_TO_UNIT[@intFromEnum(AngleUnit.mulp)];
        }

        pub fn quad(self: Self) T {
            return @as(T, @floatFromInt(self.value)) * SARC_TO_UNIT[@intFromEnum(AngleUnit.quad)];
        }

        pub fn sext(self: Self) T {
            return @as(T, @floatFromInt(self.value)) * SARC_TO_UNIT[@intFromEnum(AngleUnit.sext)];
        }

        pub fn rad(self: Self) T {
            return @as(T, @floatFromInt(self.value)) * SARC_TO_UNIT[@intFromEnum(AngleUnit.rad)];
        }

        pub fn hexa(self: Self) T {
            return @as(T, @floatFromInt(self.value)) * SARC_TO_UNIT[@intFromEnum(AngleUnit.hexa)];
        }

        pub fn bdeg(self: Self) T {
            return @as(T, @floatFromInt(self.value)) * SARC_TO_UNIT[@intFromEnum(AngleUnit.bdeg)];
        }

        pub fn deg(self: Self) T {
            return @as(T, @floatFromInt(self.value)) * SARC_TO_UNIT[@intFromEnum(AngleUnit.deg)];
        }

        pub fn grad(self: Self) T {
            return @as(T, @floatFromInt(self.value)) * SARC_TO_UNIT[@intFromEnum(AngleUnit.grad)];
        }

        pub fn marc(self: Self) T {
            return @as(T, @floatFromInt(self.value)) * SARC_TO_UNIT[@intFromEnum(AngleUnit.marc)];
        }

        pub fn sarc(self: Self) T {
            return @as(T, @floatFromInt(self.value)) * SARC_TO_UNIT[@intFromEnum(AngleUnit.sarc)];
        }

        // ==================== TRIG/HYPERBOLIC ====================

        pub fn sin(self: Self) T {
            return math.sin(self.value);
        }

        pub fn cos(self: Self) T {
            return math.cos(self.value);
        }

        pub fn tan(self: Self) T {
            return math.tan(self.value);
        }

        pub fn cot(self: Self) T {
            const t = self.tan();
            if (t == 0) return math.inf(T);
            return 1 / t;
        }

        pub fn sec(self: Self) T {
            const c = self.cos();
            if (c == 0) return math.inf(T);
            return 1 / c;
        }

        pub fn csc(self: Self) T {
            const s = self.sin();
            if (s == 0) return math.inf(T);
            return 1 / s;
        }

        pub fn sinh_of_rad(v: T) T {
            return (math.exp(v) - math.exp(-v)) / @as(T, 2);
        }

        pub fn sinh(self: Self) T {
            return sinh_of_rad(self.rad());
        }

        pub fn cosh_of_rad(v: T) T {
            return (math.exp(v) + math.exp(-v)) / @as(T, 2);
        }

        pub fn cosh(self: Self) T {
            return cosh_of_rad(self.rad());
        }

        pub fn tanh_of_rad(v: T) T {
            const exp_2r = math.exp(@as(T, 2) * v);
            return (exp_2r - @as(T, 1)) / (exp_2r + @as(T, 1));
        }

        pub fn tanh(self: Self) T {
            return tanh_of_rad(self.rad());
        }

        pub fn coth(self: Self) T {
            const th = self.tanh();
            if (th == 0) return math.inf(T);
            return 1 / th;
        }

        pub fn sech(self: Self) T {
            const ch = self.cosh();
            if (ch == 0) return math.inf(T);
            return 1 / ch;
        }

        pub fn csch(self: Self) T {
            const sh = self.sinh();
            if (sh == 0) return math.inf(T);
            return 1 / sh;
        }

        // ==================== USE FROM TRIG ====================

        pub fn use_sin(self: *Self, v: T) *Self {
            self.value = @round(math.asin(v) * rad_to_sarc);
            return self;
        }

        pub fn use_cos(self: *Self, v: T) *Self {
            self.value = @round(math.acos(v) * rad_to_sarc);
            return self;
        }

        pub fn use_tan(self: *Self, v: T) *Self {
            self.value = @round(math.atan(v) * rad_to_sarc);
            return self;
        }

        pub fn use_cot(self: *Self, v: T) *Self {
            self.value = @round(math.atan(1 / v) * rad_to_sarc);
            return self;
        }

        pub fn use_sec(self: *Self, v: T) *Self {
            self.value = @round(math.acos(1 / v) * rad_to_sarc);
            return self;
        }

        pub fn use_csc(self: *Self, v: T) *Self {
            self.value = @round(math.asin(1 / v) * rad_to_sarc);
            return self;
        }

        pub fn use_sinh(self: *Self, v: T) *Self {
            self.value = @round(asinh(v) * rad_to_sarc);
            return self;
        }

        pub fn use_cosh(self: *Self, v: T) *Self {
            self.value = @round(acosh(v) * rad_to_sarc);
            return self;
        }

        pub fn use_tanh(self: *Self, v: T) *Self {
            self.value = @round(atanh(v) * rad_to_sarc);
            return self;
        }

        pub fn use_coth(self: *Self, v: T) *Self {
            self.value = @round(atanh(1 / v) * rad_to_sarc);
            return self;
        }

        pub fn use_sech(self: *Self, v: T) *Self {
            self.value = @round(acosh(1 / v) * rad_to_sarc);
            return self;
        }

        pub fn use_csch(self: *Self, v: T) *Self {
            self.value = @round(asinh(1 / v) * rad_to_sarc);
            return self;
        }

        // ==================== GENERIC METHODS ====================

        pub fn from(unit: AngleUnit, val: T) Self {
            var a = Self.init();
            _ = a.use(unit, val);
            return a;
        }

        pub fn use(self: *Self, unit: AngleUnit, val: T) *Self {
            self.value = @round(val * UNIT_TO_SARC[@intFromEnum(unit)]);
            return self;
        }

        pub fn add(self: *Self, unit: AngleUnit, val: T) *Self {
            self.value += @round(val * UNIT_TO_SARC[@intFromEnum(unit)]);
            return self;
        }

        // ==================== SUBTRACTION ====================

        pub fn add_angle(self: *Self, angle: *const Self) *Self {
            self.value += angle.value;
            return self;
        }

        pub fn negate(self: *Self) *Self {
            self.value = -self.value;
            return self;
        }

        pub fn cut_angle(self: *Self, angle: *const Self) *Self {
            self.value -= angle.value;
            return self;
        }

        // ==================== UTILITY METHODS ====================

        pub fn copy(self: *const Self) Self {
            var a = Self.init();
            a.value = self.value;
            return a;
        }

        pub fn normalize(self: *Self) *Self {
            _ = self;
            unreachable;
            // self.value = @mod(self.value, pix2);
            // if (self.value < 0) {
            //     self.value += pix2;
            // }
            //todo //warning patch to solve new fail, but i would like to wait for this. Up to sarc refactoring
            // if (self.value >= pix2 - 1e-30 or self.value < 1e-30) {
            //     self.value = 0;
            // }
            // return self;
        }

        pub fn info_print(self: *Self, precision: u32) void {
            // Find max label length
            var max_label: usize = 0;
            const all_labels = [_][]const u8{
                "[turns]",
                "[multiples of pi]",
                "[quadrants]",
                "[sextants]",
                "[radians]",
                "[hexacontades]",
                "[binary degrees]",
                "[degrees]",
                "[gradians]",
                "[minutes of arc]",
                "[seconds of arc]",
                "sinus",
                "cosinus",
                "tangens",
                "cotangens",
                "secans",
                "cosecans",
                "hyperbolic sinus",
                "hyperbolic cosinus",
                "hyperbolic tangens",
                "hyperbolic cotangens",
                "hyperbolic secans",
                "hyperbolic cosecans",
            };
            for (all_labels) |lbl| {
                if (lbl.len > max_label) max_label = lbl.len;
            }

            const print_line = struct {
                fn doit(val: T, label: []const u8, pad: usize, prec: u32) void {
                    std.debug.print("{s}", .{label});
                    for (0..pad) |_| std.debug.print(" ", .{});
                    std.debug.print(": ", .{});

                    if (math.isNan(val)) {
                        std.debug.print("NaN\n", .{});
                        return;
                    }
                    if (!math.isFinite(val)) {
                        if (val < 0) std.debug.print("-inf\n", .{}) else std.debug.print("+inf\n", .{});
                        return;
                    }

                    // Correct Zig format for runtime precision
                    std.debug.print("{d:.[1]}\n", .{ val, prec });
                }
            }.doit;

            // Units
            const vals_units = [_]T{
                self.turn(), self.mulp(), self.quad(), self.sext(), self.rad(),
                self.hexa(), self.bdeg(), self.deg(),  self.grad(), self.marc(),
                self.sarc(),
            };
            const lbls_units = [_][]const u8{
                "[turns]",
                "[multiples of pi]",
                "[quadrants]",
                "[sextants]",
                "[radians]",
                "[hexacontades]",
                "[binary degrees]",
                "[degrees]",
                "[gradians]",
                "[minutes of arc]",
                "[seconds of arc]",
            };
            for (lbls_units, vals_units) |lbl, val| {
                print_line(val, lbl, max_label - lbl.len, precision);
            }

            // Trig
            std.debug.print("\n", .{});
            const vals_trig = [_]T{ self.sin(), self.cos(), self.tan(), self.cot(), self.sec(), self.csc() };
            const lbls_trig = [_][]const u8{ "sinus", "cosinus", "tangens", "cotangens", "secans", "cosecans" };
            for (lbls_trig, vals_trig) |lbl, val| {
                print_line(val, lbl, max_label - lbl.len, precision);
            }

            // Hyperbolic
            std.debug.print("\n", .{});
            const vals_hyp = [_]T{ self.sinh(), self.cosh(), self.tanh(), self.coth(), self.sech(), self.csch() };
            const lbls_hyp = [_][]const u8{ "hyperbolic sinus", "hyperbolic cosinus", "hyperbolic tangens", "hyperbolic cotangens", "hyperbolic secans", "hyperbolic cosecans" };
            for (lbls_hyp, vals_hyp) |lbl, val| {
                print_line(val, lbl, max_label - lbl.len, precision);
            }
        }
    };
}

pub const AngleF32 = Angle(f32);
pub const AngleF64 = Angle(f64);
pub const AngleF128 = Angle(f128);

test "parameterless init" {
    var a = AngleF32.init();
    try std.testing.expectEqual(@as(f128, 0), a.rad());
}

test "from wrapper" {
    const a = AngleF32.from_deg(90);
    try std.testing.expectEqual(@as(f128, 90), a.deg());
}

test "method chaining" {
    var angle = AngleF32.init();
    _ = angle
        .use_deg(45)
        .add_deg(45)
        .normalize();
    try std.testing.expectEqual(@as(f128, 90), angle.deg());
}
