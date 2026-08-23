# Angle

Unified **typescript** and **zig** crossunit angle library.

## Solutions

Developed to straight use of code(**copypaste files in projects**).

Files:
- **ts/angle.ts** (typescript implementation, unified with both zig implementations).
- **zig/f32/angle.zig** (zig implementation f32 or f64 focused).
- **zig/f128/angle.zig** (zig implementation f128 focused. At the moment of development zig 0.16 std.math.sinh etc methods supported only f32, f64).

Zig implementation **not prepared to be build**(no build.zig at all) as dynamic or static platform oriented libs, uses `zig build` command.

## Tests

Tests **test.zig** use epsilon(finally used adaptive_epsilon) was able to pass tests, at the development moment.
**zig/f32/test.zig** `const epsilon: USETYPE = if (USETYPE == f32) 1e-4 else 1e-13;`
**zig/f128/test.zig** `const epsilon: f128 = 1e-13;`

So, at the moment **f64 zig implementation looks like the most suitable**.

All zig implementations unified with one typescript implementation and tested from zig side against expected values.

### Run tests

- open terminal in folder **zig/f32** or **zig/f128** respectively.
- terminal: `DEVLOG=true zig run test.zig -OReleaseFast` - to see full output.
- terminal: `DEVLOG=false zig run test.zig -OReleaseFast` - to see summary + errors.

## Units supported to create angle, and get value in:

- .turn -> `one full rotation around`
- .mulp -> `multiples of Math.PI`
- .quad -> `quadrant`
- .sext -> `sextant`
- .rad -> `radian`
- .hexa -> `hexacontade`
- .bdeg -> `binary degree`
- .deg -> `degree`
- .grad -> `grad`
- .marc -> `minute of arc`
- .sarc -> `second of arc`

## Methods

### Trigonometric values of the angle:
- `.sin()` - sinus of the angle
- `.cos()` - cosinus of the angle
- `.tan()` - tangens of the angle
- `.cot()` - cotangens of the angle
- `.sec()` - secans of the angle
- `.csc()` - cosecans of the angle

### Hyperbolic values of the angle:
- `.sinh()` - hyperbolic sinus of the angle
- `.cosh()` - hyperbolic cosinus of the angle
- `.tanh()` - hyperbolic tangens of the angle
- `.coth()` - hyperbolic cotangens of the angle
- `.sech()` - hyperbolic secans of the angle
- `.csch()` - hyperbolic cosecans of the angle

### Getter methods (return value in given unit):
- `.turn()` - get value in turns
- `.mulp()` - get value in multiples of Math.PI
- `.quad()` - get value in quadrants
- `.sext()` - get value in sextants
- `.rad()` - get value in radians
- `.hexa()` - get value in hexacontades
- `.bdeg()` - get value in binary degrees
- `.deg()` - get value in degrees
- `.grad()` - get value in gradians
- `.marc()` - get value in minutes of arc
- `.sarc()` - get value in seconds of arc

### Create angle:

- **Angle.from(.unit, value)** - creates angle from angle value of unit . F.e.: `Angle.from(AngleUnit.deg, 90)`. Also custom methods provided **Angle.from_(unit)(value)**. F.e.: `Angle.from_deg(90)`.
- **Angle.from_(trig or hyperbolic value)** - creates angle from value of (sin,cos,tan,cot,sec,csc,sinh,cosh,tanh,coth,sech,csch).
- **Angle.from_angle(angle)** - creates new angle from another angle instance.

### Set angle value:

- **Angle.use(.unit, value)** - set angle value of unit. Also costom methods provided. F.e.: **Angle.use_deg(value)**.

### Change angle value:

- **Angle.add(.unit, value)** - add value of unit to angle value. Also costom methods provided. F.e.: **Angle.add_deg(value)**.
- **Angle.add_angle(angle)** - add another angle value to angle instance.
- **Angle.cut_angle(angle)** - cut another angle value from angle instance.
- **Angle.negate()** - negates the value of the angle(5 -> -5, -10 -> 10).
- **Angle.normalize()** - remove all full turns from angle value(make angle value < 360 degrees, and > -360 degrees).

### Copy angle:

- **Angle.copy()** - creates independent copy of the angle.

### Utility methods:

- **Angle.info_print(precision)** - prints the list of approximate values of the angle in terminal. Only for visual debug etc.

## Demo

The basic usage in files:
- **ts/demo.ts** - teminal(inside ts folder): `bun demo.ts`
- **zig/f32/demo.zig** - terminal(inside zig/f32 folder): `zig run demo.zig`
- **zig/f128/demo.zig** - terminal(inside zig/f128 folder): `zig run demo.zig`

## Details

The implementation in ts folder stores angle **value in radians**.  
The implementation in zig/f32 folder stores angle **value in radians**.  
The implementation in zig/f128 folder stores angle **value in seconds of arc**.  

## Artefacts

Code in **haxe** folder is **deprecated haxe implementation, not developed anymore**. Used as origin for typescript and zig implementatioins.
