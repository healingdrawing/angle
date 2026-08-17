import {Angle, AngleUnit} from "./angle"

// === Static factory patterns ===
const a1 = Angle.from(AngleUnit.deg, 90);       // Generic
const a2 = Angle.from_deg(90);                   // Wrapper - identical!

// === Instance setter patterns ===
const angle = new Angle();
angle.use(AngleUnit.deg, 45);        // Generic
angle.use_deg(45);                     // Wrapper - identical!

// === Addition patterns ===
const a = Angle.from_rad(1);
console.log("1 ",a.normalize().rad())
a.add(AngleUnit.rad, 0.5);             // Generic
console.log("1.5 ",a.normalize().rad())
a.add_rad(1);                          // Wrapper - identical!
console.log("2.5 ",a.normalize().rad())

// === Fluent chaining (all wrappers) ===
const result = new Angle()
    .use_deg(90)        // Static returns new instance
    .add_deg(45)
    .add_rad(Math.PI / 4)
    .normalize();
console.log("180 ",result.deg())

// === Mixed styles work too ===
const mixed = Angle.from(AngleUnit.turn, 0.5)
    .use_deg(45)
    .add(AngleUnit.grad, 100);
console.log("135 ",mixed.deg())

// grad check
const grad = Angle.from_grad(200).use_deg(45)
console.log("grad test 50 ",grad.grad())
console.log("45 ",grad.deg())
console.log("180 ", mixed.cut_angle(grad).add_angle(mixed).deg())
