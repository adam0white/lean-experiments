import Game.Metadata

World "TheDataCenter"
Level 1

namespace L01

Title "The Identity Crisis"

Introduction "
# The Identity Crisis

Before we tackle the memory leak, we need to verify the basics of our `my_map` function.
The simplest property is that mapping the identity function `id` over a list should return the same list.

If this fails, our map function is fundamentally broken.

**The Code:**
```lean
def my_map (f : α → β) : List α → List β
| [] => []
| (h :: t) => (f h) :: (my_map f t)
```

**Your Task:**
Prove that `my_map id L = L`.
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
  Hint "We need to prove this for *any* list `L`. This suggests induction.
Type `induction L`."
  induction L with
  | nil =>
    Hint "Base Case: `my_map id []`.
By definition, this is `[]`.
This is true by definition (reflexivity).
Type `rfl`."
    rfl
  | cons head tail ih =>
    Hint "Recursive Case: `my_map id (head :: tail)`.
Simplify using the definition of `my_map`.
Type `simp [my_map]`."
    simp [my_map]
    Hint "Now we have `id head :: my_map id tail`.
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
