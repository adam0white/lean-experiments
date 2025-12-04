import Game.Levels.LogicForEngineers.L06_OrElim

World "LogicForEngineers"
Level 7

Title "The NOT Gate"

Introduction "
# NOT: Negation

A **NOT gate** (inverter) flips the signal: HIGH becomes LOW, LOW becomes HIGH.

In logic, `¬P` (read 'not P') means P is false.

**Key insight:** In Lean, `¬P` is *defined* as `P → False`.
This means: 'if P were true, we'd have a contradiction'.

To prove `¬P`:
1. Use `intro h` to assume P is true
2. Derive `False` from that assumption

If you have both `h : P` and `hn : ¬P`, you have a contradiction!
- `hn h` gives you `False` (applying ¬P to P)
- `False.elim` converts `False` into any proposition
"

/-- From P and ¬P, we can prove anything. -/
Statement (P Q : Prop) (hp : P) (hnp : ¬P) : Q := by
  Hint "You have both `hp : P` and `hnp : ¬P`.
Since `¬P` means `P → False`, applying `hnp` to `hp` gives `False`.
Use `exact False.elim (hnp hp)` to derive any proposition from False!"
  Branch
    apply False.elim
    exact hnp hp
  exact False.elim (hnp hp)

Conclusion "
This is the principle of **explosion** (ex falso quodlibet):
from a contradiction, you can prove anything!

**Understanding ¬P:**
- `¬P` is just shorthand for `P → False`
- If you have `hnp : ¬P` and `hp : P`, then `hnp hp : False`
- From `False`, any proposition follows

**Notation:** `¬` is typed as `\\not` or `\\neg`

In circuits, if you somehow have a signal that's both HIGH and LOW,
something is very wrong - and anything could happen!
"

NewDefinition Not
NewTheorem False.elim
