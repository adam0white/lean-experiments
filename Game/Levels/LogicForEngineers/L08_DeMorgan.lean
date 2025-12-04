import Game.Levels.LogicForEngineers.L07_NotGate

World "LogicForEngineers"
Level 8

Title "De Morgan's Laws"

Introduction "
# De Morgan's Laws: The Engineer's Best Friend

**De Morgan's Laws** are fundamental in digital logic:
- `¬(P ∧ Q) ↔ ¬P ∨ ¬Q` (NAND equals OR of NOTs)
- `¬(P ∨ Q) ↔ ¬P ∧ ¬Q` (NOR equals AND of NOTs)

Let's prove the easier direction of the first law:
If we know `¬P ∨ ¬Q`, then `¬(P ∧ Q)`.

Think about it: if at least one input to an AND gate is LOW,
the output must be LOW!

**New tactic:** `apply` lets you work backwards from the goal.
If you need to prove `B` and have `h : A → B`, use `apply h` to change
the goal to proving `A`.
"

/-- One direction of De Morgan's first law. -/
Statement (P Q : Prop) : (¬P ∨ ¬Q) → ¬(P ∧ Q) := by
  Hint "First introduce the hypothesis with `intro h`."
  intro h
  Hint "Now you need to prove `¬(P ∧ Q)`. Remember, this means `P ∧ Q → False`.
Use `intro hpq` to assume `P ∧ Q` is true."
  intro hpq
  Hint "You have `h : ¬P ∨ ¬Q` and `hpq : P ∧ Q`. Use `cases h` to handle both possibilities."
  cases h with
  | inl hnp =>
    Hint "You have `hnp : ¬P` and `hpq : P ∧ Q`.
Extract P from hpq with `hpq.left`, then apply ¬P to it."
    exact hnp hpq.left
  | inr hnq =>
    Hint "You have `hnq : ¬Q` and `hpq : P ∧ Q`.
Extract Q from hpq with `hpq.right`, then apply ¬Q to it."
    exact hnq hpq.right

Conclusion "
Congratulations! You've proven part of De Morgan's Law!

This is exactly how digital circuit designers think:
- A NAND gate (¬(P ∧ Q)) outputs LOW only when both inputs are HIGH
- An OR of NOTs (¬P ∨ ¬Q) outputs HIGH when at least one input is LOW
- These are logically equivalent!

**What you've learned:**
- `trivial` - prove something obviously true
- `intro` - assume the hypothesis of an implication
- `exact` - finish with an exact match
- `constructor` - split an AND goal into two goals
- `.left`, `.right` - extract from an AND hypothesis
- `left`, `right` - choose which side of OR to prove
- `cases` - handle OR hypotheses by considering both cases
- Understanding `¬P` as `P → False`
"

NewTactic apply
