import Game.Metadata

World "TheDataCenter"
Level 1

namespace L01

Title "Ticket-1041: Pipeline Integrity"

Introduction "
# Ticket-1041: Pipeline Integrity

**Status:** OPEN
**Priority:** P1

**Description:**
We are defining a `my_map` function to transform data streams.
Before we deploy, we need to guarantee that mapping the `id` (identity) function acts as a no-op.
If `my_map id L` changes the list `L`, we have a major bug in our pipeline.

**Acceptance Criteria:**
Prove that `my_map id L = L` for any list `L`.
"

variable {α : Type}

-- The Definition
def my_map (f : α → β) : List α → List β
| [] => []
| (h :: t) => (f h) :: (my_map f t)

-- The Proof
/-- Prove that mapping the identity function returns the original list. -/
Statement map_id (L : List α) :
  my_map id L = L := by
  Hint (hidden := true) "We need to prove this for *any* list `L`. This suggests induction.
Type `induction L`."
  induction L with
  | nil =>
    Hint (hidden := true) "Base Case: `my_map id []`.
By definition, this is `[]`.
This is true by definition (reflexivity).
Type `rfl`."
    rfl
  | cons head tail ih =>
    Hint (hidden := true) "Recursive Case: `my_map id (head :: tail)`.
Simplify using the definition of `my_map`.
Type `simp [my_map]`."
    simp [my_map]
    Hint (hidden := true) "Now we have `id head :: my_map id tail`.
We know `id head = head` (by definition of `id`) and `my_map id tail = tail` (by `ih`).
So the goal is `head :: tail = head :: tail`.
Use the induction hypothesis `ih` to rewrite the goal.
Type `rw [ih]`."
    rw [ih]

Conclusion "
**Identity Verified!**

You've confirmed that `my_map` behaves correctly for the simplest case.
Now we can move on to the more complex safety check.
"

end L01

NewTactic induction simp rfl rw
