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
    const result = Angle.from(a[0], a[1]);
    switch(a[2]){
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
