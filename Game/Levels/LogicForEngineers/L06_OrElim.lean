import Game.Levels.LogicForEngineers.L05_OrIntro

World "LogicForEngineers"
Level 6

Title "Case Analysis on OR"

Introduction "
# Handling OR in Hypotheses

When you *have* `P ∨ Q` as a hypothesis, you don't know which one is true.
You must handle both cases!

Use `cases h with | inl hp => ... | inr hq => ...` to split into:
- Case 1: assume P is true (called `hp`)
- Case 2: assume Q is true (called `hq`)

This is like testing a circuit: if the OR gate outputs HIGH,
you check what happens if input A is HIGH, then what happens if input B is HIGH.

Let's prove OR is commutative: `P ∨ Q → Q ∨ P`
"

/-- OR is commutative: P ∨ Q implies Q ∨ P. -/
Statement (P Q : Prop) : P ∨ Q → Q ∨ P := by
  Hint "First, assume `P ∨ Q` is true using `intro h`."
  intro h
  Hint "Now use `cases h with | inl hp => ... | inr hq => ...` to handle both possibilities.

Or simply use `cases h` and handle each case."
  cases h with
  | inl hp =>
    Hint "In this case, P is true (you have `hp : P`). You need `Q ∨ P`.
Since you have P, use `right` then `exact hp`."
    right
    exact hp
  | inr hq =>
    Hint "In this case, Q is true (you have `hq : Q`). You need `Q ∨ P`.
Since you have Q, use `left` then `exact hq`."
    left
    exact hq

Conclusion "
Brilliant! You've mastered OR elimination.

The `cases` tactic is essential for handling hypotheses with multiple possibilities.
When you have `h : P ∨ Q`, you must prove your goal in *both* cases:
- What if P is true?
- What if Q is true?

**Pattern:**
```
cases h with
| inl hp => -- handle case where P is true
| inr hq => -- handle case where Q is true
```
"

NewTactic cases
