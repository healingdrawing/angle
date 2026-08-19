// @ts-nocheck
// ts/terminalcall.ts — CLI bridge for Zig cross-checks
// Usage: bun ts/terminalcall.ts <method> <args...>
// Example: bun ts/terminalcall.ts from 1 2
// stdout: one result line only

import { Angle, AngleUnit } from "./angle";

const VALID_UNITS = new Set(Object.values(AngleUnit).filter(v => typeof v === 'number'));
const is_valid_unit = (v: number) => VALID_UNITS.has(v);

const angle = new Angle();

type Handler = (args: number[]) => number | number[];

const methods: Record<string, Handler> = {
  from: (a) => {
    if (a.length !== 3) throw new Error("call Angle.from needs 3 numbers");
    if (!is_valid_unit(a[0])) throw new Error("Angle.from bad in_unit");
    if (!is_valid_unit(a[2])) throw new Error("Angle.from bad out_unit");
    
    const in_unit = a[0];
    const in_value = a[1];
    const out_unit = a[2];
    
    const result = Angle.from(in_unit, in_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from: switch failed. Should not happen");
    }
  },
  add: (a) => {
    // args: [initial_in_unit, initial_value, add_in_unit, add_value, out_unit]
    if (a.length !== 5) throw new Error("call Angle.add needs 5 numbers");
    if (!is_valid_unit(a[0])) throw new Error("Angle.add bad initial_unit");
    if (!is_valid_unit(a[2])) throw new Error("Angle.add bad add_unit");
    if (!is_valid_unit(a[4])) throw new Error("Angle.add bad out_unit");
    
    const in_unit = a[0];
    const in_value = a[1];
    const add_unit = a[2];
    const add_value = a[3];
    const out_unit = a[4];
    
    const result = Angle.from(in_unit, in_value);
    result.add(add_unit, add_value);
    
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.add: switch failed. Should not happen");
    }
  },
  from_sin: (a) => {
    if (a.length !== 2) throw new Error("call Angle.from_sin needs 2 numbers");
    if (!is_valid_unit(a[1])) throw new Error("Angle.from_sin bad out_unit");
    
    const sin_value = a[0];
    const out_unit = a[1];
    
    const result = Angle.from_sin(sin_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from_sin: switch failed. Should not happen");
    }
  },
  from_cos: (a) => {
    if (a.length !== 2) throw new Error("call Angle.from_cos needs 2 numbers");
    if (!is_valid_unit(a[1])) throw new Error("Angle.from_cos bad out_unit");
    
    const cos_value = a[0];
    const out_unit = a[1];
    
    const result = Angle.from_cos(cos_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from_cos: switch failed. Should not happen");
    }
  },
  from_tan: (a) => {
    if (a.length !== 2) throw new Error("call Angle.from_tan needs 2 numbers");
    if (!is_valid_unit(a[1])) throw new Error("Angle.from_tan bad out_unit");
    
    const tan_value = a[0];
    const out_unit = a[1];
    
    const result = Angle.from_tan(tan_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from_tan: switch failed. Should not happen");
    }
  },
  from_cot: (a) => {
    if (a.length !== 2) throw new Error("call Angle.from_cot needs 2 numbers");
    if (!is_valid_unit(a[1])) throw new Error("Angle.from_cot bad out_unit");
    
    const cot_value = a[0];
    const out_unit = a[1];
    
    const result = Angle.from_cot(cot_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from_cot: switch failed. Should not happen");
    }
  },
  from_sec: (a) => {
    if (a.length !== 2) throw new Error("call Angle.from_sec needs 2 numbers");
    if (!is_valid_unit(a[1])) throw new Error("Angle.from_sec bad out_unit");
    
    const sec_value = a[0];
    const out_unit = a[1];
    
    const result = Angle.from_sec(sec_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from_sec: switch failed. Should not happen");
    }
  },
  from_csc: (a) => {
    if (a.length !== 2) throw new Error("call Angle.from_csc needs 2 numbers");
    if (!is_valid_unit(a[1])) throw new Error("Angle.from_csc bad out_unit");
    
    const csc_value = a[0];
    const out_unit = a[1];
    
    const result = Angle.from_csc(csc_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from_csc: switch failed. Should not happen");
    }
  },
  from_sinh: (a) => {
    if (a.length !== 2) throw new Error("call Angle.from_sinh needs 2 numbers");
    if (!is_valid_unit(a[1])) throw new Error("Angle.from_sinh bad out_unit");
    
    const sinh_value = a[0];
    const out_unit = a[1];
    
    const result = Angle.from_sinh(sinh_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from_sinh: switch failed. Should not happen");
    }
  },
  from_cosh: (a) => {
    if (a.length !== 2) throw new Error("call Angle.from_cosh needs 2 numbers");
    if (!is_valid_unit(a[1])) throw new Error("Angle.from_cosh bad out_unit");
    
    const cosh_value = a[0];
    const out_unit = a[1];
    
    const result = Angle.from_cosh(cosh_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from_cosh: switch failed. Should not happen");
    }
  },
  from_tanh: (a) => {
    if (a.length !== 2) throw new Error("call Angle.from_tanh needs 2 numbers");
    if (!is_valid_unit(a[1])) throw new Error("Angle.from_tanh bad out_unit");
    
    const tanh_value = a[0];
    const out_unit = a[1];
    
    const result = Angle.from_tanh(tanh_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from_tanh: switch failed. Should not happen");
    }
  },
  from_coth: (a) => {
    if (a.length !== 2) throw new Error("call Angle.from_coth needs 2 numbers");
    if (!is_valid_unit(a[1])) throw new Error("Angle.from_coth bad out_unit");
    
    const coth_value = a[0];
    const out_unit = a[1];
    
    const result = Angle.from_coth(coth_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from_coth: switch failed. Should not happen");
    }
  },
  from_sech: (a) => {
    if (a.length !== 2) throw new Error("call Angle.from_sech needs 2 numbers");
    if (!is_valid_unit(a[1])) throw new Error("Angle.from_sech bad out_unit");
    
    const sech_value = a[0];
    const out_unit = a[1];
    
    const result = Angle.from_sech(sech_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from_sech: switch failed. Should not happen");
    }
  },
  from_csch: (a) => {
    if (a.length !== 2) throw new Error("call Angle.from_csch needs 2 numbers");
    if (!is_valid_unit(a[1])) throw new Error("Angle.from_csch bad out_unit");
    
    const csch_value = a[0];
    const out_unit = a[1];
    
    const result = Angle.from_csch(csch_value);
    switch(out_unit){
      case AngleUnit.none: return result.rad()
      case AngleUnit.turn: return result.turn()
      case AngleUnit.mulp: return result.mulp()
      case AngleUnit.quad: return result.quad()
      case AngleUnit.sext: return result.sext()
      case AngleUnit.rad: return result.rad()
      case AngleUnit.hexa: return result.hexa()
      case AngleUnit.bdeg: return result.bdeg()
      case AngleUnit.deg: return result.deg()
      case AngleUnit.grad: return result.grad()
      case AngleUnit.marc: return result.marc()
      case AngleUnit.sarc: return result.sarc()
      default: throw new Error("Angle.from_csch: switch failed. Should not happen");
    }
  },
  // executed_method_title: (a) => { ... },
};

const [method, ...rest] = process.argv.slice(2);

if (!method) {
  console.error("Usage: bun ts/terminalcall.ts <method> <args...>");
  process.exit(2);
}

const fn = methods[method];
if (!fn) {
  console.error(`unknown method: ${method}`);
  process.exit(2);
}

const nums = rest.map((s) => {
  if (s === "NaN") return NaN;
  if (s === "Infinity") return Infinity;
  if (s === "-Infinity") return -Infinity;
  const n = Number(s);
  if (Number.isNaN(n)) throw new Error(`not a number: ${s}`);
  return n;
});

try {
  const out = fn(nums);
  // patch for boolean result true false -> 1 0 between ts and zig to solidify to numbers only
  if ( typeof out === "boolean") console.log(out?1:0)
  else if (typeof out === "number") {
    console.log(float_to_string(out));
  } else {
    console.log(Array.from(out).map(float_to_string).join(" "));
  }
} catch (e) {
  console.error(e instanceof Error ? e.message : e);
  process.exit(1);
}

function float_to_string(val: number): string {
  if (Number.isNaN(val)) {
    return "NaN";
  } else if (!Number.isFinite(val)) {
    return val > 0 ? "Infinity" : "-Infinity";
  } else {
    return String(val);
  }
}
