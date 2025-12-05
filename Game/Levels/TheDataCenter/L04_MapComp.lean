import Game.Metadata

World "TheDataCenter"
Level 4

namespace L04

Title "Ticket-1044: Optimization Pass Safety"

Introduction "
# Ticket-1044: Optimization Pass Safety

**Status:** IN REVIEW
**Priority:** P2 (Performance)

**Description:**
The compiler team wants to enable 'Map Fusion' optimization.
They claim that `map g (map f L)` is equivalent to `map (g ∘ f) L`.
We need to mathematically prove this optimization is safe before enabling it in production.

**The Code:**
```lean
def my_map (f : α → β) (L : List α) : List β :=
  match L with
  | [] => []
  | (head :: tail) => f head :: my_map f tail
```

**Acceptance Criteria:**
Prove that `my_map g (my_map f L) = my_map (g ∘ f) L`.
"

variable {α β γ : Type}

-- The Defs
def my_map (f : α → β) (L : List α) : List β :=
  match L with
  | [] => []
  | (head :: tail) => f head :: my_map f tail

-- The Proof
/-- Prove that mapping `f` then `g` is the same as mapping `g ∘ f`. -/
Statement map_comp (f : α → β) (g : β → γ) (L : List α) :
  my_map g (my_map f L) = my_map (g ∘ f) L := by
  Hint (hidden := true) "We need to prove this for any list `L`.
Induction is your friend.
Type `induction L`."
  induction L with
  | nil =>
    Hint (hidden := true) "Base Case: Empty list.
`my_map` of empty is empty.
Type `rfl`."
    rfl
  | cons head tail tail_ih =>
    Hint (hidden := true) "Recursive Case: `head :: tail`.
Simplify using definitions and the induction hypothesis.
Type `simp [my_map, tail_ih]`."
    simp [my_map, tail_ih]

Conclusion "
**Optimization Verified!**

The compiler can now safely fuse these loops.
You've saved the company millions of CPU cycles!
"

end L04

NewTactic induction simp rfl rw
