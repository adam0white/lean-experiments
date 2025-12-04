import Game.Levels.LogicForEngineers.L04_AndElim

World "LogicForEngineers"
Level 5

Title "The OR Gate"

Introduction "
# OR: At Least One Must Be True

An **OR gate** outputs HIGH when *at least one* input is HIGH.

In logic, `P ∨ Q` (read 'P or Q') is true when at least one of P or Q is true.

To prove `P ∨ Q`, you only need to prove ONE side:
- Use `left` if you can prove `P`
- Use `right` if you can prove `Q`

You're essentially choosing which input to connect to HIGH.
"

/-- If P is true, then P ∨ Q is true. -/
Statement (P Q : Prop) (hp : P) : P ∨ Q := by
  Hint "You need to prove `P ∨ Q`. You have `hp : P`.
Use `left` to say 'I'll prove the left side (P)'."
  left
  Hint "Now just prove P using your hypothesis."
  exact hp

Conclusion "
You've learned OR introduction from the left!

The `left` tactic says 'I choose to prove the left side of the OR'.

**Note:** Once you commit to `left` or `right`, you only need to prove that one side.
This is different from AND where you must prove both!
"

NewTactic left right
