import Game.Metadata

World "LogicForEngineers"
Level 1

Title "True is True"

Introduction "
# Welcome to Logic for Engineers!

In digital circuits, we work with signals that are either HIGH (1) or LOW (0).
In logic, we work with propositions that are either **True** or **False**.

In Lean, `True` is the simplest proposition - it's always provable.
Think of it as a wire that's always connected to power.

Your goal appears below the line `⊢`. Right now, you need to prove `True`.

Use the `trivial` tactic to prove something that is... trivially true!
"

/-- Prove that True is true. -/
Statement : True := by
  Hint "Type `trivial` to prove that `True` holds."
  trivial

Conclusion "
Excellent! You've completed your first proof.

The `trivial` tactic works when the goal is obviously true.
In circuit terms, you just verified that a wire connected to VCC is indeed HIGH.

Let's move on to something more interesting!
"

NewTactic trivial
