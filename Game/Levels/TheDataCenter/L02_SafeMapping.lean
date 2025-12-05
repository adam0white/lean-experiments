import Game.Metadata

World "TheDataCenter"
Level 2

namespace L02

Title "Safe Mapping"

Introduction "
# The Memory Leak: Safe Mapping

Great job verifying the identity property!
Now for the real challenge.

The junior engineer implemented a custom `map` function for our high-performance list processing library.
However, there's a concern that it might be corrupting memory by changing the size of the list during transformation.

If the output list length doesn't match the input list length, we get a buffer overflow in the C++ backend.

**The Code:**
```lean
def my_map (f : α → β) : List α → List β
| [] => []
| (h :: t) => (f h) :: (my_map f t)
```

**Your Task:**
Perform a formal code review. Prove that `my_map` preserves the length of the list.
"

variable {α β : Type}

-- The Definition (The "Intern's Code")
def my_map (f : α → β) : List α → List β
| [] => []
| (h :: t) => (f h) :: (my_map f t)

-- The Proof (The "Senior's Review")
-- Goal: Prove length (my_map f L) = length L
/-- Prove that mapping a function over a list does not change its length. -/
Statement map_preserves_length (f : α → β) (L : List α) :
  (my_map f L).length = L.length := by
  Hint (hidden := true) "Just like in the previous level, we need to prove this for *any* list `L`.
This is a job for induction!
Type `induction L`."
  induction L with
  | nil =>    -- Base case: Empty list
    Hint (hidden := true) "Base Case: The list is empty. `my_map` returns empty, and length is 0.
This should be true by definition. Type `rfl`."
    rfl       -- "Reflexivity" (0 = 0)
  | cons head tail ih =>  -- Recursive case
    Hint (hidden := true) "Recursive Case: We have a head and a tail.
The Induction Hypothesis `ih` says: `(my_map f tail).length = tail.length`.
We want to prove: `(my_map f (head :: tail)).length = (head :: tail).length`.

First, simplify the goal using the definition of `my_map`. Type `simp [my_map]`."
    simp [my_map]         -- Simplify using the definition
    Hint (hidden := true) "Now the goal looks like `(my_map f tail).length + 1 = tail.length + 1`.
We know `(my_map f tail).length = tail.length` from `ih`.
Use `rw [ih]` to replace the left side with the right side."
    rw [ih]              -- Use the "Induction Hypothesis"

Conclusion "
**Code Review Passed!**

You have formally verified that `my_map` is memory-safe with respect to list length.
The C++ backend team breathes a sigh of relief.

You've just used **Mathematical Induction** to verify software correctness.
This is the power of formal methods in engineering!
"

end L02

NewTactic induction simp rfl rw
