import Game.Levels.LogicForEngineers.L01_TrueIsTrue

World "LogicForEngineers"
Level 2

Title "The Implication Gate"

Introduction "
# Implication: If...Then

In circuits, a buffer gate passes the input signal through unchanged.
In logic, an **implication** `P → Q` means 'if P is true, then Q is true'.

The simplest implication is `P → P` - if the input is true, the output is true.
This is like a buffer: what goes in, comes out.

To prove an implication `P → Q`:
1. Use `intro h` to assume `P` is true (calling this assumption `h`)
2. Then prove `Q` using that assumption

When you have exactly what you need to prove, use `exact h` to finish.
"

/-- If P is true, then P is true. -/
Statement (P : Prop) : P → P := by
  Hint "Use `intro h` to assume P is true. This moves P from the goal to your hypotheses."
  intro h
  Hint "Now you have `h : P` in your hypotheses, and you need to prove `P`.
Use `exact h` to say 'this is exactly what we need'."
  exact h

Conclusion "
Perfect! You just proved the logical equivalent of a buffer gate.

**Key tactics learned:**
- `intro h` - Assume the left side of `→` is true, calling it `h`
- `exact h` - Use hypothesis `h` when it matches the goal exactly

The pattern `intro` then `exact` is fundamental - you'll use it constantly!
"

NewTactic intro exact
