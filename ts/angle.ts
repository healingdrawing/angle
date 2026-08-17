/**
 * Angle enum with various angular units
 */
export enum AngleUnit {
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
  sarc = 11
}

/**
 * Angle class with internal storage in RADIANS.
 */
export class Angle {
  private _value: number; // Stored in radians internally
  private static pi = Math.PI
  private static pix2 = Angle.pi * 2
  
  /**
   * Static lookup table for unit conversion factors (to radians)
   */
  private static readonly CONVERSION_TO_RAD: Readonly<Record<AngleUnit, number>> = {
      [AngleUnit.none]: 1,
      [AngleUnit.turn]: Angle.pix2,
      [AngleUnit.mulp]: Angle.pi,
      [AngleUnit.quad]: Angle.pi / 2,
      [AngleUnit.sext]: Angle.pi / 3,
      [AngleUnit.rad]: 1,
      [AngleUnit.hexa]: Angle.pi / 30,
      [AngleUnit.bdeg]: Angle.pi / 128,
      [AngleUnit.deg]: Angle.pi / 180,
      [AngleUnit.grad]: Angle.pi / 200,
      [AngleUnit.marc]: Angle.pi / 10800,
      [AngleUnit.sarc]: Angle.pi / 648000,
  };

  /**
   * Static lookup table for unit conversion factors (from radians)
   * Reciprocal of TO_RAD - used by getters
   */
  private static readonly CONVERSION_FROM_RAD: Readonly<Record<AngleUnit, number>> = {
      [AngleUnit.none]: 1,
      [AngleUnit.turn]: 1 / Angle.pix2,
      [AngleUnit.mulp]: 1 / Angle.pi,
      [AngleUnit.quad]: 2 / Angle.pi,
      [AngleUnit.sext]: 3 / Angle.pi,
      [AngleUnit.rad]: 1,
      [AngleUnit.hexa]: 30 / Angle.pi,
      [AngleUnit.bdeg]: 128 / Angle.pi,
      [AngleUnit.deg]: 180 / Angle.pi,
      [AngleUnit.grad]: 200 / Angle.pi,
      [AngleUnit.marc]: 10800 / Angle.pi,
      [AngleUnit.sarc]: 648000 / Angle.pi,
  };
  
  /**
   * Constructor - creates a new angle with value 0 (in radians)
   */
  constructor() {
      this._value = 0;
  }

  /**
   * Create new angle from specified unit (static factory)
   */
  public static from(unit: AngleUnit, value: number): Angle {
      const a = new Angle();
      return a.use(unit, value);
  }

  // --- Wrapper methods for each unit (call generic from()) ---

  public static from_angle(angle: Angle): Angle {
      return Angle.from(AngleUnit.rad, angle.rad());
  }

  public static from_turn(value: number): Angle {
      return Angle.from(AngleUnit.turn, value);
  }

  public static from_mulp(value: number): Angle {
      return Angle.from(AngleUnit.mulp, value);
  }

  public static from_quad(value: number): Angle {
      return Angle.from(AngleUnit.quad, value);
  }

  public static from_sext(value: number): Angle {
      return Angle.from(AngleUnit.sext, value);
  }

  public static from_rad(value: number): Angle {
      return Angle.from(AngleUnit.rad, value);
  }

  public static from_hexa(value: number): Angle {
      return Angle.from(AngleUnit.hexa, value);
  }

  public static from_bdeg(value: number): Angle {
      return Angle.from(AngleUnit.bdeg, value);
  }

  public static from_deg(value: number): Angle {
      return Angle.from(AngleUnit.deg, value);
  }

  public static from_grad(value: number): Angle {
      return Angle.from(AngleUnit.grad, value);
  }

  public static from_marc(value: number): Angle {
      return Angle.from(AngleUnit.marc, value);
  }

  public static from_sarc(value: number): Angle {
      return Angle.from(AngleUnit.sarc, value);
  }

  // Factory methods from trig values
  public static from_sin(v: number): Angle {
      const a = new Angle();
      a.use_sin(v);
      return a;
  }

  public static from_cos(v: number): Angle {
      const a = new Angle();
      a.use_cos(v);
      return a;
  }

  public static from_tan(v: number): Angle {
      const a = new Angle();
      a.use_tan(v);
      return a;
  }

  public static from_cot(v: number): Angle {
      const a = new Angle();
      a.use_cot(v);
      return a;
  }

