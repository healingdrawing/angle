const std = @import("std");
const math = std.math;

pub const unit_helper = struct {
    pub const pi = math.pi;
    pub const pix2 = pi * 2;

    pub const deg_0 = 0.0;
    pub const deg_20 = 20.0;
    pub const deg_30 = 30.0;
    pub const deg_45 = 45.0;
    pub const deg_60 = 60.0;
    pub const deg_90 = 90.0;

    pub const deg_to_rad = math.rad_per_deg;
    pub const deg_to_turn = 1.0 / 360.0;
    pub const deg_to_mulp = 1.0 / 180.0;
    pub const deg_to_quad = 1.0 / 90.0;
    pub const deg_to_sext = 1.0 / 60.0;
    pub const deg_to_hexa = 1.0 / 6.0;
    pub const deg_to_bdeg = 256.0 / 360.0;
    pub const deg_to_grad = 200.0 / 180.0;
    pub const deg_to_marc = 60.0;
    pub const deg_to_sarc = 3600.0;

    pub const cos_0 = math.cos(deg_0 * deg_to_rad); // 1
    pub const cos_20 = math.cos(deg_20 * deg_to_rad); // 0.9+
    pub const cos_30 = math.cos(deg_30 * deg_to_rad); // 0.866
    pub const cos_45 = math.cos(deg_45 * deg_to_rad); // 0.707
    pub const cos_60 = math.cos(deg_60 * deg_to_rad); // 0.5
    pub const cos_90 = math.cos(deg_90 * deg_to_rad); // 0

    pub const rad_0 = deg_0 * deg_to_rad;
    pub const rad_20 = deg_20 * deg_to_rad;
    pub const rad_30 = deg_30 * deg_to_rad;
    pub const rad_45 = deg_45 * deg_to_rad;
    pub const rad_60 = deg_60 * deg_to_rad;
    pub const rad_90 = deg_90 * deg_to_rad;

    pub const turn_0 = deg_0 * deg_to_turn;
    pub const turn_20 = deg_20 * deg_to_turn;
    pub const turn_30 = deg_30 * deg_to_turn;
    pub const turn_45 = deg_45 * deg_to_turn;
    pub const turn_60 = deg_60 * deg_to_turn;
    pub const turn_90 = deg_90 * deg_to_turn;

    pub const mulp_0 = deg_0 * deg_to_mulp;
    pub const mulp_20 = deg_20 * deg_to_mulp;
    pub const mulp_30 = deg_30 * deg_to_mulp;
    pub const mulp_45 = deg_45 * deg_to_mulp;
    pub const mulp_60 = deg_60 * deg_to_mulp;
    pub const mulp_90 = deg_90 * deg_to_mulp;

    pub const quad_0 = deg_0 * deg_to_quad;
    pub const quad_20 = deg_20 * deg_to_quad;
    pub const quad_30 = deg_30 * deg_to_quad;
    pub const quad_45 = deg_45 * deg_to_quad;
    pub const quad_60 = deg_60 * deg_to_quad;
    pub const quad_90 = deg_90 * deg_to_quad;

    pub const sext_0 = deg_0 * deg_to_sext;
    pub const sext_20 = deg_20 * deg_to_sext;
    pub const sext_30 = deg_30 * deg_to_sext;
    pub const sext_45 = deg_45 * deg_to_sext;
    pub const sext_60 = deg_60 * deg_to_sext;
    pub const sext_90 = deg_90 * deg_to_sext;

    pub const hexa_0 = deg_0 * deg_to_hexa;
    pub const hexa_20 = deg_20 * deg_to_hexa;
    pub const hexa_30 = deg_30 * deg_to_hexa;
    pub const hexa_45 = deg_45 * deg_to_hexa;
    pub const hexa_60 = deg_60 * deg_to_hexa;
    pub const hexa_90 = deg_90 * deg_to_hexa;

    pub const bdeg_0 = deg_0 * deg_to_bdeg;
    pub const bdeg_20 = deg_20 * deg_to_bdeg;
    pub const bdeg_30 = deg_30 * deg_to_bdeg;
    pub const bdeg_45 = deg_45 * deg_to_bdeg;
    pub const bdeg_60 = deg_60 * deg_to_bdeg;
    pub const bdeg_90 = deg_90 * deg_to_bdeg;

    pub const grad_0 = deg_0 * deg_to_grad;
    pub const grad_20 = deg_20 * deg_to_grad;
    pub const grad_30 = deg_30 * deg_to_grad;
    pub const grad_45 = deg_45 * deg_to_grad;
    pub const grad_60 = deg_60 * deg_to_grad;
    pub const grad_90 = deg_90 * deg_to_grad;

    pub const marc_0 = deg_0 * deg_to_marc;
    pub const marc_20 = deg_20 * deg_to_marc;
    pub const marc_30 = deg_30 * deg_to_marc;
    pub const marc_45 = deg_45 * deg_to_marc;
    pub const marc_60 = deg_60 * deg_to_marc;
    pub const marc_90 = deg_90 * deg_to_marc;

    pub const sarc_0 = deg_0 * deg_to_sarc;
    pub const sarc_20 = deg_20 * deg_to_sarc;
    pub const sarc_30 = deg_30 * deg_to_sarc;
    pub const sarc_45 = deg_45 * deg_to_sarc;
    pub const sarc_60 = deg_60 * deg_to_sarc;
    pub const sarc_90 = deg_90 * deg_to_sarc;
};
