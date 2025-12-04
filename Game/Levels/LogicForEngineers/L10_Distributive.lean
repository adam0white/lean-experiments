import Game.Levels.LogicForEngineers.L09_Iff

World "LogicForEngineers"
Level 10

Title "Query Optimization"

Introduction "
# Query Optimization: The Distributive Law

The intern wrote a query that is causing a massive slowdown in our analytics dashboard.
They are filtering a join like this: `P ∧ (Q ∨ R)`.

This forces the database to join `Q` and `R` first, creating a huge intermediate table, and *then* filter by `P`.

If we distribute the filter, we can filter `Q` and `R` *before* joining:
`(P ∧ Q) ∨ (P ∧ R)`

This is a classic query optimization technique!

Your task: Prove to the intern that this optimization is safe (logically equivalent).
"

/-- One direction of the distributive law. -/
Statement (P Q R : Prop) : P ∧ (Q ∨ R) → (P ∧ Q) ∨ (P ∧ R) := by
  Hint "Start with `intro h` to assume the unoptimized query structure."
  intro h
  Hint "You have `h : P ∧ (Q ∨ R)`. Extract the common filter `P` with `h.left` and the join `Q ∨ R` with `h.right`.
Use `cases h.right` to handle the two branches of the join."
  cases h.right with
  | inl hq =>
    Hint "In this case, we are in the left branch (Q). Build the optimized left side `P ∧ Q`.
Use `left` then `constructor`."
    left
    constructor
    exact h.left
    exact hq
  | inr hr =>
    Hint "In this case, we are in the right branch (R). Build the optimized right side `P ∧ R`.
Use `right` then `constructor`."
    right
    constructor
    exact h.left
    exact hr

Conclusion "
Great job! You've verified the query optimizer rule!

**Performance Impact:**
- Original: `P ∧ (Q ∨ R)` - Filter *after* Join (Slow)
- Optimized: `(P ∧ Q) ∨ (P ∧ R)` - Filter *before* Join (Fast)

You just saved the dashboard from timing out. The intern is impressed.
"
