# Adding a game!

So you want to add a game to the PowerSpel platform? Very nice! I like you already. Here's some info on what you need and what you can do. While you could fork the repository and keep the game to yourself, please share your games with me. Send me a PR and I will give it a place in this repository. How cool would it be, if this thing grows and multiple creators work together to add different games to this?

To start, find the folder ./Games/_TemplateGame. Create a copy of that and rename it to represent your game. There's a basic start to a game in that folder. From there, it's up to you to create whatever you want.

## Prerequisites

### Mandatory

There is a minimal set of files and folders that you need to add to make your game work. This section explains them all.

- A folder in the folder `./Games`. This will be the name of your game. For example: `./Games/Zork`. This will be called the game folder.
- A folder in your game folder, called `Helpers`. All your helper functions go here. These are at least:
  - `Initialize-Game.ps1`. Sets some global variables, such as the starting room and the map preference.
  - `Invoke-AchievementCheck.ps1`. Checks for conditions, to grant achievements.
  - `Show-Ending`. Shows the end screen of the game.
  - `Show-Header`. Shows the header of the game on top of the screen.
  - `Show-StartScreen`. Shows the splash screen of your game. I encourage you to get creative with ASCII art!
- A folder in your game folder, called `Rooms`. You can make subfolders here, if you want to order them (e.g. by floor).
  - One `RoomNNNNNN.json` for every room in your game.
- A folder in your game folder, called `Data`. There's no game without achievements! In this folder, place the following file:
  - `GameAchievements.json`. Contains names and decriptions of all achievements.

Also, add your game's name in the `ValidateSet` section of the `Game` parameter in `Start-PowerSpel.ps1`. That way, you can actually start your game.

### Optional

- A folder in your game folder, called `Interactables`. In this folder, you store the primary function (e.g. `Invoke-MyMachine.ps1`) and if applicable, a json file with required data (e.g. `MyMachine.json`).

## Locked doors

If you include locked doors, make sure to lock them from both sides. The game supports one-way locks, but the map doesn't. The way the map is drawn, it only looks to the east and south from a room's perspective. If you have a locked door to the north and the room to the north doesn't have a locked door to the south, it is not displayed in the map.

If you don't use the map, feel free to include one-way locked doors.

## Map

The static map is a bit limited. There is room for 11 rooms vertically, and 20 rooms horizontally. If your world is larger than that, it won't fit and will display an error message. Please take note that the coordinates in the middle of that map are 505050. I advice to create rooms with the coordinates 505050 in the middle, regardless of the map you intend to be used. That way, there's space to expand to in every direction.

## Ideas and inspiration

Here's some ideas and tips you could create in your game:

- One-way exits. If you have an exit to the east from one room to the other, but not from that room back to the west, you have a one-way exit. You can use that to create a trap, or resemble a slide, or something like that.
- Use interactables in any way you want. It enters a function on its own and you are free to do whatever you can think of. Introduct a mini-game, place something in the inventory, or complete an achievement.
- Customize the header. The default is two columns, but you can create more or less, depending on your ideas. Just remember that there is a limited screen size and everything must fit in there.
- Customize your end screen. You can simply state "Game over", but you can also use it to display a score, an ending story, or a nice ASCII art.
