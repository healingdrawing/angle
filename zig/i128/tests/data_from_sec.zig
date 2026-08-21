const std = @import("std");
const math = std.math;
const unit = @import("../angle.zig").AngleUnit;
const uh = @import("helper.zig").unit_helper(f128);

pub const TestCase = struct {
    in_value: f128,
    out_unit: unit,
    outarr: [1]f128,
};

pub const cases = [_]TestCase{
    // =====================================
    // === sec(0°) = 1 → angle = 0° ========
    // =====================================
    // ALL 12 UNITS for sec(0)
    .{ .in_value = uh.sec_0, .out_unit = .none, .outarr = .{uh.rad_0} },
    .{ .in_value = uh.sec_0, .out_unit = .turn, .outarr = .{uh.turn_0} },
    .{ .in_value = uh.sec_0, .out_unit = .mulp, .outarr = .{uh.mulp_0} },
    .{ .in_value = uh.sec_0, .out_unit = .quad, .outarr = .{uh.quad_0} },
    .{ .in_value = uh.sec_0, .out_unit = .sext, .outarr = .{uh.sext_0} },
    .{ .in_value = uh.sec_0, .out_unit = .rad, .outarr = .{uh.rad_0} },
    .{ .in_value = uh.sec_0, .out_unit = .hexa, .outarr = .{uh.hexa_0} },
    .{ .in_value = uh.sec_0, .out_unit = .bdeg, .outarr = .{uh.bdeg_0} },
    .{ .in_value = uh.sec_0, .out_unit = .deg, .outarr = .{uh.deg_0} },
    .{ .in_value = uh.sec_0, .out_unit = .grad, .outarr = .{uh.grad_0} },
    .{ .in_value = uh.sec_0, .out_unit = .marc, .outarr = .{uh.marc_0} },
    .{ .in_value = uh.sec_0, .out_unit = .sarc, .outarr = .{uh.sarc_0} },

    // =====================================
    // === sec(30°) ≈ 1.155 → angle = 30° ===
    // =====================================
    // ALL 12 UNITS for sec(30)
    .{ .in_value = uh.sec_30, .out_unit = .none, .outarr = .{uh.rad_30} },
    .{ .in_value = uh.sec_30, .out_unit = .turn, .outarr = .{uh.turn_30} },
    .{ .in_value = uh.sec_30, .out_unit = .mulp, .outarr = .{uh.mulp_30} },
    .{ .in_value = uh.sec_30, .out_unit = .quad, .outarr = .{uh.quad_30} },
    .{ .in_value = uh.sec_30, .out_unit = .sext, .outarr = .{uh.sext_30} },
    .{ .in_value = uh.sec_30, .out_unit = .rad, .outarr = .{uh.rad_30} },
    .{ .in_value = uh.sec_30, .out_unit = .hexa, .outarr = .{uh.hexa_30} },
    .{ .in_value = uh.sec_30, .out_unit = .bdeg, .outarr = .{uh.bdeg_30} },
    .{ .in_value = uh.sec_30, .out_unit = .deg, .outarr = .{uh.deg_30} },
    .{ .in_value = uh.sec_30, .out_unit = .grad, .outarr = .{uh.grad_30} },
    .{ .in_value = uh.sec_30, .out_unit = .marc, .outarr = .{uh.marc_30} },
    .{ .in_value = uh.sec_30, .out_unit = .sarc, .outarr = .{uh.sarc_30} },

    // =====================================
    // === sec(45°) ≈ 1.414 → angle = 45° ===
    // =====================================
    // ALL 12 UNITS for sec(45)
    .{ .in_value = uh.sec_45, .out_unit = .none, .outarr = .{uh.rad_45} },
    .{ .in_value = uh.sec_45, .out_unit = .turn, .outarr = .{uh.turn_45} },
    .{ .in_value = uh.sec_45, .out_unit = .mulp, .outarr = .{uh.mulp_45} },
    .{ .in_value = uh.sec_45, .out_unit = .quad, .outarr = .{uh.quad_45} },
    .{ .in_value = uh.sec_45, .out_unit = .sext, .outarr = .{uh.sext_45} },
    .{ .in_value = uh.sec_45, .out_unit = .rad, .outarr = .{uh.rad_45} },
    .{ .in_value = uh.sec_45, .out_unit = .hexa, .outarr = .{uh.hexa_45} },
    .{ .in_value = uh.sec_45, .out_unit = .bdeg, .outarr = .{uh.bdeg_45} },
    .{ .in_value = uh.sec_45, .out_unit = .deg, .outarr = .{uh.deg_45} },
    .{ .in_value = uh.sec_45, .out_unit = .grad, .outarr = .{uh.grad_45} },
    .{ .in_value = uh.sec_45, .out_unit = .marc, .outarr = .{uh.marc_45} },
    .{ .in_value = uh.sec_45, .out_unit = .sarc, .outarr = .{uh.sarc_45} },

    // =====================================
    // === sec(60°) = 2 → angle = 60° =======
    // =====================================
    // ALL 12 UNITS for sec(60)
    .{ .in_value = uh.sec_60, .out_unit = .none, .outarr = .{uh.rad_60} },
    .{ .in_value = uh.sec_60, .out_unit = .turn, .outarr = .{uh.turn_60} },
    .{ .in_value = uh.sec_60, .out_unit = .mulp, .outarr = .{uh.mulp_60} },
    .{ .in_value = uh.sec_60, .out_unit = .quad, .outarr = .{uh.quad_60} },
    .{ .in_value = uh.sec_60, .out_unit = .sext, .outarr = .{uh.sext_60} },
    .{ .in_value = uh.sec_60, .out_unit = .rad, .outarr = .{uh.rad_60} },
    .{ .in_value = uh.sec_60, .out_unit = .hexa, .outarr = .{uh.hexa_60} },
    .{ .in_value = uh.sec_60, .out_unit = .bdeg, .outarr = .{uh.bdeg_60} },
    .{ .in_value = uh.sec_60, .out_unit = .deg, .outarr = .{uh.deg_60} },
    .{ .in_value = uh.sec_60, .out_unit = .grad, .outarr = .{uh.grad_60} },
    .{ .in_value = uh.sec_60, .out_unit = .marc, .outarr = .{uh.marc_60} },
    .{ .in_value = uh.sec_60, .out_unit = .sarc, .outarr = .{uh.sarc_60} },

    // =====================================
    // === sec(90°) = ∞ → angle = 90° =======
    // =====================================
    // ALL 12 UNITS for sec(90)
    .{ .in_value = uh.sec_90, .out_unit = .none, .outarr = .{uh.rad_90} },
    .{ .in_value = uh.sec_90, .out_unit = .turn, .outarr = .{uh.turn_90} },
    .{ .in_value = uh.sec_90, .out_unit = .mulp, .outarr = .{uh.mulp_90} },
    .{ .in_value = uh.sec_90, .out_unit = .quad, .outarr = .{uh.quad_90} },
    .{ .in_value = uh.sec_90, .out_unit = .sext, .outarr = .{uh.sext_90} },
    .{ .in_value = uh.sec_90, .out_unit = .rad, .outarr = .{uh.rad_90} },
    .{ .in_value = uh.sec_90, .out_unit = .hexa, .outarr = .{uh.hexa_90} },
    .{ .in_value = uh.sec_90, .out_unit = .bdeg, .outarr = .{uh.bdeg_90} },
    .{ .in_value = uh.sec_90, .out_unit = .deg, .outarr = .{uh.deg_90} },
    .{ .in_value = uh.sec_90, .out_unit = .grad, .outarr = .{uh.grad_90} },
    .{ .in_value = uh.sec_90, .out_unit = .marc, .outarr = .{uh.marc_90} },
    .{ .in_value = uh.sec_90, .out_unit = .sarc, .outarr = .{uh.sarc_90} },

    // =====================================
    // === sec(20°) ≈ 1.064 → angle = 20° ==
    // =====================================
    // ALL 12 UNITS for sec(20) - fractional coverage
    .{ .in_value = uh.sec_20, .out_unit = .none, .outarr = .{uh.rad_20} },
    .{ .in_value = uh.sec_20, .out_unit = .turn, .outarr = .{uh.turn_20} },
    .{ .in_value = uh.sec_20, .out_unit = .mulp, .outarr = .{uh.mulp_20} },
    .{ .in_value = uh.sec_20, .out_unit = .quad, .outarr = .{uh.quad_20} },
    .{ .in_value = uh.sec_20, .out_unit = .sext, .outarr = .{uh.sext_20} },
    .{ .in_value = uh.sec_20, .out_unit = .rad, .outarr = .{uh.rad_20} },
    .{ .in_value = uh.sec_20, .out_unit = .hexa, .outarr = .{uh.hexa_20} },
    .{ .in_value = uh.sec_20, .out_unit = .bdeg, .outarr = .{uh.bdeg_20} },
    .{ .in_value = uh.sec_20, .out_unit = .deg, .outarr = .{uh.deg_20} },
    .{ .in_value = uh.sec_20, .out_unit = .grad, .outarr = .{uh.grad_20} },
    .{ .in_value = uh.sec_20, .out_unit = .marc, .outarr = .{uh.marc_20} },
    .{ .in_value = uh.sec_20, .out_unit = .sarc, .outarr = .{uh.sarc_20} },

    // =====================================
    // === NEGATIVE CASE DUPLICATION ========
    // =====================================
    // ALL 12 UNITS for sec(-0) = 1 → angle = 0°
    .{ .in_value = uh.sec_neg_0, .out_unit = .none, .outarr = .{uh.rad_0} },
    .{ .in_value = uh.sec_neg_0, .out_unit = .turn, .outarr = .{uh.turn_0} },
    .{ .in_value = uh.sec_neg_0, .out_unit = .mulp, .outarr = .{uh.mulp_0} },
    .{ .in_value = uh.sec_neg_0, .out_unit = .quad, .outarr = .{uh.quad_0} },
    .{ .in_value = uh.sec_neg_0, .out_unit = .sext, .outarr = .{uh.sext_0} },
    .{ .in_value = uh.sec_neg_0, .out_unit = .rad, .outarr = .{uh.rad_0} },
    .{ .in_value = uh.sec_neg_0, .out_unit = .hexa, .outarr = .{uh.hexa_0} },
    .{ .in_value = uh.sec_neg_0, .out_unit = .bdeg, .outarr = .{uh.bdeg_0} },
    .{ .in_value = uh.sec_neg_0, .out_unit = .deg, .outarr = .{uh.deg_0} },
    .{ .in_value = uh.sec_neg_0, .out_unit = .grad, .outarr = .{uh.grad_0} },
    .{ .in_value = uh.sec_neg_0, .out_unit = .marc, .outarr = .{uh.marc_0} },
    .{ .in_value = uh.sec_neg_0, .out_unit = .sarc, .outarr = .{uh.sarc_0} },

    // ALL 12 UNITS for sec(-30)
    .{ .in_value = uh.sec_neg_30, .out_unit = .none, .outarr = .{uh.rad_30} },
    .{ .in_value = uh.sec_neg_30, .out_unit = .turn, .outarr = .{uh.turn_30} },
    .{ .in_value = uh.sec_neg_30, .out_unit = .mulp, .outarr = .{uh.mulp_30} },
    .{ .in_value = uh.sec_neg_30, .out_unit = .quad, .outarr = .{uh.quad_30} },
    .{ .in_value = uh.sec_neg_30, .out_unit = .sext, .outarr = .{uh.sext_30} },
    .{ .in_value = uh.sec_neg_30, .out_unit = .rad, .outarr = .{uh.rad_30} },
    .{ .in_value = uh.sec_neg_30, .out_unit = .hexa, .outarr = .{uh.hexa_30} },
    .{ .in_value = uh.sec_neg_30, .out_unit = .bdeg, .outarr = .{uh.bdeg_30} },
    .{ .in_value = uh.sec_neg_30, .out_unit = .deg, .outarr = .{uh.deg_30} },
    .{ .in_value = uh.sec_neg_30, .out_unit = .grad, .outarr = .{uh.grad_30} },
    .{ .in_value = uh.sec_neg_30, .out_unit = .marc, .outarr = .{uh.marc_30} },
    .{ .in_value = uh.sec_neg_30, .out_unit = .sarc, .outarr = .{uh.sarc_30} },

    // ALL 12 UNITS for sec(-45)
    .{ .in_value = uh.sec_neg_45, .out_unit = .none, .outarr = .{uh.rad_45} },
    .{ .in_value = uh.sec_neg_45, .out_unit = .turn, .outarr = .{uh.turn_45} },
    .{ .in_value = uh.sec_neg_45, .out_unit = .mulp, .outarr = .{uh.mulp_45} },
    .{ .in_value = uh.sec_neg_45, .out_unit = .quad, .outarr = .{uh.quad_45} },
    .{ .in_value = uh.sec_neg_45, .out_unit = .sext, .outarr = .{uh.sext_45} },
    .{ .in_value = uh.sec_neg_45, .out_unit = .rad, .outarr = .{uh.rad_45} },
    .{ .in_value = uh.sec_neg_45, .out_unit = .hexa, .outarr = .{uh.hexa_45} },
    .{ .in_value = uh.sec_neg_45, .out_unit = .bdeg, .outarr = .{uh.bdeg_45} },
    .{ .in_value = uh.sec_neg_45, .out_unit = .deg, .outarr = .{uh.deg_45} },
    .{ .in_value = uh.sec_neg_45, .out_unit = .grad, .outarr = .{uh.grad_45} },
    .{ .in_value = uh.sec_neg_45, .out_unit = .marc, .outarr = .{uh.marc_45} },
    .{ .in_value = uh.sec_neg_45, .out_unit = .sarc, .outarr = .{uh.sarc_45} },

    // ALL 12 UNITS for sec(-60)
    .{ .in_value = uh.sec_neg_60, .out_unit = .none, .outarr = .{uh.rad_60} },
    .{ .in_value = uh.sec_neg_60, .out_unit = .turn, .outarr = .{uh.turn_60} },
    .{ .in_value = uh.sec_neg_60, .out_unit = .mulp, .outarr = .{uh.mulp_60} },
    .{ .in_value = uh.sec_neg_60, .out_unit = .quad, .outarr = .{uh.quad_60} },
    .{ .in_value = uh.sec_neg_60, .out_unit = .sext, .outarr = .{uh.sext_60} },
    .{ .in_value = uh.sec_neg_60, .out_unit = .rad, .outarr = .{uh.rad_60} },
    .{ .in_value = uh.sec_neg_60, .out_unit = .hexa, .outarr = .{uh.hexa_60} },
    .{ .in_value = uh.sec_neg_60, .out_unit = .bdeg, .outarr = .{uh.bdeg_60} },
    .{ .in_value = uh.sec_neg_60, .out_unit = .deg, .outarr = .{uh.deg_60} },
    .{ .in_value = uh.sec_neg_60, .out_unit = .grad, .outarr = .{uh.grad_60} },
    .{ .in_value = uh.sec_neg_60, .out_unit = .marc, .outarr = .{uh.marc_60} },
    .{ .in_value = uh.sec_neg_60, .out_unit = .sarc, .outarr = .{uh.sarc_60} },

    // ALL 12 UNITS for sec(-90) = ∞ → angle = 90°
    .{ .in_value = uh.sec_neg_90, .out_unit = .none, .outarr = .{uh.rad_90} },
    .{ .in_value = uh.sec_neg_90, .out_unit = .turn, .outarr = .{uh.turn_90} },
    .{ .in_value = uh.sec_neg_90, .out_unit = .mulp, .outarr = .{uh.mulp_90} },
    .{ .in_value = uh.sec_neg_90, .out_unit = .quad, .outarr = .{uh.quad_90} },
    .{ .in_value = uh.sec_neg_90, .out_unit = .sext, .outarr = .{uh.sext_90} },
    .{ .in_value = uh.sec_neg_90, .out_unit = .rad, .outarr = .{uh.rad_90} },
    .{ .in_value = uh.sec_neg_90, .out_unit = .hexa, .outarr = .{uh.hexa_90} },
    .{ .in_value = uh.sec_neg_90, .out_unit = .bdeg, .outarr = .{uh.bdeg_90} },
    .{ .in_value = uh.sec_neg_90, .out_unit = .deg, .outarr = .{uh.deg_90} },
    .{ .in_value = uh.sec_neg_90, .out_unit = .grad, .outarr = .{uh.grad_90} },
    .{ .in_value = uh.sec_neg_90, .out_unit = .marc, .outarr = .{uh.marc_90} },
    .{ .in_value = uh.sec_neg_90, .out_unit = .sarc, .outarr = .{uh.sarc_90} },

    // ALL 12 UNITS for sec(-20) - fractional coverage
    .{ .in_value = uh.sec_neg_20, .out_unit = .none, .outarr = .{uh.rad_20} },
    .{ .in_value = uh.sec_neg_20, .out_unit = .turn, .outarr = .{uh.turn_20} },
    .{ .in_value = uh.sec_neg_20, .out_unit = .mulp, .outarr = .{uh.mulp_20} },
    .{ .in_value = uh.sec_neg_20, .out_unit = .quad, .outarr = .{uh.quad_20} },
    .{ .in_value = uh.sec_neg_20, .out_unit = .sext, .outarr = .{uh.sext_20} },
    .{ .in_value = uh.sec_neg_20, .out_unit = .rad, .outarr = .{uh.rad_20} },
    .{ .in_value = uh.sec_neg_20, .out_unit = .hexa, .outarr = .{uh.hexa_20} },
    .{ .in_value = uh.sec_neg_20, .out_unit = .bdeg, .outarr = .{uh.bdeg_20} },
    .{ .in_value = uh.sec_neg_20, .out_unit = .deg, .outarr = .{uh.deg_20} },
    .{ .in_value = uh.sec_neg_20, .out_unit = .grad, .outarr = .{uh.grad_20} },
    .{ .in_value = uh.sec_neg_20, .out_unit = .marc, .outarr = .{uh.marc_20} },
    .{ .in_value = uh.sec_neg_20, .out_unit = .sarc, .outarr = .{uh.sarc_20} },
};
