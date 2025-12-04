import Game.Levels.LogicForEngineers.L09_Iff

World "LogicForEngineers"
Level 10

Title "The Distributive Law"

Introduction "
# Distributive Law: Circuit Optimization

Just like in algebra where `a × (b + c) = (a × b) + (a × c)`,
logic has distributive laws for optimizing circuits:

`P ∧ (Q ∨ R) ↔ (P ∧ Q) ∨ (P ∧ R)`

This is exactly how you'd factor or expand circuit logic!

Let's prove one direction: if we have `P ∧ (Q ∨ R)`, we can derive `(P ∧ Q) ∨ (P ∧ R)`.

You'll need to:
1. Extract P and (Q ∨ R) from the hypothesis
2. Case split on (Q ∨ R)
3. In each case, build the appropriate side of the OR
"

/-- One direction of the distributive law. -/
Statement (P Q R : Prop) : P ∧ (Q ∨ R) → (P ∧ Q) ∨ (P ∧ R) := by
  Hint "Start with `intro h` to assume the hypothesis."
  intro h
  Hint "You have `h : P ∧ (Q ∨ R)`. Extract P with `h.left` and (Q ∨ R) with `h.right`.
Use `cases h.right` to handle Q ∨ R."
  cases h.right with
  | inl hq =>
    Hint "In this case, Q is true. Build `P ∧ Q` and go left.
Use `left` then `constructor`."
    left
    constructor
    exact h.left
    exact hq
  | inr hr =>
    Hint "In this case, R is true. Build `P ∧ R` and go right.
Use `right` then `constructor`."
    right
    constructor
    exact h.left
    exact hr

Conclusion "
Excellent work! You've proven the distributive law!

**Circuit Insight:**
This proof is exactly what a circuit optimizer does:
- Input: `P ∧ (Q ∨ R)` - an AND gate with an OR gate feeding into it
- Output: `(P ∧ Q) ∨ (P ∧ R)` - two AND gates feeding into an OR gate

Both circuits are logically equivalent, but depending on your constraints
(speed, area, power), one might be better than the other!

**Congratulations!** You've completed the Logic for Engineers world!

You now understand:
- Basic propositions (True)
- Implications (→)
- Conjunction/AND (∧)
- Disjunction/OR (∨)
- Negation/NOT (¬)
- Biconditional/XNOR (↔)
- De Morgan's Laws
- Distributive Laws

These are the foundations of digital logic, verified with mathematical precision!
"
