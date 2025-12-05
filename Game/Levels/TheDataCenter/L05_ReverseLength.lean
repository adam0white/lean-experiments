import Game.Metadata
import Game.Levels.TheDataCenter.L03_AppendLength

World "TheDataCenter"
Level 5

namespace L05

open L03 (my_append append_length)

Title "Ticket-1045: Backup Integrity Check"

Introduction "
# Ticket-1045: Backup Integrity Check

**Status:** BLOCKED
**Priority:** P0 (Critical)

**Description:**
Our backups are stored as reverse-ordered stacks on tape drives.
During restoration, we read the tape in reverse to reconstruct the database.
You must verify that the `my_reverse` operation preserves the total number of records.
Any discrepancy here means data loss.

**The Code:**
```lean
def my_reverse (L : List α) : List α :=
  match L with
  | [] => []
  | (h :: t) => my_append (my_reverse t) [h]
```

**Acceptance Criteria:**
Prove that `(my_reverse L).length = L.length`.

**Tip:**
Consult the knowledge base: Ticket-1043 (`append_length`).
"

variable {α : Type}

-- The Definition
def my_reverse (L : List α) : List α :=
  match L with
  | [] => []
  | (h :: t) => my_append (my_reverse t) [h]

-- The Proof
/-- Prove that reversing a list does not change its length. -/
Statement reverse_length (L : List α) :
  (my_reverse L).length = L.length := by
  Hint (hidden := true) "Induction is the standard tool for lists.
Type `induction L`."
  induction L with
  | nil =>
    Hint (hidden := true) "Base Case: Reversing an empty list gives empty.
Type `rfl`."
    rfl
  | cons head tail tail_ih =>
    Hint (hidden := true) "Recursive Case: `head :: tail`.
Simplify using the definition of `my_reverse`.
Type `simp [my_reverse]`."
    simp [my_reverse]
    Hint (hidden := true) "We have `length (my_append ... ...)`.
We proved in Level 3 that `length` distributes over `my_append`.
We can use that theorem!
Type `rw [append_length]`."
    rw [append_length]
    Hint (hidden := true) "Now we have `length (my_reverse tail) + length [head]`.
Use the induction hypothesis `tail_ih` to replace `length (my_reverse tail)` with `length tail`.
Type `rw [tail_ih]`."
    rw [tail_ih]
    Hint (hidden := true) "Now simplify the arithmetic. `length [head]` is 1.
Type `simp`."
    simp

Conclusion "
**Restoration Verified!**

The reverse operation is length-preserving.
No data records were lost during the restoration process.
The 'The Data Center' is now fully verified and operational!
"

end L05

NewTactic induction simp rfl rw
NewTheorem L03.append_length
