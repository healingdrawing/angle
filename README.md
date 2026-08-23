wip.

## Solutions
Unified **typescript** and **zig** crossunit angle library.

Files:
- ts/angle.ts
- zig/angle.zig

Developed to straight use of code(**copypaste files in projects**).
Tests use **f32 with precision of the epsilon 1e-6**. For f64 case the refactored syntax expected.(deprecated/refactor to f128,f32(+64))

Zig version **not prepared to be build**(no build.zig at all) as dynamic or static platform oriented libs, uses `zig build` command.

## Artefacts
Code in **haxe** folder is **deprecated haxe implementation, not developed anymore**. Used as origin for typescript and zig implementatioins.

## Units

- turn() -> turn
- mulp() -> `multiples of Math.PI`
- quad() -> `quadrant`
- sext() -> `sextant`
- rad() -> `radian`
- hexa() -> `hexacontade`
- bdeg() -> `binary degree`
- deg() -> `degree`
- grad() -> `grad`
- marc() -> `minute of arc`
- sarc() -> `second of arc`