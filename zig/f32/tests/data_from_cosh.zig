const std = @import("std");
const math = std.math;
const unit = @import("../angle.zig").AngleUnit;
const uh = @import("helper.zig").unit_helper(f32);

pub const TestCase = struct {
    in_value: f32,
    out_unit: unit,
    outarr: [1]f32,
};

pub const cases = [_]TestCase{
    // =====================================
    // === cosh(0°) = 1 → angle = 0° =======
    // =====================================
    // ALL 12 UNITS for cosh(0)
    .{ .in_value = uh.cosh_0, .out_unit = .turn, .outarr = .{uh.turn_0} },
    .{ .in_value = uh.cosh_0, .out_unit = .mulp, .outarr = .{uh.mulp_0} },
    .{ .in_value = uh.cosh_0, .out_unit = .quad, .outarr = .{uh.quad_0} },
    .{ .in_value = uh.cosh_0, .out_unit = .sext, .outarr = .{uh.sext_0} },
    .{ .in_value = uh.cosh_0, .out_unit = .rad, .outarr = .{uh.rad_0} },
    .{ .in_value = uh.cosh_0, .out_unit = .hexa, .outarr = .{uh.hexa_0} },
    .{ .in_value = uh.cosh_0, .out_unit = .bdeg, .outarr = .{uh.bdeg_0} },
    .{ .in_value = uh.cosh_0, .out_unit = .deg, .outarr = .{uh.deg_0} },
    .{ .in_value = uh.cosh_0, .out_unit = .grad, .outarr = .{uh.grad_0} },
    .{ .in_value = uh.cosh_0, .out_unit = .marc, .outarr = .{uh.marc_0} },
    .{ .in_value = uh.cosh_0, .out_unit = .sarc, .outarr = .{uh.sarc_0} },

    // =====================================
    // === cosh(20°) → angle = 20° =========
    // =====================================
    // ALL 12 UNITS for cosh(20) - fractional coverage
    .{ .in_value = uh.cosh_20, .out_unit = .turn, .outarr = .{uh.turn_20} },
    .{ .in_value = uh.cosh_20, .out_unit = .mulp, .outarr = .{uh.mulp_20} },
    .{ .in_value = uh.cosh_20, .out_unit = .quad, .outarr = .{uh.quad_20} },
    .{ .in_value = uh.cosh_20, .out_unit = .sext, .outarr = .{uh.sext_20} },
    .{ .in_value = uh.cosh_20, .out_unit = .rad, .outarr = .{uh.rad_20} },
    .{ .in_value = uh.cosh_20, .out_unit = .hexa, .outarr = .{uh.hexa_20} },
    .{ .in_value = uh.cosh_20, .out_unit = .bdeg, .outarr = .{uh.bdeg_20} },
    .{ .in_value = uh.cosh_20, .out_unit = .deg, .outarr = .{uh.deg_20} },
    .{ .in_value = uh.cosh_20, .out_unit = .grad, .outarr = .{uh.grad_20} },
    .{ .in_value = uh.cosh_20, .out_unit = .marc, .outarr = .{uh.marc_20} },
    .{ .in_value = uh.cosh_20, .out_unit = .sarc, .outarr = .{uh.sarc_20} },

    // =====================================
    // === cosh(30°) → angle = 30° =========
    // =====================================
    // ALL 12 UNITS for cosh(30)
    .{ .in_value = uh.cosh_30, .out_unit = .turn, .outarr = .{uh.turn_30} },
    .{ .in_value = uh.cosh_30, .out_unit = .mulp, .outarr = .{uh.mulp_30} },
    .{ .in_value = uh.cosh_30, .out_unit = .quad, .outarr = .{uh.quad_30} },
    .{ .in_value = uh.cosh_30, .out_unit = .sext, .outarr = .{uh.sext_30} },
    .{ .in_value = uh.cosh_30, .out_unit = .rad, .outarr = .{uh.rad_30} },
    .{ .in_value = uh.cosh_30, .out_unit = .hexa, .outarr = .{uh.hexa_30} },
    .{ .in_value = uh.cosh_30, .out_unit = .bdeg, .outarr = .{uh.bdeg_30} },
    .{ .in_value = uh.cosh_30, .out_unit = .deg, .outarr = .{uh.deg_30} },
    .{ .in_value = uh.cosh_30, .out_unit = .grad, .outarr = .{uh.grad_30} },
    .{ .in_value = uh.cosh_30, .out_unit = .marc, .outarr = .{uh.marc_30} },
    .{ .in_value = uh.cosh_30, .out_unit = .sarc, .outarr = .{uh.sarc_30} },

    // =====================================
    // === cosh(45°) → angle = 45° =========
    // =====================================
    // ALL 12 UNITS for cosh(45)
    .{ .in_value = uh.cosh_45, .out_unit = .turn, .outarr = .{uh.turn_45} },
    .{ .in_value = uh.cosh_45, .out_unit = .mulp, .outarr = .{uh.mulp_45} },
    .{ .in_value = uh.cosh_45, .out_unit = .quad, .outarr = .{uh.quad_45} },
    .{ .in_value = uh.cosh_45, .out_unit = .sext, .outarr = .{uh.sext_45} },
    .{ .in_value = uh.cosh_45, .out_unit = .rad, .outarr = .{uh.rad_45} },
    .{ .in_value = uh.cosh_45, .out_unit = .hexa, .outarr = .{uh.hexa_45} },
    .{ .in_value = uh.cosh_45, .out_unit = .bdeg, .outarr = .{uh.bdeg_45} },
    .{ .in_value = uh.cosh_45, .out_unit = .deg, .outarr = .{uh.deg_45} },
    .{ .in_value = uh.cosh_45, .out_unit = .grad, .outarr = .{uh.grad_45} },
    .{ .in_value = uh.cosh_45, .out_unit = .marc, .outarr = .{uh.marc_45} },
    .{ .in_value = uh.cosh_45, .out_unit = .sarc, .outarr = .{uh.sarc_45} },

    // =====================================
    // === cosh(60°) → angle = 60° =========
    // =====================================
    // ALL 12 UNITS for cosh(60)
    .{ .in_value = uh.cosh_60, .out_unit = .turn, .outarr = .{uh.turn_60} },
    .{ .in_value = uh.cosh_60, .out_unit = .mulp, .outarr = .{uh.mulp_60} },
    .{ .in_value = uh.cosh_60, .out_unit = .quad, .outarr = .{uh.quad_60} },
    .{ .in_value = uh.cosh_60, .out_unit = .sext, .outarr = .{uh.sext_60} },
    .{ .in_value = uh.cosh_60, .out_unit = .rad, .outarr = .{uh.rad_60} },
    .{ .in_value = uh.cosh_60, .out_unit = .hexa, .outarr = .{uh.hexa_60} },
    .{ .in_value = uh.cosh_60, .out_unit = .bdeg, .outarr = .{uh.bdeg_60} },
    .{ .in_value = uh.cosh_60, .out_unit = .deg, .outarr = .{uh.deg_60} },
    .{ .in_value = uh.cosh_60, .out_unit = .grad, .outarr = .{uh.grad_60} },
    .{ .in_value = uh.cosh_60, .out_unit = .marc, .outarr = .{uh.marc_60} },
    .{ .in_value = uh.cosh_60, .out_unit = .sarc, .outarr = .{uh.sarc_60} },

    // =====================================
    // === cosh(90°) → angle = 90° =========
    // =====================================
    // ALL 12 UNITS for cosh(90)
    .{ .in_value = uh.cosh_90, .out_unit = .turn, .outarr = .{uh.turn_90} },
    .{ .in_value = uh.cosh_90, .out_unit = .mulp, .outarr = .{uh.mulp_90} },
    .{ .in_value = uh.cosh_90, .out_unit = .quad, .outarr = .{uh.quad_90} },
    .{ .in_value = uh.cosh_90, .out_unit = .sext, .outarr = .{uh.sext_90} },
    .{ .in_value = uh.cosh_90, .out_unit = .rad, .outarr = .{uh.rad_90} },
    .{ .in_value = uh.cosh_90, .out_unit = .hexa, .outarr = .{uh.hexa_90} },
    .{ .in_value = uh.cosh_90, .out_unit = .bdeg, .outarr = .{uh.bdeg_90} },
    .{ .in_value = uh.cosh_90, .out_unit = .deg, .outarr = .{uh.deg_90} },
    .{ .in_value = uh.cosh_90, .out_unit = .grad, .outarr = .{uh.grad_90} },
    .{ .in_value = uh.cosh_90, .out_unit = .marc, .outarr = .{uh.marc_90} },
    .{ .in_value = uh.cosh_90, .out_unit = .sarc, .outarr = .{uh.sarc_90} },

    // =====================================
    // === NEGATIVE CASE DUPLICATION ========
    // === cosh is even: cosh(-x) = cosh(x) =
    // === arccosh always returns positive ===
    // === So expected values are POSITIVE ===
    // =====================================
    // ALL 12 UNITS for cosh(-0) = cosh(0) → angle = 0° (positive)
    .{ .in_value = uh.cosh_neg_0, .out_unit = .turn, .outarr = .{uh.turn_0} },
    .{ .in_value = uh.cosh_neg_0, .out_unit = .mulp, .outarr = .{uh.mulp_0} },
    .{ .in_value = uh.cosh_neg_0, .out_unit = .quad, .outarr = .{uh.quad_0} },
    .{ .in_value = uh.cosh_neg_0, .out_unit = .sext, .outarr = .{uh.sext_0} },
    .{ .in_value = uh.cosh_neg_0, .out_unit = .rad, .outarr = .{uh.rad_0} },
    .{ .in_value = uh.cosh_neg_0, .out_unit = .hexa, .outarr = .{uh.hexa_0} },
    .{ .in_value = uh.cosh_neg_0, .out_unit = .bdeg, .outarr = .{uh.bdeg_0} },
    .{ .in_value = uh.cosh_neg_0, .out_unit = .deg, .outarr = .{uh.deg_0} },
    .{ .in_value = uh.cosh_neg_0, .out_unit = .grad, .outarr = .{uh.grad_0} },
    .{ .in_value = uh.cosh_neg_0, .out_unit = .marc, .outarr = .{uh.marc_0} },
    .{ .in_value = uh.cosh_neg_0, .out_unit = .sarc, .outarr = .{uh.sarc_0} },

    // ALL 12 UNITS for cosh(-20) → angle = 20° (positive)
    .{ .in_value = uh.cosh_neg_20, .out_unit = .turn, .outarr = .{uh.turn_20} },
    .{ .in_value = uh.cosh_neg_20, .out_unit = .mulp, .outarr = .{uh.mulp_20} },
    .{ .in_value = uh.cosh_neg_20, .out_unit = .quad, .outarr = .{uh.quad_20} },
    .{ .in_value = uh.cosh_neg_20, .out_unit = .sext, .outarr = .{uh.sext_20} },
    .{ .in_value = uh.cosh_neg_20, .out_unit = .rad, .outarr = .{uh.rad_20} },
    .{ .in_value = uh.cosh_neg_20, .out_unit = .hexa, .outarr = .{uh.hexa_20} },
    .{ .in_value = uh.cosh_neg_20, .out_unit = .bdeg, .outarr = .{uh.bdeg_20} },
    .{ .in_value = uh.cosh_neg_20, .out_unit = .deg, .outarr = .{uh.deg_20} },
    .{ .in_value = uh.cosh_neg_20, .out_unit = .grad, .outarr = .{uh.grad_20} },
    .{ .in_value = uh.cosh_neg_20, .out_unit = .marc, .outarr = .{uh.marc_20} },
    .{ .in_value = uh.cosh_neg_20, .out_unit = .sarc, .outarr = .{uh.sarc_20} },

    // ALL 12 UNITS for cosh(-30) → angle = 30° (positive)
    .{ .in_value = uh.cosh_neg_30, .out_unit = .turn, .outarr = .{uh.turn_30} },
    .{ .in_value = uh.cosh_neg_30, .out_unit = .mulp, .outarr = .{uh.mulp_30} },
    .{ .in_value = uh.cosh_neg_30, .out_unit = .quad, .outarr = .{uh.quad_30} },
    .{ .in_value = uh.cosh_neg_30, .out_unit = .sext, .outarr = .{uh.sext_30} },
    .{ .in_value = uh.cosh_neg_30, .out_unit = .rad, .outarr = .{uh.rad_30} },
    .{ .in_value = uh.cosh_neg_30, .out_unit = .hexa, .outarr = .{uh.hexa_30} },
    .{ .in_value = uh.cosh_neg_30, .out_unit = .bdeg, .outarr = .{uh.bdeg_30} },
    .{ .in_value = uh.cosh_neg_30, .out_unit = .deg, .outarr = .{uh.deg_30} },
    .{ .in_value = uh.cosh_neg_30, .out_unit = .grad, .outarr = .{uh.grad_30} },
    .{ .in_value = uh.cosh_neg_30, .out_unit = .marc, .outarr = .{uh.marc_30} },
    .{ .in_value = uh.cosh_neg_30, .out_unit = .sarc, .outarr = .{uh.sarc_30} },

    // ALL 12 UNITS for cosh(-45) → angle = 45° (positive)
    .{ .in_value = uh.cosh_neg_45, .out_unit = .turn, .outarr = .{uh.turn_45} },
    .{ .in_value = uh.cosh_neg_45, .out_unit = .mulp, .outarr = .{uh.mulp_45} },
    .{ .in_value = uh.cosh_neg_45, .out_unit = .quad, .outarr = .{uh.quad_45} },
    .{ .in_value = uh.cosh_neg_45, .out_unit = .sext, .outarr = .{uh.sext_45} },
    .{ .in_value = uh.cosh_neg_45, .out_unit = .rad, .outarr = .{uh.rad_45} },
    .{ .in_value = uh.cosh_neg_45, .out_unit = .hexa, .outarr = .{uh.hexa_45} },
    .{ .in_value = uh.cosh_neg_45, .out_unit = .bdeg, .outarr = .{uh.bdeg_45} },
    .{ .in_value = uh.cosh_neg_45, .out_unit = .deg, .outarr = .{uh.deg_45} },
    .{ .in_value = uh.cosh_neg_45, .out_unit = .grad, .outarr = .{uh.grad_45} },
    .{ .in_value = uh.cosh_neg_45, .out_unit = .marc, .outarr = .{uh.marc_45} },
    .{ .in_value = uh.cosh_neg_45, .out_unit = .sarc, .outarr = .{uh.sarc_45} },

    // ALL 12 UNITS for cosh(-60) → angle = 60° (positive)
    .{ .in_value = uh.cosh_neg_60, .out_unit = .turn, .outarr = .{uh.turn_60} },
    .{ .in_value = uh.cosh_neg_60, .out_unit = .mulp, .outarr = .{uh.mulp_60} },
    .{ .in_value = uh.cosh_neg_60, .out_unit = .quad, .outarr = .{uh.quad_60} },
    .{ .in_value = uh.cosh_neg_60, .out_unit = .sext, .outarr = .{uh.sext_60} },
    .{ .in_value = uh.cosh_neg_60, .out_unit = .rad, .outarr = .{uh.rad_60} },
    .{ .in_value = uh.cosh_neg_60, .out_unit = .hexa, .outarr = .{uh.hexa_60} },
    .{ .in_value = uh.cosh_neg_60, .out_unit = .bdeg, .outarr = .{uh.bdeg_60} },
    .{ .in_value = uh.cosh_neg_60, .out_unit = .deg, .outarr = .{uh.deg_60} },
    .{ .in_value = uh.cosh_neg_60, .out_unit = .grad, .outarr = .{uh.grad_60} },
    .{ .in_value = uh.cosh_neg_60, .out_unit = .marc, .outarr = .{uh.marc_60} },
    .{ .in_value = uh.cosh_neg_60, .out_unit = .sarc, .outarr = .{uh.sarc_60} },

    // ALL 12 UNITS for cosh(-90) → angle = 90° (positive)
    .{ .in_value = uh.cosh_neg_90, .out_unit = .turn, .outarr = .{uh.turn_90} },
    .{ .in_value = uh.cosh_neg_90, .out_unit = .mulp, .outarr = .{uh.mulp_90} },
    .{ .in_value = uh.cosh_neg_90, .out_unit = .quad, .outarr = .{uh.quad_90} },
    .{ .in_value = uh.cosh_neg_90, .out_unit = .sext, .outarr = .{uh.sext_90} },
    .{ .in_value = uh.cosh_neg_90, .out_unit = .rad, .outarr = .{uh.rad_90} },
    .{ .in_value = uh.cosh_neg_90, .out_unit = .hexa, .outarr = .{uh.hexa_90} },
    .{ .in_value = uh.cosh_neg_90, .out_unit = .bdeg, .outarr = .{uh.bdeg_90} },
    .{ .in_value = uh.cosh_neg_90, .out_unit = .deg, .outarr = .{uh.deg_90} },
    .{ .in_value = uh.cosh_neg_90, .out_unit = .grad, .outarr = .{uh.grad_90} },
    .{ .in_value = uh.cosh_neg_90, .out_unit = .marc, .outarr = .{uh.marc_90} },
    .{ .in_value = uh.cosh_neg_90, .out_unit = .sarc, .outarr = .{uh.sarc_90} },
};
