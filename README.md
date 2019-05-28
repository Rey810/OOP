# OOP
Odin Project OOP
1. Classic Noughts and Crosses

2. MASTERMIND
GENERAL GAME INFO
#2 players
    -codemaker
    -codebreaker
#game is over when:
    - rounds are over and codebreaker has not guessed the correct combination
    - codebreaker guesses the correct code (4 numbers in the correct positions)


#game logic:
    - codemaker sets combination for the codebreaker to guessed ("code")
    - codebreaker selects 4 numbers each rounds
    - each number is evaluated.
        *if the number matches the number in the "code" AND its at the RIGHT position => the number turns green 
        *if the number matches the number in the "code" AND its at the WRONG position => the number stays white
        *if the number does NOT match the number in the "code" => the number turns red
    - if all numbers are green then the game is over and CODEBREAKER WINS
    - if the rounds are over (game is over) and if the numbers are NOT all green then the CODEMAKER WINS
