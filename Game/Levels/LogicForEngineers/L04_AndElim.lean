import Game.Levels.LogicForEngineers.L03_AndIntro

World "LogicForEngineers"
Level 4

Title "Reading AND Outputs"

Introduction "
# Extracting from AND

If you know `P ∧ Q` is true, you can extract either piece:
- `h.left` or `h.1` gives you `P`
- `h.right` or `h.2` gives you `Q`

Think of it as probing the inputs of an AND gate that's outputting HIGH -
you know both inputs must be HIGH.

This level proves AND is commutative: `P ∧ Q → Q ∧ P`
(swapping the inputs doesn't change the logic).
"

/-- AND is commutative: P ∧ Q implies Q ∧ P. -/
Statement (P Q : Prop) : P ∧ Q → Q ∧ P := by
  Hint "First, use `intro h` to assume `P ∧ Q` is true."
  intro h
  Hint "Now use `constructor` to prove `Q ∧ P` by proving both parts."
  constructor
  Hint "You need to prove `Q`. You have `h : P ∧ Q`.
Use `exact h.right` to extract Q from the AND."
  Branch
    exact h.2
  exact h.right
  Hint "You need to prove `P`. Use `exact h.left` to extract P from the AND."
  Branch
    exact h.1
  exact h.left

Conclusion "
Excellent! You've proven that AND is commutative.

**Extracting from AND:**
- `h.left` or `h.1` - get the first component
- `h.right` or `h.2` - get the second component

In circuit terms, if an AND gate outputs 1, both inputs must be 1.
You can 'read' either input!
"

NewTheorem And.left And.right
