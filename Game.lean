import Game.Levels.LogicForEngineers
import Game.Levels.TheDataCenter

-- Here's what we'll put on the title screen
Title "Logic for Engineers Game"
Introduction
"
# Welcome to Logic for Engineers!

Learn formal logic through the lens of digital circuits.
If you understand AND, OR, and NOT gates, you already know Boolean logic!

**Worlds available:**
- **Logic for Engineers**: Master propositional logic using circuit intuition
- **The Data Center**: Verify data structures and prevent memory leaks

Select a world to begin your journey into formal proofs!
"

Info "
Here you can put additional information about the game. It is accessible
from the starting through the drop-down menu.

For example: Game version, Credits, Link to Github and Zulip, etc.

Use **markdown**.
"

/-! Information to be displayed on the servers landing page. -/
Languages "en"
CaptionShort "Logic for Engineers"
CaptionLong "Learn propositional logic through digital circuit intuition. Master AND, OR, NOT gates as logical proofs!"
-- Prerequisites "" -- add this if your game depends on other games
-- CoverImage "images/cover.png"

/-! Build the game. Show's warnings if it found a problem with your game. -/
MakeGame
