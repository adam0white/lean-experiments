import Game.Levels.LogicForEngineers.L08_DeMorgan

World "LogicForEngineers"
Level 9

Title "The XNOR Gate"

Introduction "
# Biconditional: If and Only If

The **XNOR gate** (exclusive NOR) outputs HIGH when both inputs are the same.
In logic, this is the **biconditional** `P ↔ Q` (read 'P if and only if Q').

`P ↔ Q` means:
- If P is true, then Q is true (P → Q)
- If Q is true, then P is true (Q → P)

It's essentially two implications in both directions!

To prove `P ↔ Q`:
- Use `constructor` to split into two goals: `P → Q` and `Q → P`
- Prove each direction separately

To use `h : P ↔ Q`:
- `h.mp` (modus ponens): gives you `P → Q`
- `h.mpr` (modus ponens reverse): gives you `Q → P`
"

/-- If and only if is symmetric. -/
Statement (P Q : Prop) : (P ↔ Q) → (Q ↔ P) := by
  Hint "First, assume `P ↔ Q` is true with `intro h`."
  intro h
  Hint "Now use `constructor` to prove both directions of `Q ↔ P`."
  constructor
  Hint "You need `Q → P`. You have `h : P ↔ Q`.
Use `h.mpr` to get the `Q → P` direction, then `exact h.mpr`."
  exact h.mpr
  Hint "You need `P → Q`. Use `exact h.mp`."
  exact h.mp

Conclusion "
Wonderful! You've shown that biconditional is symmetric.

**The `↔` symbol:**
- Typed as `\\iff` or `\\leftrightarrow`
- `constructor` splits it into two implication goals
- `.mp` extracts the forward direction (P → Q)
- `.mpr` extracts the reverse direction (Q → P)

In circuits, XNOR is the 'equality detector' - it's HIGH when both inputs match!
"

NewTheorem Iff.mp Iff.mpr
