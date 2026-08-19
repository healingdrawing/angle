const std = @import("std");
const math = std.math;

pub const AngleUnit = enum(u8) {
    none = 0,
    turn = 1,
    mulp = 2,
    quad = 3,
    sext = 4,
    rad = 5,
    hexa = 6,
    bdeg = 7,
    deg = 8,
    grad = 9,
    marc = 10,
    sarc = 11,
};

pub fn Angle(comptime T: type) type {
    return struct {
        const Self = @This();
        pub const pi = @as(T, math.pi);
        pub const pix2 = @as(T, pi * 2);
        pub const inf = math.inf(T); // +infinity for type T
        pub const neg_inf = -math.inf(T); // -infinity for type T

        const CONVERSION_TO_RAD = blk: {
            var factors: [12]T = undefined;
            factors[@intFromEnum(AngleUnit.none)] = 1.0;
            factors[@intFromEnum(AngleUnit.turn)] = pix2;
            factors[@intFromEnum(AngleUnit.mulp)] = pi;
            factors[@intFromEnum(AngleUnit.quad)] = pi / 2.0;
            factors[@intFromEnum(AngleUnit.sext)] = pi / 3.0;
            factors[@intFromEnum(AngleUnit.rad)] = 1.0;
            factors[@intFromEnum(AngleUnit.hexa)] = pi / 30.0;
            factors[@intFromEnum(AngleUnit.bdeg)] = pi / 128.0;
            factors[@intFromEnum(AngleUnit.deg)] = pi / 180.0;
            factors[@intFromEnum(AngleUnit.grad)] = pi / 200.0;
            factors[@intFromEnum(AngleUnit.marc)] = pi / 10800.0;
            factors[@intFromEnum(AngleUnit.sarc)] = pi / 648000.0;
            break :blk factors;
        };

        const CONVERSION_FROM_RAD = blk: {
            var factors: [12]T = undefined;
            factors[@intFromEnum(AngleUnit.none)] = 1.0;
            factors[@intFromEnum(AngleUnit.turn)] = 1.0 / (2 * pi);
            factors[@intFromEnum(AngleUnit.mulp)] = 1.0 / pi;
            factors[@intFromEnum(AngleUnit.quad)] = 2.0 / pi;
            factors[@intFromEnum(AngleUnit.sext)] = 3.0 / pi;
            factors[@intFromEnum(AngleUnit.rad)] = 1.0;
            factors[@intFromEnum(AngleUnit.hexa)] = 30.0 / pi;
            factors[@intFromEnum(AngleUnit.bdeg)] = 128.0 / pi;
            factors[@intFromEnum(AngleUnit.deg)] = 180.0 / pi;
            factors[@intFromEnum(AngleUnit.grad)] = 200.0 / pi;
            factors[@intFromEnum(AngleUnit.marc)] = 10800.0 / pi;
            factors[@intFromEnum(AngleUnit.sarc)] = 648000.0 / pi;
            break :blk factors;
        };

        value: T,

        /// Parameterless init - creates zero angle (matching TS constructor())
        pub fn init() Self {
            return Self{
                .value = 0,
            };
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
            return self.value * CONVERSION_FROM_RAD[@intFromEnum(AngleUnit.turn)];
        }

        pub fn mulp(self: Self) T {
            return self.value * CONVERSION_FROM_RAD[@intFromEnum(AngleUnit.mulp)];
        }

        pub fn quad(self: Self) T {
            return self.value * CONVERSION_FROM_RAD[@intFromEnum(AngleUnit.quad)];
        }

        pub fn sext(self: Self) T {
            return self.value * CONVERSION_FROM_RAD[@intFromEnum(AngleUnit.sext)];
        }

        pub fn rad(self: Self) T {
            return self.value;
        }

        pub fn hexa(self: Self) T {
            return self.value * CONVERSION_FROM_RAD[@intFromEnum(AngleUnit.hexa)];
        }

        pub fn bdeg(self: Self) T {
            return self.value * CONVERSION_FROM_RAD[@intFromEnum(AngleUnit.bdeg)];
        }

        pub fn deg(self: Self) T {
            return self.value * CONVERSION_FROM_RAD[@intFromEnum(AngleUnit.deg)];
        }

        pub fn grad(self: Self) T {
            return self.value * CONVERSION_FROM_RAD[@intFromEnum(AngleUnit.grad)];
        }

        pub fn marc(self: Self) T {
            return self.value * CONVERSION_FROM_RAD[@intFromEnum(AngleUnit.marc)];
        }

        pub fn sarc(self: Self) T {
            return self.value * CONVERSION_FROM_RAD[@intFromEnum(AngleUnit.sarc)];
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

        pub fn sinh(self: Self) T {
            return (math.exp(self.value) - math.exp(-self.value)) / 2;
        }

        pub fn cosh(self: Self) T {
            return (math.exp(self.value) + math.exp(-self.value)) / 2;
        }

        pub fn tanh(self: Self) T {
            return math.tanh(self.value);
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
            self.value = math.asin(v);
            return self;
        }

        pub fn use_cos(self: *Self, v: T) *Self {
            self.value = math.acos(v);
            return self;
        }

        pub fn use_tan(self: *Self, v: T) *Self {
            self.value = math.atan(v);
            return self;
        }

        pub fn use_cot(self: *Self, v: T) *Self {
            self.value = math.atan(1 / v);
            return self;
        }

        pub fn use_sec(self: *Self, v: T) *Self {
            self.value = math.acos(1 / v);
            return self;
        }

        pub fn use_csc(self: *Self, v: T) *Self {
            self.value = math.asin(1 / v);
            return self;
        }

        pub fn use_sinh(self: *Self, v: T) *Self {
            self.value = math.asinh(v);
            return self;
        }

        pub fn use_cosh(self: *Self, v: T) *Self {
            self.value = math.acosh(v);
            return self;
        }

        pub fn use_tanh(self: *Self, v: T) *Self {
            self.value = math.atanh(v);
            return self;
        }

        pub fn use_coth(self: *Self, v: T) *Self {
            self.value = math.atanh(1 / v);
            return self;
        }

        pub fn use_sech(self: *Self, v: T) *Self {
            self.value = math.acosh(1 / v);
            return self;
        }

        pub fn use_csch(self: *Self, v: T) *Self {
            self.value = math.asinh(1 / v);
            return self;
        }

        // ==================== GENERIC METHODS ====================

        pub fn from(unit: AngleUnit, val: T) Self {
            var a = Self.init();
            _ = a.use(unit, val);
            return a;
        }

        pub fn use(self: *Self, unit: AngleUnit, val: T) *Self {
            self.value = val * CONVERSION_TO_RAD[@intFromEnum(unit)];
            return self;
        }

        pub fn add(self: *Self, unit: AngleUnit, val: T) *Self {
            self.value += val * CONVERSION_TO_RAD[@intFromEnum(unit)];
            return self;
        }

        // ==================== SUBTRACTION ====================

        pub fn add_angle(self: *Self, angle: Self) *Self {
            self.value += angle.value;
            return self;
        }

        pub fn negate(self: Self) Self {
            self.value = -self.value;
            return self;
        }

        pub fn cut_angle(self: *Self, angle: Self) *Self {
            try self.addAngle(angle.copy().negate());
            return self;
        }

        // ==================== UTILITY METHODS ====================

        pub fn copy(self: Self) Self {
            var a = Self.init();
            a.value = self.value;
            return a;
        }

        pub fn normalize(self: *Self) *Self {
            self.value = @mod(self.value, pix2);
            if (self.value < 0) {
                self.value += pix2;
            }
            return self;
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

test "parameterless init" {
    var a = AngleF32.init();
    try std.testing.expectEqual(@as(f32, 0), a.rad());
}

test "from wrapper" {
    const a = AngleF32.from_deg(90);
    try std.testing.expectEqual(@as(f32, 90), a.deg());
}

test "method chaining" {
    var angle = AngleF32.init();
    _ = angle
        .use_deg(45)
        .add_deg(45)
        .normalize();
    try std.testing.expectEqual(@as(f32, 90), angle.deg());
}
