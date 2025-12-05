import Game.Metadata

World "TheDataCenter"
Level 3

namespace L03

Title "Data Integration"

Introduction "
# Data Integration: Append Length

We are merging two datasets. The intern wrote a function to append one list to another.
We need to verify that the length of the combined list is the sum of the original lengths.

If this invariant is violated, we might have data loss or corruption during the merge.

**The Code:**
```lean
def my_append (L1 L2 : List α) : List α :=
  match L1 with
  | [] => L2
  | (h :: t) => h :: (my_append t L2)
```

**Your Task:**
Prove that `length (my_append L1 L2) = length L1 + length L2`.
"

variable {α : Type}

-- The Definition
def my_append (L1 L2 : List α) : List α :=
  match L1 with
  | [] => L2
  | (h :: t) => h :: (my_append t L2)

-- The Proof
/-- Prove that appending two lists sums their lengths. -/
Statement append_length (L1 L2 : List α) :
  (my_append L1 L2).length = L1.length + L2.length := by
  Hint "We want to prove this for any list `L1`.
Type `induction L1`."
  induction L1 with
  | nil =>
    Hint "Base Case: `L1` is empty.
`my_append [] L2` is just `L2`.
And `[].length` is 0.
So we need to prove `L2.length = 0 + L2.length`.
This is true by definition and basic arithmetic.
Type `simp [my_append]`."
    simp [my_append]
  | cons head tail tail_ih =>
    Hint "Recursive Case: `L1` is `head :: tail`.
Simplify using the definition of `my_append`.
Type `simp [my_append]`."
    simp [my_append]
    Hint "Now we have `(my_append tail L2).length + 1 = tail.length + 1 + L2.length`.
The Induction Hypothesis `tail_ih` says `(my_append tail L2).length = tail.length + L2.length`.
Use `rw [tail_ih]` to use this fact."
    rw [tail_ih]
    Hint "Now both sides are equal (by associativity and commutativity of addition).
Type `simp [Nat.add_assoc, Nat.add_comm]`."
    simp [Nat.add_assoc, Nat.add_comm]

Conclusion "
**Integration Successful!**

You've verified that our data merge operation is safe.
The total record count is preserved.

You are becoming a master of structural induction!
"

end L03

NewTactic induction simp rfl rw
NewTheorem Nat.add_assoc Nat.add_comm
