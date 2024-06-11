# PowerSpel2

This repository contains my platform PowerSpel 2. It is an iteration on [PowerSpel (1)](https://github.com/JelleGraaf/PowerSpel), but with six years of experience under my belt.  
In 2017, I created PowerSpel as a means to teach myself the basics of PowerShell. Now, I wanted to give it another go. I have rebuilt PowerSpel 1 from the ground up, modified the Pentest game to the new building layout and made it modular (PowerSpel 2 as a platform, Pentest and the tutorial as games that run on the platform). That way, the road is paved for future games to be added.

The game is now of version 1+. For details on the versions, look at [VERSION.md](./VERSION.md).

## Playing the game

Simply clone the repository and start `Start-PowerSpel.ps1`. You can add the parameters `Game` and/or `Map` to customize the game, the available options are tab completable.

### Terminal settings

The game is played at terminal settings of at least 130 characters wide and 57 lines high. Smaller than that will mess up the game visually. Bigger is possible. but doesn't bring anyting extra.

## Contributing to the project

See [CONTRIBUTING.md](./CONTRIBUTING.md).
