# Adding a game

This document is work in progress. Right now, it only contains snippets to not forget.

## Locked doors
If you include locked doors, make sure to lock them from both sides. The game supports one-way locks, but the map doesn't.
They way the map is drawn, it only looks to the east and south from a room's perspective. If you have a locked door to the
north and the room to the north doesn't have a locked door to the south, it is not displayed in the map.

If you don't use the map, feel free to include one-way locked doors.