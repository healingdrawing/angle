const std = @import("std");
const math = std.math;
const unit = @import("../angle.zig").AngleUnit;
const uh = @import("helper.zig").unit_helper;

pub const TestCase = struct {
    in_value: f32,
    out_unit: unit,
    outarr: [1]f32,
};

pub const cases = [_]TestCase{
    // =====================================
    // === csch(0°) = ∞ → angle = 0° =======
    // =====================================
    // ALL 12 UNITS for csch(0)
    .{ .in_value = uh.csch_0, .out_unit = .none, .outarr = .{uh.rad_0} },
    .{ .in_value = uh.csch_0, .out_unit = .turn, .outarr = .{uh.turn_0} },
    .{ .in_value = uh.csch_0, .out_unit = .mulp, .outarr = .{uh.mulp_0} },
    .{ .in_value = uh.csch_0, .out_unit = .quad, .outarr = .{uh.quad_0} },
    .{ .in_value = uh.csch_0, .out_unit = .sext, .outarr = .{uh.sext_0} },
    .{ .in_value = uh.csch_0, .out_unit = .rad, .outarr = .{uh.rad_0} },
    .{ .in_value = uh.csch_0, .out_unit = .hexa, .outarr = .{uh.hexa_0} },
    .{ .in_value = uh.csch_0, .out_unit = .bdeg, .outarr = .{uh.bdeg_0} },
    .{ .in_value = uh.csch_0, .out_unit = .deg, .outarr = .{uh.deg_0} },
    .{ .in_value = uh.csch_0, .out_unit = .grad, .outarr = .{uh.grad_0} },
    .{ .in_value = uh.csch_0, .out_unit = .marc, .outarr = .{uh.marc_0} },
    .{ .in_value = uh.csch_0, .out_unit = .sarc, .outarr = .{uh.sarc_0} },

    // =====================================
    // === csch(20°) → angle = 20° ==========
    // =====================================
    // ALL 12 UNITS for csch(20) - fractional coverage
    .{ .in_value = uh.csch_20, .out_unit = .none, .outarr = .{uh.rad_20} },
    .{ .in_value = uh.csch_20, .out_unit = .turn, .outarr = .{uh.turn_20} },
    .{ .in_value = uh.csch_20, .out_unit = .mulp, .outarr = .{uh.mulp_20} },
    .{ .in_value = uh.csch_20, .out_unit = .quad, .outarr = .{uh.quad_20} },
    .{ .in_value = uh.csch_20, .out_unit = .sext, .outarr = .{uh.sext_20} },
    .{ .in_value = uh.csch_20, .out_unit = .rad, .outarr = .{uh.rad_20} },
    .{ .in_value = uh.csch_20, .out_unit = .hexa, .outarr = .{uh.hexa_20} },
    .{ .in_value = uh.csch_20, .out_unit = .bdeg, .outarr = .{uh.bdeg_20} },
    .{ .in_value = uh.csch_20, .out_unit = .deg, .outarr = .{uh.deg_20} },
    .{ .in_value = uh.csch_20, .out_unit = .grad, .outarr = .{uh.grad_20} },
    .{ .in_value = uh.csch_20, .out_unit = .marc, .outarr = .{uh.marc_20} },
    .{ .in_value = uh.csch_20, .out_unit = .sarc, .outarr = .{uh.sarc_20} },

    // =====================================
    // === csch(30°) → angle = 30° ==========
    // =====================================
    // ALL 12 UNITS for csch(30)
    .{ .in_value = uh.csch_30, .out_unit = .none, .outarr = .{uh.rad_30} },
    .{ .in_value = uh.csch_30, .out_unit = .turn, .outarr = .{uh.turn_30} },
    .{ .in_value = uh.csch_30, .out_unit = .mulp, .outarr = .{uh.mulp_30} },
    .{ .in_value = uh.csch_30, .out_unit = .quad, .outarr = .{uh.quad_30} },
    .{ .in_value = uh.csch_30, .out_unit = .sext, .outarr = .{uh.sext_30} },
    .{ .in_value = uh.csch_30, .out_unit = .rad, .outarr = .{uh.rad_30} },
    .{ .in_value = uh.csch_30, .out_unit = .hexa, .outarr = .{uh.hexa_30} },
    .{ .in_value = uh.csch_30, .out_unit = .bdeg, .outarr = .{uh.bdeg_30} },
    .{ .in_value = uh.csch_30, .out_unit = .deg, .outarr = .{uh.deg_30} },
    .{ .in_value = uh.csch_30, .out_unit = .grad, .outarr = .{uh.grad_30} },
    .{ .in_value = uh.csch_30, .out_unit = .marc, .outarr = .{uh.marc_30} },
    .{ .in_value = uh.csch_30, .out_unit = .sarc, .outarr = .{uh.sarc_30} },

    // =====================================
    // === csch(45°) → angle = 45° ==========
    // =====================================
    // ALL 12 UNITS for csch(45)
    .{ .in_value = uh.csch_45, .out_unit = .none, .outarr = .{uh.rad_45} },
    .{ .in_value = uh.csch_45, .out_unit = .turn, .outarr = .{uh.turn_45} },
    .{ .in_value = uh.csch_45, .out_unit = .mulp, .outarr = .{uh.mulp_45} },
    .{ .in_value = uh.csch_45, .out_unit = .quad, .outarr = .{uh.quad_45} },
    .{ .in_value = uh.csch_45, .out_unit = .sext, .outarr = .{uh.sext_45} },
    .{ .in_value = uh.csch_45, .out_unit = .rad, .outarr = .{uh.rad_45} },
    .{ .in_value = uh.csch_45, .out_unit = .hexa, .outarr = .{uh.hexa_45} },
    .{ .in_value = uh.csch_45, .out_unit = .bdeg, .outarr = .{uh.bdeg_45} },
    .{ .in_value = uh.csch_45, .out_unit = .deg, .outarr = .{uh.deg_45} },
    .{ .in_value = uh.csch_45, .out_unit = .grad, .outarr = .{uh.grad_45} },
    .{ .in_value = uh.csch_45, .out_unit = .marc, .outarr = .{uh.marc_45} },
    .{ .in_value = uh.csch_45, .out_unit = .sarc, .outarr = .{uh.sarc_45} },

    // =====================================
    // === csch(60°) → angle = 60° ==========
    // =====================================
    // ALL 12 UNITS for csch(60)
    .{ .in_value = uh.csch_60, .out_unit = .none, .outarr = .{uh.rad_60} },
    .{ .in_value = uh.csch_60, .out_unit = .turn, .outarr = .{uh.turn_60} },
    .{ .in_value = uh.csch_60, .out_unit = .mulp, .outarr = .{uh.mulp_60} },
    .{ .in_value = uh.csch_60, .out_unit = .quad, .outarr = .{uh.quad_60} },
    .{ .in_value = uh.csch_60, .out_unit = .sext, .outarr = .{uh.sext_60} },
    .{ .in_value = uh.csch_60, .out_unit = .rad, .outarr = .{uh.rad_60} },
    .{ .in_value = uh.csch_60, .out_unit = .hexa, .outarr = .{uh.hexa_60} },
    .{ .in_value = uh.csch_60, .out_unit = .bdeg, .outarr = .{uh.bdeg_60} },
    .{ .in_value = uh.csch_60, .out_unit = .deg, .outarr = .{uh.deg_60} },
    .{ .in_value = uh.csch_60, .out_unit = .grad, .outarr = .{uh.grad_60} },
    .{ .in_value = uh.csch_60, .out_unit = .marc, .outarr = .{uh.marc_60} },
    .{ .in_value = uh.csch_60, .out_unit = .sarc, .outarr = .{uh.sarc_60} },

    // =====================================
    // === csch(90°) → angle = 90° ==========
    // =====================================
    // ALL 12 UNITS for csch(90)
    .{ .in_value = uh.csch_90, .out_unit = .none, .outarr = .{uh.rad_90} },
    .{ .in_value = uh.csch_90, .out_unit = .turn, .outarr = .{uh.turn_90} },
    .{ .in_value = uh.csch_90, .out_unit = .mulp, .outarr = .{uh.mulp_90} },
    .{ .in_value = uh.csch_90, .out_unit = .quad, .outarr = .{uh.quad_90} },
    .{ .in_value = uh.csch_90, .out_unit = .sext, .outarr = .{uh.sext_90} },
    .{ .in_value = uh.csch_90, .out_unit = .rad, .outarr = .{uh.rad_90} },
    .{ .in_value = uh.csch_90, .out_unit = .hexa, .outarr = .{uh.hexa_90} },
    .{ .in_value = uh.csch_90, .out_unit = .bdeg, .outarr = .{uh.bdeg_90} },
    .{ .in_value = uh.csch_90, .out_unit = .deg, .outarr = .{uh.deg_90} },
    .{ .in_value = uh.csch_90, .out_unit = .grad, .outarr = .{uh.grad_90} },
    .{ .in_value = uh.csch_90, .out_unit = .marc, .outarr = .{uh.marc_90} },
    .{ .in_value = uh.csch_90, .out_unit = .sarc, .outarr = .{uh.sarc_90} },

    // =====================================
    // === NEGATIVE CASE DUPLICATION ========
    // =====================================
    // ALL 12 UNITS for csch(-0) = -∞ → angle = -0°
    .{ .in_value = uh.csch_neg_0, .out_unit = .none, .outarr = .{uh.neg_rad_0} },
    .{ .in_value = uh.csch_neg_0, .out_unit = .turn, .outarr = .{uh.neg_turn_0} },
    .{ .in_value = uh.csch_neg_0, .out_unit = .mulp, .outarr = .{uh.neg_mulp_0} },
    .{ .in_value = uh.csch_neg_0, .out_unit = .quad, .outarr = .{uh.neg_quad_0} },
    .{ .in_value = uh.csch_neg_0, .out_unit = .sext, .outarr = .{uh.neg_sext_0} },
    .{ .in_value = uh.csch_neg_0, .out_unit = .rad, .outarr = .{uh.neg_rad_0} },
    .{ .in_value = uh.csch_neg_0, .out_unit = .hexa, .outarr = .{uh.neg_hexa_0} },
    .{ .in_value = uh.csch_neg_0, .out_unit = .bdeg, .outarr = .{uh.neg_bdeg_0} },
    .{ .in_value = uh.csch_neg_0, .out_unit = .deg, .outarr = .{uh.neg_deg_0} },
    .{ .in_value = uh.csch_neg_0, .out_unit = .grad, .outarr = .{uh.neg_grad_0} },
    .{ .in_value = uh.csch_neg_0, .out_unit = .marc, .outarr = .{uh.neg_marc_0} },
    .{ .in_value = uh.csch_neg_0, .out_unit = .sarc, .outarr = .{uh.neg_sarc_0} },

    // ALL 12 UNITS for csch(-20)
    .{ .in_value = uh.csch_neg_20, .out_unit = .none, .outarr = .{uh.neg_rad_20} },
    .{ .in_value = uh.csch_neg_20, .out_unit = .turn, .outarr = .{uh.neg_turn_20} },
    .{ .in_value = uh.csch_neg_20, .out_unit = .mulp, .outarr = .{uh.neg_mulp_20} },
    .{ .in_value = uh.csch_neg_20, .out_unit = .quad, .outarr = .{uh.neg_quad_20} },
    .{ .in_value = uh.csch_neg_20, .out_unit = .sext, .outarr = .{uh.neg_sext_20} },
    .{ .in_value = uh.csch_neg_20, .out_unit = .rad, .outarr = .{uh.neg_rad_20} },
    .{ .in_value = uh.csch_neg_20, .out_unit = .hexa, .outarr = .{uh.neg_hexa_20} },
    .{ .in_value = uh.csch_neg_20, .out_unit = .bdeg, .outarr = .{uh.neg_bdeg_20} },
    .{ .in_value = uh.csch_neg_20, .out_unit = .deg, .outarr = .{uh.neg_deg_20} },
    .{ .in_value = uh.csch_neg_20, .out_unit = .grad, .outarr = .{uh.neg_grad_20} },
    .{ .in_value = uh.csch_neg_20, .out_unit = .marc, .outarr = .{uh.neg_marc_20} },
    .{ .in_value = uh.csch_neg_20, .out_unit = .sarc, .outarr = .{uh.neg_sarc_20} },

    // ALL 12 UNITS for csch(-30)
    .{ .in_value = uh.csch_neg_30, .out_unit = .none, .outarr = .{uh.neg_rad_30} },
    .{ .in_value = uh.csch_neg_30, .out_unit = .turn, .outarr = .{uh.neg_turn_30} },
    .{ .in_value = uh.csch_neg_30, .out_unit = .mulp, .outarr = .{uh.neg_mulp_30} },
    .{ .in_value = uh.csch_neg_30, .out_unit = .quad, .outarr = .{uh.neg_quad_30} },
    .{ .in_value = uh.csch_neg_30, .out_unit = .sext, .outarr = .{uh.neg_sext_30} },
    .{ .in_value = uh.csch_neg_30, .out_unit = .rad, .outarr = .{uh.neg_rad_30} },
    .{ .in_value = uh.csch_neg_30, .out_unit = .hexa, .outarr = .{uh.neg_hexa_30} },
    .{ .in_value = uh.csch_neg_30, .out_unit = .bdeg, .outarr = .{uh.neg_bdeg_30} },
    .{ .in_value = uh.csch_neg_30, .out_unit = .deg, .outarr = .{uh.neg_deg_30} },
    .{ .in_value = uh.csch_neg_30, .out_unit = .grad, .outarr = .{uh.neg_grad_30} },
    .{ .in_value = uh.csch_neg_30, .out_unit = .marc, .outarr = .{uh.neg_marc_30} },
    .{ .in_value = uh.csch_neg_30, .out_unit = .sarc, .outarr = .{uh.neg_sarc_30} },

    // ALL 12 UNITS for csch(-45)
    .{ .in_value = uh.csch_neg_45, .out_unit = .none, .outarr = .{uh.neg_rad_45} },
    .{ .in_value = uh.csch_neg_45, .out_unit = .turn, .outarr = .{uh.neg_turn_45} },
    .{ .in_value = uh.csch_neg_45, .out_unit = .mulp, .outarr = .{uh.neg_mulp_45} },
    .{ .in_value = uh.csch_neg_45, .out_unit = .quad, .outarr = .{uh.neg_quad_45} },
    .{ .in_value = uh.csch_neg_45, .out_unit = .sext, .outarr = .{uh.neg_sext_45} },
    .{ .in_value = uh.csch_neg_45, .out_unit = .rad, .outarr = .{uh.neg_rad_45} },
    .{ .in_value = uh.csch_neg_45, .out_unit = .hexa, .outarr = .{uh.neg_hexa_45} },
    .{ .in_value = uh.csch_neg_45, .out_unit = .bdeg, .outarr = .{uh.neg_bdeg_45} },
    .{ .in_value = uh.csch_neg_45, .out_unit = .deg, .outarr = .{uh.neg_deg_45} },
    .{ .in_value = uh.csch_neg_45, .out_unit = .grad, .outarr = .{uh.neg_grad_45} },
    .{ .in_value = uh.csch_neg_45, .out_unit = .marc, .outarr = .{uh.neg_marc_45} },
    .{ .in_value = uh.csch_neg_45, .out_unit = .sarc, .outarr = .{uh.neg_sarc_45} },

    // ALL 12 UNITS for csch(-60)
    .{ .in_value = uh.csch_neg_60, .out_unit = .none, .outarr = .{uh.neg_rad_60} },
    .{ .in_value = uh.csch_neg_60, .out_unit = .turn, .outarr = .{uh.neg_turn_60} },
    .{ .in_value = uh.csch_neg_60, .out_unit = .mulp, .outarr = .{uh.neg_mulp_60} },
    .{ .in_value = uh.csch_neg_60, .out_unit = .quad, .outarr = .{uh.neg_quad_60} },
    .{ .in_value = uh.csch_neg_60, .out_unit = .sext, .outarr = .{uh.neg_sext_60} },
    .{ .in_value = uh.csch_neg_60, .out_unit = .rad, .outarr = .{uh.neg_rad_60} },
    .{ .in_value = uh.csch_neg_60, .out_unit = .hexa, .outarr = .{uh.neg_hexa_60} },
    .{ .in_value = uh.csch_neg_60, .out_unit = .bdeg, .outarr = .{uh.neg_bdeg_60} },
    .{ .in_value = uh.csch_neg_60, .out_unit = .deg, .outarr = .{uh.neg_deg_60} },
    .{ .in_value = uh.csch_neg_60, .out_unit = .grad, .outarr = .{uh.neg_grad_60} },
    .{ .in_value = uh.csch_neg_60, .out_unit = .marc, .outarr = .{uh.neg_marc_60} },
    .{ .in_value = uh.csch_neg_60, .out_unit = .sarc, .outarr = .{uh.neg_sarc_60} },

    // ALL 12 UNITS for csch(-90)
    .{ .in_value = uh.csch_neg_90, .out_unit = .none, .outarr = .{uh.neg_rad_90} },
    .{ .in_value = uh.csch_neg_90, .out_unit = .turn, .outarr = .{uh.neg_turn_90} },
    .{ .in_value = uh.csch_neg_90, .out_unit = .mulp, .outarr = .{uh.neg_mulp_90} },
    .{ .in_value = uh.csch_neg_90, .out_unit = .quad, .outarr = .{uh.neg_quad_90} },
    .{ .in_value = uh.csch_neg_90, .out_unit = .sext, .outarr = .{uh.neg_sext_90} },
    .{ .in_value = uh.csch_neg_90, .out_unit = .rad, .outarr = .{uh.neg_rad_90} },
    .{ .in_value = uh.csch_neg_90, .out_unit = .hexa, .outarr = .{uh.neg_hexa_90} },
    .{ .in_value = uh.csch_neg_90, .out_unit = .bdeg, .outarr = .{uh.neg_bdeg_90} },
    .{ .in_value = uh.csch_neg_90, .out_unit = .deg, .outarr = .{uh.neg_deg_90} },
    .{ .in_value = uh.csch_neg_90, .out_unit = .grad, .outarr = .{uh.neg_grad_90} },
    .{ .in_value = uh.csch_neg_90, .out_unit = .marc, .outarr = .{uh.neg_marc_90} },
    .{ .in_value = uh.csch_neg_90, .out_unit = .sarc, .outarr = .{uh.neg_sarc_90} },
};
