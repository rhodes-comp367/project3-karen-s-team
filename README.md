[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/dPwN1w3S)
# Final project

This project is a single-player arcade-style shooting game where the player must eliminate monsters that spawn at the top of the screen and descend with each tick. The player controls a shooter that fires bullets upward to hit the monsters before they reach the bottom. Only one monster appears at a time, creating a focused, fast-paced challenge. Monsters marked with a lowercase 'm' have less than 3 health, while monsters marked with an uppercase 'M' have exactly 3 health. Each successful shot reduces a monster’s health by one, and once a monster is defeated, the player earns points equal to the monster’s initial health. After a monster is eliminated, a new one spawns immediately. The game ends once the player earns more than 5 points.

Additional gameplay features include boundary restrictions, preventing the player from moving outside the screen area. Bullets fired by the player will either disappear after colliding with a monster or after reaching the top of the screen without making contact. This project demonstrates basic game mechanics such as player movement, shooting, collision detection, health management, point tracking, and screen boundary enforcement, all combined into a simple yet engaging experience.

The idea for this project was inspired by the Snake game project. Many of the functions and design patterns used here were adapted from the concepts and structure of the Snake game, with modifications to support shooting mechanics instead of snake movements.

**Cite any resources or existing code you used.**

Resources are cited within the code.

**Discuss any challenges, or anything you'd like feedback on.**

One of the biggest challenges I faced during this project was implementing collision detection between bullets and monsters. It was especially difficult to accurately match the position of moving bullets with descending monsters, particularly since I needed to keep track of multiple bullets and manage their interactions with the monsters. After a lot of trial and error, I was able to get the collision system working reliably. However, resolving this introduced a new challenge: managing the transition between monsters. After one monster was defeated, I had to carefully handle the spawning of the next monster without creating bugs or overlaps in the gameplay flow.

Another major difficulty was keeping track of the player’s score and using it to correctly trigger the end of the game. Ensuring that the scoring system consistently updated based on monster health, and that the game recognized when the player exceeded 5 points, required careful attention to timing and condition checks.