  public static from_sec(v: number): Angle {
      const a = new Angle();
      a.use_sec(v);
      return a;
  }

  public static from_csc(v: number): Angle {
      const a = new Angle();
      a.use_csc(v);
      return a;
  }

  public static from_sinh(v: number): Angle {
      const a = new Angle();
      a.use_sinh(v);
      return a;
  }

  public static from_cosh(v: number): Angle {
      const a = new Angle();
      a.use_cosh(v);
      return a;
  }

  public static from_tanh(v: number): Angle {
      const a = new Angle();
      a.use_tanh(v);
      return a;
  }

  public static from_coth(v: number): Angle {
      const a = new Angle();
      a.use_coth(v);
      return a;
  }

  public static from_sech(v: number): Angle {
      const a = new Angle();
      a.use_sech(v);
      return a;
  }

  public static from_csch(v: number): Angle {
      const a = new Angle();
      a.use_csch(v);
      return a;
  }

  // ---------------- Individual unit setters (wrappers around use()) ----------------

  public use_turn(value: number): Angle {
      return this.use(AngleUnit.turn, value);
  }

  public use_mulp(value: number): Angle {
      return this.use(AngleUnit.mulp, value);
  }

  public use_quad(value: number): Angle {
      return this.use(AngleUnit.quad, value);
  }

  public use_sext(value: number): Angle {
      return this.use(AngleUnit.sext, value);
  }

  public use_rad(value: number): Angle {
      return this.use(AngleUnit.rad, value);
  }

  public use_hexa(value: number): Angle {
      return this.use(AngleUnit.hexa, value);
  }

  public use_bdeg(value: number): Angle {
      return this.use(AngleUnit.bdeg, value);
  }

  public use_deg(value: number): Angle {
      return this.use(AngleUnit.deg, value);
  }

  public use_grad(value: number): Angle {
      return this.use(AngleUnit.grad, value);
  }

  public use_marc(value: number): Angle {
      return this.use(AngleUnit.marc, value);
  }

  public use_sarc(value: number): Angle {
      return this.use(AngleUnit.sarc, value);
  }

  public use_angle(angle: Angle): Angle {
      this._value = angle._value;
      return this;
  }

  // ==================== ADD VALUE METHODS ====================

  public add_turn(value: number): Angle {
      return this.add(AngleUnit.turn, value);
  }

  public add_mulp(value: number): Angle {
      return this.add(AngleUnit.mulp, value);
  }

  public add_quad(value: number): Angle {
      return this.add(AngleUnit.quad, value);
  }

  public add_sext(value: number): Angle {
      return this.add(AngleUnit.sext, value);
  }

  public add_rad(value: number): Angle {
      return this.add(AngleUnit.rad, value);
  }

  public add_hexa(value: number): Angle {
      return this.add(AngleUnit.hexa, value);
  }

  public add_bdeg(value: number): Angle {
      return this.add(AngleUnit.bdeg, value);
  }

  public add_deg(value: number): Angle {
      return this.add(AngleUnit.deg, value);
  }

  public add_grad(value: number): Angle {
      return this.add(AngleUnit.grad, value);
  }

  public add_marc(value: number): Angle {
      return this.add(AngleUnit.marc, value);
  }

  public add_sarc(value: number): Angle {
      return this.add(AngleUnit.sarc, value);
  }

  public add_angle(angle: Angle): Angle {
      this._value += angle._value;
      return this;
  }

  // ==================== GET VALUE METHODS ====================

  public turn(): number {
      return this._value * Angle.CONVERSION_FROM_RAD[AngleUnit.turn];
  }

  public mulp(): number {
      return this._value * Angle.CONVERSION_FROM_RAD[AngleUnit.mulp];
  }

  public quad(): number {
      return this._value * Angle.CONVERSION_FROM_RAD[AngleUnit.quad];
  }

  public sext(): number {
      return this._value * Angle.CONVERSION_FROM_RAD[AngleUnit.sext];
  }

  public rad(): number {
      return this._value;
  }

  public hexa(): number {
      return this._value * Angle.CONVERSION_FROM_RAD[AngleUnit.hexa];
  }

  public bdeg(): number {
      return this._value * Angle.CONVERSION_FROM_RAD[AngleUnit.bdeg];
  }

