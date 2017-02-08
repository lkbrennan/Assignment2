# Assignment2
##Space Invaders
##By Lauren Keenan Brennan

I decided to recreate Space Invaders for my OOP Assignment. I got most of it up and running but had some issues with my Enemies ArrayList which i wasn't able to fix. Regardless, bullets and powerups work and I've enjoyed testing it out and messing around with it so far, so I hope you do too!

Video link - https://youtu.be/HnzeE8dSjUQ

#Controls
- Press 1,2 and 3 in the main menu to navigate through different screens
- Press 1 to start game
- use 'a' and left arrow to move the tank left
- use 'd' and right arrow to move the tank right
- use space bar or 'w' to shoot bullets

#How the Game Works?
- Don't let the aliens hit the ground!
- Make sure they don't fire through all your shields
- Kill as many aliens as possible(MORE POINTS!!)

#Features and Game Elements
- ArrayLists 
- Collisions : used for bullets
- PVectors : used to move the enemies,the player and the bullets
- Minim Library : Background music
- Classes
- Inheritance : Health super class which holds a position PVector and lives counter
- Screens : different display screens
- Self-drawn Sprites : done in paint.net
- PImages : Sprites brought in using images()
- PFonts : All using one created PFont

#Things Im Proud of
- Importing the Minim library and being able to play background music
- My use of vector maths throughout the game
- My collision detection
- I drew all the sprites myself

#Things I Regret
- Was unable to properly fix my ArrayList of Enemies, for some reason they wouldnt delete themselves from the array list if you hit the gameOver() screen and they didn't stay in the correct positions. Tried multiple solutions and asked other people to check my code to see if they could find any issues and nothing helped.
