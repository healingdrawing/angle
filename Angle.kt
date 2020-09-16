

enum class AngleUnit(unit:Int){
    None(0),
    Turn(1),
    Mulp(2),
    Quad(3),
    Sext(4),
    Rad(5),
    Hexa(6),
    Bdeg(7),
    Deg(8),
    Grad(9),
    Marc(10),
    Sarc(11)
}

/**
 * Angle object with few unit of measurement functionality. Created new instance angle value is 0.
 * Internal storage unit is `turn`. Alternative names is `cyc`(circle), `rev`(revolution), `rot`(complete rotation).
 *
 * set value methods available for units:
 * * useTurn(...) -> turn
 * * useMulp(...) -> `multiples of Math.PI`
 * * useQuad(...) -> `quadrant`
 * * useSext(...) -> `sextant`
 * * useRad(...) -> `radian`
 * * useHexa(...) -> `hexacontade`
 * * useBdeg(...) -> `binary degree`
 * * useDeg(...) -> `degree`
 * * useGrad(...) -> `grad`
 * * useMarc(...) -> `minute of arc`
 * * useSarc(...) -> `second of arc`
 *
 * get value methods available for units:
 * * turn() -> turn
 * * mulp() -> `multiples of Math.PI`
 * * quad() -> `quadrant`
 * * sext() -> `sextant`
 * * rad() -> `radian`
 * * hexa() -> `hexacontade`
 * * bdeg() -> `binary degree`
 * * deg() -> `degree`
 * * grad() -> `grad`
 * * marc() -> `minute of arc`
 * * sarc() -> `second of arc`
 */
class Angle(value:Float, unit: AngleUnit) {
    init {
        this.value = when(unit){
            AngleUnit.Turn ->
        }
    }
    /**
     * internal storage for base angle value, which unit is `turn`. 1 `turn` is 360 `deg` is one full rotation.
     * Alternative `turn` names is `cyc`(circle), `rev`(revolution), `rot`(complete rotation)
     */
    var value:Float;



}