  public deg(): number {
      return this._value * Angle.CONVERSION_FROM_RAD[AngleUnit.deg];
  }

  public grad(): number {
      return this._value * Angle.CONVERSION_FROM_RAD[AngleUnit.grad];
  }

  public marc(): number {
      return this._value * Angle.CONVERSION_FROM_RAD[AngleUnit.marc];
  }

  public sarc(): number {
      return this._value * Angle.CONVERSION_FROM_RAD[AngleUnit.sarc];
  }

  // ==================== TRIGONOMETRIC FUNCTIONS ====================

  public sin(): number {
      return Math.sin(this._value);
  }

  public cos(): number {
      return Math.cos(this._value);
  }

  public tan(): number {
      return Math.tan(this._value);
  }

  public cot(): number {
      const t = this.tan();
      return t === 0 ? Infinity : 1 / t;
  }

  public sec(): number {
      const c = this.cos();
      return c === 0 ? Infinity : 1 / c;
  }

  public csc(): number {
      const s = this.sin();
      return s === 0 ? Infinity : 1 / s;
  }

  // ==================== HYPERBOLIC FUNCTIONS ====================

  public sinh(): number {
      return (Math.exp(this._value) - Math.exp(-this._value)) / 2;
  }

  public cosh(): number {
      return (Math.exp(this._value) + Math.exp(-this._value)) / 2;
  }

  public tanh(): number {
      return Math.tanh(this._value);
  }

  public coth(): number {
      const th = this.tanh();
      return th === 0 ? Infinity : 1 / th;
  }

  public sech(): number {
      const ch = this.cosh();
      return ch === 0 ? Infinity : 1 / ch;
  }

  public csch(): number {
      const sh = this.sinh();
      return sh === 0 ? Infinity : 1 / sh;
  }

  // ==================== SET FROM TRIG VALUES ====================

  public use_sin(v: number): Angle {
      this._value = Math.asin(v);
      return this;
  }

  public use_cos(v: number): Angle {
      this._value = Math.acos(v);
      return this;
  }

  public use_tan(v: number): Angle {
      this._value = Math.atan(v);
      return this;
  }

  public use_cot(v: number): Angle {
      this._value = Math.atan(v) + (v < 0 ? Angle.pi : 0);
      return this;
  }

  public use_sec(v: number): Angle {
      this._value = Math.acos(1 / v);
      return this;
  }

  public use_csc(v: number): Angle {
      this._value = Math.asin(1 / v);
      return this;
  }

  public use_sinh(v: number): Angle {
      this._value = Math.log(v + Math.sqrt(v * v + 1));
      return this;
  }

  public use_cosh(v: number): Angle {
      this._value = Math.log(v + Math.sqrt(v * v - 1));
      return this;
  }

  public use_tanh(v: number): Angle {
      this._value = 0.5 * Math.log((1 + v) / (1 - v));
      return this;
  }

  public use_coth(v: number): Angle {
      this._value = 0.5 * Math.log((v + 1) / (v - 1));
      return this;
  }

  public use_sech(v: number): Angle {
      this._value = Math.log(1 / v + Math.sqrt(1 / (v * v) - 1));
      return this;
  }

  public use_csch(v: number): Angle {
      this._value = Math.log(1 / v + Math.sqrt(1 / (v * v) + 1));
      return this;
  }

  // ==================== SUBTRACTION ====================

  public cut_angle(angle: Angle): Angle {
      return this.add_angle(angle.negate());
  }

  // ==================== UTILITY METHODS ====================

  public copy(): Angle {
      const a = new Angle();
      a._value = this._value;
      return a;
  }

  public negate(): Angle {
      const a = new Angle();
      a._value = -this._value;
      return a;
  }

  public normalize(): Angle {
      this._value %= 2 * Angle.pi;
      if (this._value < 0) {
          this._value += 2 * Angle.pi;
      }
      return this;
  }

  public toString(precision: number = 6): string {
      return `Angle(${this.deg().toFixed(precision)}° = ${this.rad().toFixed(precision)}rad)`;
  }

  // ==================== GENERIC METHODS ====================

  public use(unit: AngleUnit, value: number): Angle {
      this._value = value * Angle.CONVERSION_TO_RAD[unit];
      return this;
  }

  public add(unit: AngleUnit, value: number): Angle {
      this._value += value * Angle.CONVERSION_TO_RAD[unit];
      return this;
  }
}
