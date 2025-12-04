import Game.Levels.LogicForEngineers.L02_Implication

World "LogicForEngineers"
Level 3

Title "The AND Gate"

Introduction "
# AND: Both Must Be True

An **AND gate** outputs HIGH only when *both* inputs are HIGH.

In logic, `P ∧ Q` (read 'P and Q') is true only when both P and Q are true.

To prove `P ∧ Q`, you need to prove both parts:
- Use `constructor` to split the goal into two subgoals
- Prove each part separately

Think of it as connecting two wires to an AND gate - you need to verify both inputs.
"

/-- If P and Q are both true, then P ∧ Q is true. -/
Statement (P Q : Prop) (hp : P) (hq : Q) : P ∧ Q := by
  Hint "Use `constructor` to split the goal `P ∧ Q` into two separate goals: `P` and `Q`."
  constructor
  Hint "Now prove the first part. You have `hp : P` in your hypotheses."
  exact hp
  Hint "Now prove the second part. You have `hq : Q` in your hypotheses."
  exact hq

Conclusion "
You've built an AND gate!

When you see `P ∧ Q` as a goal, use `constructor` to split it into two goals.
Then prove each part using what you have.

**Notation guide:**
- `∧` is typed as `\\and` or `\\wedge`
- It represents logical AND (conjunction)
"

NewTactic constructor
