wip

zig run test.zig -OReleaseFast
to print passed, and errors

DEVLOG=true zig run test.zig -OReleaseFast
to print also passed tests summary

const epsilon: USETYPE = if (USETYPE == f32) 1e-4 else 1e-13;
values able to pass the all tests respectively.
