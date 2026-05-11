# Mastermind

A console-based Mastermind game made with OOP in Ruby.

## Features
- Game board made with unicode to reflect coloured pegs and holes in real gameplay.
- Two gameplay modes available

### Mode 1 : Human Code Breaker vs Computer Code Maker
- You play as the Code Breaker who is tasked to decrypt a randomly generated code within 12 tries.
- Enter your guess as a 4-digit code with each digit representing a different colour.
- After making your guess, the board will provide you feedback based on the answer in the form of pegs:
    - Red peg: Correct colour + correct position
    - White peg: Correct colour + incorrect position

### Mode 2 : Human Code Maker vs Computer Code Breaker
- You play as the Code Maker who will create a code based on the provided colours to be decrypted by the Code Breaker.
- The Code Breaker will decrypt your code using the Swaszek strategy:
    1. Generate all possible combinations of secret code
    2. Start with the initial guess of 1122.
    3. Based on the provided feedback of the previous guess, eliminate combinations from 1 that would not have produced the same answer if they were the secret code.
    4. Select the first element in the updated list as the new guess.
    5. Repeat steps 3 and 4.

## Demo videos
- I made a few short demo videos of the gameplay with asciinema
    - Code Maker gameplay: https://asciinema.org/a/QHKbi8TYTF1f2JyK
    - Code Breaker gameplay: https://asciinema.org/a/jz78ngVv0bjfKAAW

## Usage instruction
    `ruby main.rb`
