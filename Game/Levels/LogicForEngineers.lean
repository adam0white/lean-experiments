import Game.Levels.LogicForEngineers.L01_TrueIsTrue
import Game.Levels.LogicForEngineers.L02_Implication
import Game.Levels.LogicForEngineers.L03_AndIntro
import Game.Levels.LogicForEngineers.L04_AndElim
import Game.Levels.LogicForEngineers.L05_OrIntro
import Game.Levels.LogicForEngineers.L06_OrElim
import Game.Levels.LogicForEngineers.L07_NotGate
import Game.Levels.LogicForEngineers.L08_DeMorgan
import Game.Levels.LogicForEngineers.L09_Iff
import Game.Levels.LogicForEngineers.L10_Distributive

World "LogicForEngineers"
Title "Logic for Engineers"

Introduction "
# Welcome to Logic for Engineers!

If you've worked with digital circuits, you already understand Boolean logic:
- **AND gates** output HIGH when both inputs are HIGH
- **OR gates** output HIGH when at least one input is HIGH
- **NOT gates** flip the signal

In this world, you'll learn to *prove* logical statements using the same concepts.
Instead of building circuits, you'll build proofs!

**What you'll learn:**
- Level 1: The `True` proposition (like VCC - always HIGH)
- Level 2: Implications (the buffer gate)
- Level 3-4: AND (`∧`) - introduction and elimination
- Level 5-6: OR (`∨`) - introduction and elimination
- Level 7: NOT (`¬`) - negation and contradiction
- Level 8: De Morgan's Laws (NAND and NOR equivalences)
- Level 9: Biconditional (`↔`) - the XNOR gate
- Level 10: Query Optimization - database efficiency

Let's start with something simple and build up to proving real logic identities!
"
