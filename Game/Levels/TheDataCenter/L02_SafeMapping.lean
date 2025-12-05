import Game.Metadata

World "TheDataCenter"
Level 2

namespace L02

Title "Safe Mapping"

Introduction "
# Ticket-1042: Buffer Overflow Check

**Status:** OPEN
**Priority:** P0 (Security)

**Description:**
The security team is worried about buffer overflows.
We need to verify that `my_map` allocates exactly the same amount of memory as the input list.
If the length changes, we might write out of bounds.

**Acceptance Criteria:**
Prove that `(my_map f L).length = L.length`.
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
