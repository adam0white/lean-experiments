import Game.Levels.TheDataCenter.L01_MapId
import Game.Levels.TheDataCenter.L02_SafeMapping
import Game.Levels.TheDataCenter.L03_AppendLength
import Game.Levels.TheDataCenter.L04_MapComp
import Game.Levels.TheDataCenter.L05_ReverseLength

World "TheDataCenter"
Title "The Data Center"

Introduction "
# ⚠️ SEV-1: Data Consistency Check

**Status:** INVESTIGATING
**Assignee:** Senior Engineer (You)
**Context:** The Core Infrastructure Team is migrating our user database to a functional architecture.

**The Incident:**
Management is afraid the new recursive algorithms might cause data loss or buffer overflows during the migration. Unit tests are passing, but that's not good enough for the banking module.

**Your Orders:**
1. Enter the Data Center.
2. Formally verify the list operations.
3. **Prove** that the data remains intact.

> \"We don't need tests. We need proofs.\" - The CTO
"
