const std = @import("std");
const math = std.math;
const Angle = @import("../angle.zig").Angle;

pub fn unit_helper(comptime T: type) type {
    return struct {
        pub const angle = Angle(T);
        pub const pi = math.pi;
        pub const pix2 = pi * 2;

        pub const deg_to_rad: T = math.rad_per_deg;
        pub const deg_to_turn: T = 1.0 / 360.0;
        pub const deg_to_mulp: T = 1.0 / 180.0;
        pub const deg_to_quad: T = 1.0 / 90.0;
        pub const deg_to_sext: T = 1.0 / 60.0;
        pub const deg_to_hexa: T = 1.0 / 6.0;
        pub const deg_to_bdeg: T = 256.0 / 360.0;
        pub const deg_to_grad: T = 200.0 / 180.0;
        pub const deg_to_marc: T = 60.0;
        pub const deg_to_sarc: T = 3600.0;

        pub const deg_0: T = 0.0;
        pub const deg_20: T = 20.0;
        pub const deg_30: T = 30.0;
        pub const deg_45: T = 45.0;
        pub const deg_60: T = 60.0;
        pub const deg_90: T = 90.0;

        pub const neg_deg_0 = -deg_0;
        pub const neg_deg_20 = -deg_20;
        pub const neg_deg_30 = -deg_30;
        pub const neg_deg_45 = -deg_45;
        pub const neg_deg_60 = -deg_60;
        pub const neg_deg_90 = -deg_90;

        pub const rad_0 = deg_0 * deg_to_rad; //warning stick with f32, math.sinh etc
        pub const rad_20 = deg_20 * deg_to_rad;
        pub const rad_30 = deg_30 * deg_to_rad;
        pub const rad_45 = deg_45 * deg_to_rad;
        pub const rad_60 = deg_60 * deg_to_rad;
        pub const rad_90 = deg_90 * deg_to_rad;

        pub const neg_rad_0 = -rad_0;
        pub const neg_rad_20 = -rad_20;
        pub const neg_rad_30 = -rad_30;
        pub const neg_rad_45 = -rad_45;
        pub const neg_rad_60 = -rad_60;
        pub const neg_rad_90 = -rad_90;

        pub const sin_0 = math.sin(rad_0);
        pub const sin_20 = math.sin(rad_20);
        pub const sin_30 = math.sin(rad_30);
        pub const sin_45 = math.sin(rad_45);
        pub const sin_60 = math.sin(rad_60);
        pub const sin_90 = math.sin(rad_90);

        pub const sin_neg_0 = math.sin(neg_rad_0);
        pub const sin_neg_20 = math.sin(neg_rad_20);
        pub const sin_neg_30 = math.sin(neg_rad_30);
        pub const sin_neg_45 = math.sin(neg_rad_45);
        pub const sin_neg_60 = math.sin(neg_rad_60);
        pub const sin_neg_90 = math.sin(neg_rad_90);

        pub const cos_0 = math.cos(rad_0); // 1
        pub const cos_20 = math.cos(rad_20); // 0.9+
        pub const cos_30 = math.cos(rad_30); // 0.866
        pub const cos_45 = math.cos(rad_45); // 0.707
        pub const cos_60 = math.cos(rad_60); // 0.5
        pub const cos_90 = math.cos(rad_90); // 0

        pub const cos_neg_0 = math.cos(neg_rad_0);
        pub const cos_neg_20 = math.cos(neg_rad_20);
        pub const cos_neg_30 = math.cos(neg_rad_30);
        pub const cos_neg_45 = math.cos(neg_rad_45);
        pub const cos_neg_60 = math.cos(neg_rad_60);
        pub const cos_neg_90 = math.cos(neg_rad_90);

        pub const tan_0 = math.tan(rad_0);
        pub const tan_20 = math.tan(rad_20);
        pub const tan_30 = math.tan(rad_30);
        pub const tan_45 = math.tan(rad_45);
        pub const tan_60 = math.tan(rad_60);
        pub const tan_90 = angle.inf; // warning stick with f32, gamedev related

        pub const tan_neg_0 = math.tan(neg_rad_0);
        pub const tan_neg_20 = math.tan(neg_rad_20);
        pub const tan_neg_30 = math.tan(neg_rad_30);
        pub const tan_neg_45 = math.tan(neg_rad_45);
        pub const tan_neg_60 = math.tan(neg_rad_60);
        pub const tan_neg_90 = angle.neg_inf; // warning stick with f32, gamedev related

        pub const cot_0 = angle.inf; // warning stick with f32, gamedev related
        pub const cot_20 = 1.0 / math.tan(rad_20);
        pub const cot_30 = 1.0 / math.tan(rad_30);
        pub const cot_45 = 1.0 / math.tan(rad_45);
        pub const cot_60 = 1.0 / math.tan(rad_60);
        pub const cot_90 = 0.0;

        pub const cot_neg_0 = angle.neg_inf; // warning stick with f32, gamedev related
        pub const cot_neg_20 = 1.0 / math.tan(neg_rad_20);
        pub const cot_neg_30 = 1.0 / math.tan(neg_rad_30);
        pub const cot_neg_45 = 1.0 / math.tan(neg_rad_45);
        pub const cot_neg_60 = 1.0 / math.tan(neg_rad_60);
        pub const cot_neg_90 = -0.0;

        pub const sec_0 = 1.0 / math.cos(rad_0);
        pub const sec_20 = 1.0 / math.cos(rad_20);
        pub const sec_30 = 1.0 / math.cos(rad_30);
        pub const sec_45 = 1.0 / math.cos(rad_45);
        pub const sec_60 = 1.0 / math.cos(rad_60);
        pub const sec_90 = angle.inf; // warning stick with f32, gamedev related

        pub const sec_neg_0 = 1.0 / math.cos(neg_rad_0);
        pub const sec_neg_20 = 1.0 / math.cos(neg_rad_20);
        pub const sec_neg_30 = 1.0 / math.cos(neg_rad_30);
        pub const sec_neg_45 = 1.0 / math.cos(neg_rad_45);
        pub const sec_neg_60 = 1.0 / math.cos(neg_rad_60);
        pub const sec_neg_90 = angle.inf; // warning stick with f32, gamedev related

        pub const csc_0 = angle.inf; // warning stick with f32, gamedev related
        pub const csc_20 = 1.0 / math.sin(rad_20);
        pub const csc_30 = 1.0 / math.sin(rad_30);
        pub const csc_45 = 1.0 / math.sin(rad_45);
        pub const csc_60 = 1.0 / math.sin(rad_60);
        pub const csc_90 = 1.0 / math.sin(rad_90);

        pub const csc_neg_0 = angle.neg_inf; // warning stick with f32, gamedev related
        pub const csc_neg_20 = 1.0 / math.sin(neg_rad_20);
        pub const csc_neg_30 = 1.0 / math.sin(neg_rad_30);
        pub const csc_neg_45 = 1.0 / math.sin(neg_rad_45);
        pub const csc_neg_60 = 1.0 / math.sin(neg_rad_60);
        pub const csc_neg_90 = 1.0 / math.sin(neg_rad_90);

        pub const sinh_0 = math.sinh(rad_0);
        pub const sinh_20 = math.sinh(rad_20);
        pub const sinh_30 = math.sinh(rad_30);
        pub const sinh_45 = math.sinh(rad_45);
        pub const sinh_60 = math.sinh(rad_60);
        pub const sinh_90 = math.sinh(rad_90);

        pub const sinh_neg_0 = math.sinh(neg_rad_0);
        pub const sinh_neg_20 = math.sinh(neg_rad_20);
        pub const sinh_neg_30 = math.sinh(neg_rad_30);
        pub const sinh_neg_45 = math.sinh(neg_rad_45);
        pub const sinh_neg_60 = math.sinh(neg_rad_60);
        pub const sinh_neg_90 = math.sinh(neg_rad_90);

        pub const cosh_0 = math.cosh(rad_0);
        pub const cosh_20 = math.cosh(rad_20);
        pub const cosh_30 = math.cosh(rad_30);
        pub const cosh_45 = math.cosh(rad_45);
        pub const cosh_60 = math.cosh(rad_60);
        pub const cosh_90 = math.cosh(rad_90);

        pub const cosh_neg_0 = math.cosh(neg_rad_0);
        pub const cosh_neg_20 = math.cosh(neg_rad_20);
        pub const cosh_neg_30 = math.cosh(neg_rad_30);
        pub const cosh_neg_45 = math.cosh(neg_rad_45);
        pub const cosh_neg_60 = math.cosh(neg_rad_60);
        pub const cosh_neg_90 = math.cosh(neg_rad_90);

        pub const tanh_0 = math.tanh(rad_0);
        pub const tanh_20 = math.tanh(rad_20);
        pub const tanh_30 = math.tanh(rad_30);
        pub const tanh_45 = math.tanh(rad_45);
        pub const tanh_60 = math.tanh(rad_60);
        pub const tanh_90 = math.tanh(rad_90);

        pub const tanh_neg_0 = math.tanh(neg_rad_0);
        pub const tanh_neg_20 = math.tanh(neg_rad_20);
        pub const tanh_neg_30 = math.tanh(neg_rad_30);
        pub const tanh_neg_45 = math.tanh(neg_rad_45);
        pub const tanh_neg_60 = math.tanh(neg_rad_60);
        pub const tanh_neg_90 = math.tanh(neg_rad_90);

        pub const coth_0 = angle.inf; // warning stick with f32, gamedev related
        pub const coth_20 = 1.0 / math.tanh(rad_20);
        pub const coth_30 = 1.0 / math.tanh(rad_30);
        pub const coth_45 = 1.0 / math.tanh(rad_45);
        pub const coth_60 = 1.0 / math.tanh(rad_60);
        pub const coth_90 = 1.0 / math.tanh(rad_90);

        pub const coth_neg_0 = angle.neg_inf; // warning stick with f32, gamedev related
        pub const coth_neg_20 = 1.0 / math.tanh(neg_rad_20);
        pub const coth_neg_30 = 1.0 / math.tanh(neg_rad_30);
        pub const coth_neg_45 = 1.0 / math.tanh(neg_rad_45);
        pub const coth_neg_60 = 1.0 / math.tanh(neg_rad_60);
        pub const coth_neg_90 = 1.0 / math.tanh(neg_rad_90);

        pub const sech_0 = 1.0 / math.cosh(rad_0);
        pub const sech_20 = 1.0 / math.cosh(rad_20);
        pub const sech_30 = 1.0 / math.cosh(rad_30);
        pub const sech_45 = 1.0 / math.cosh(rad_45);
        pub const sech_60 = 1.0 / math.cosh(rad_60);
        pub const sech_90 = 1.0 / math.cosh(rad_90);

        pub const sech_neg_0 = 1.0 / math.cosh(neg_rad_0);
        pub const sech_neg_20 = 1.0 / math.cosh(neg_rad_20);
        pub const sech_neg_30 = 1.0 / math.cosh(neg_rad_30);
        pub const sech_neg_45 = 1.0 / math.cosh(neg_rad_45);
        pub const sech_neg_60 = 1.0 / math.cosh(neg_rad_60);
        pub const sech_neg_90 = 1.0 / math.cosh(neg_rad_90);

        pub const csch_0 = angle.inf; // warning stick with f32, gamedev related
        pub const csch_20 = 1.0 / math.sinh(rad_20);
        pub const csch_30 = 1.0 / math.sinh(rad_30);
        pub const csch_45 = 1.0 / math.sinh(rad_45);
        pub const csch_60 = 1.0 / math.sinh(rad_60);
        pub const csch_90 = 1.0 / math.sinh(rad_90);

        pub const csch_neg_0 = angle.neg_inf; // warning stick with f32, gamedev related
        pub const csch_neg_20 = 1.0 / math.sinh(neg_rad_20);
        pub const csch_neg_30 = 1.0 / math.sinh(neg_rad_30);
        pub const csch_neg_45 = 1.0 / math.sinh(neg_rad_45);
        pub const csch_neg_60 = 1.0 / math.sinh(neg_rad_60);
        pub const csch_neg_90 = 1.0 / math.sinh(neg_rad_90);

        pub const turn_0 = deg_0 * deg_to_turn;
        pub const turn_20 = deg_20 * deg_to_turn;
        pub const turn_30 = deg_30 * deg_to_turn;
        pub const turn_45 = deg_45 * deg_to_turn;
        pub const turn_60 = deg_60 * deg_to_turn;
        pub const turn_90 = deg_90 * deg_to_turn;

        pub const neg_turn_0 = -turn_0;
        pub const neg_turn_20 = -turn_20;
        pub const neg_turn_30 = -turn_30;
        pub const neg_turn_45 = -turn_45;
        pub const neg_turn_60 = -turn_60;
        pub const neg_turn_90 = -turn_90;

        pub const mulp_0 = deg_0 * deg_to_mulp;
        pub const mulp_20 = deg_20 * deg_to_mulp;
        pub const mulp_30 = deg_30 * deg_to_mulp;
        pub const mulp_45 = deg_45 * deg_to_mulp;
        pub const mulp_60 = deg_60 * deg_to_mulp;
        pub const mulp_90 = deg_90 * deg_to_mulp;

        pub const neg_mulp_0 = -mulp_0;
        pub const neg_mulp_20 = -mulp_20;
        pub const neg_mulp_30 = -mulp_30;
        pub const neg_mulp_45 = -mulp_45;
        pub const neg_mulp_60 = -mulp_60;
        pub const neg_mulp_90 = -mulp_90;

        pub const quad_0 = deg_0 * deg_to_quad;
        pub const quad_20 = deg_20 * deg_to_quad;
        pub const quad_30 = deg_30 * deg_to_quad;
        pub const quad_45 = deg_45 * deg_to_quad;
        pub const quad_60 = deg_60 * deg_to_quad;
        pub const quad_90 = deg_90 * deg_to_quad;

        pub const neg_quad_0 = -quad_0;
        pub const neg_quad_20 = -quad_20;
        pub const neg_quad_30 = -quad_30;
        pub const neg_quad_45 = -quad_45;
        pub const neg_quad_60 = -quad_60;
        pub const neg_quad_90 = -quad_90;

        pub const sext_0 = deg_0 * deg_to_sext;
        pub const sext_20 = deg_20 * deg_to_sext;
        pub const sext_30 = deg_30 * deg_to_sext;
        pub const sext_45 = deg_45 * deg_to_sext;
        pub const sext_60 = deg_60 * deg_to_sext;
        pub const sext_90 = deg_90 * deg_to_sext;

        pub const neg_sext_0 = -sext_0;
        pub const neg_sext_20 = -sext_20;
        pub const neg_sext_30 = -sext_30;
        pub const neg_sext_45 = -sext_45;
        pub const neg_sext_60 = -sext_60;
        pub const neg_sext_90 = -sext_90;

        pub const hexa_0 = deg_0 * deg_to_hexa;
        pub const hexa_20 = deg_20 * deg_to_hexa;
        pub const hexa_30 = deg_30 * deg_to_hexa;
        pub const hexa_45 = deg_45 * deg_to_hexa;
        pub const hexa_60 = deg_60 * deg_to_hexa;
        pub const hexa_90 = deg_90 * deg_to_hexa;

        pub const neg_hexa_0 = -hexa_0;
        pub const neg_hexa_20 = -hexa_20;
        pub const neg_hexa_30 = -hexa_30;
        pub const neg_hexa_45 = -hexa_45;
        pub const neg_hexa_60 = -hexa_60;
        pub const neg_hexa_90 = -hexa_90;

        pub const bdeg_0 = deg_0 * deg_to_bdeg;
        pub const bdeg_20 = deg_20 * deg_to_bdeg;
        pub const bdeg_30 = deg_30 * deg_to_bdeg;
        pub const bdeg_45 = deg_45 * deg_to_bdeg;
        pub const bdeg_60 = deg_60 * deg_to_bdeg;
        pub const bdeg_90 = deg_90 * deg_to_bdeg;

        pub const neg_bdeg_0 = -bdeg_0;
        pub const neg_bdeg_20 = -bdeg_20;
        pub const neg_bdeg_30 = -bdeg_30;
        pub const neg_bdeg_45 = -bdeg_45;
        pub const neg_bdeg_60 = -bdeg_60;
        pub const neg_bdeg_90 = -bdeg_90;

        pub const grad_0 = deg_0 * deg_to_grad;
        pub const grad_20 = deg_20 * deg_to_grad;
        pub const grad_30 = deg_30 * deg_to_grad;
        pub const grad_45 = deg_45 * deg_to_grad;
        pub const grad_60 = deg_60 * deg_to_grad;
        pub const grad_90 = deg_90 * deg_to_grad;

        pub const neg_grad_0 = -grad_0;
        pub const neg_grad_20 = -grad_20;
        pub const neg_grad_30 = -grad_30;
        pub const neg_grad_45 = -grad_45;
        pub const neg_grad_60 = -grad_60;
        pub const neg_grad_90 = -grad_90;

        pub const marc_0 = deg_0 * deg_to_marc;
        pub const marc_20 = deg_20 * deg_to_marc;
        pub const marc_30 = deg_30 * deg_to_marc;
        pub const marc_45 = deg_45 * deg_to_marc;
        pub const marc_60 = deg_60 * deg_to_marc;
        pub const marc_90 = deg_90 * deg_to_marc;

        pub const neg_marc_0 = -marc_0;
        pub const neg_marc_20 = -marc_20;
        pub const neg_marc_30 = -marc_30;
        pub const neg_marc_45 = -marc_45;
        pub const neg_marc_60 = -marc_60;
        pub const neg_marc_90 = -marc_90;

        pub const sarc_0 = deg_0 * deg_to_sarc;
        pub const sarc_20 = deg_20 * deg_to_sarc;
        pub const sarc_30 = deg_30 * deg_to_sarc;
        pub const sarc_45 = deg_45 * deg_to_sarc;
        pub const sarc_60 = deg_60 * deg_to_sarc;
        pub const sarc_90 = deg_90 * deg_to_sarc;

        pub const neg_sarc_0 = -sarc_0;
        pub const neg_sarc_20 = -sarc_20;
        pub const neg_sarc_30 = -sarc_30;
        pub const neg_sarc_45 = -sarc_45;
        pub const neg_sarc_60 = -sarc_60;
        pub const neg_sarc_90 = -sarc_90;
    };
}
