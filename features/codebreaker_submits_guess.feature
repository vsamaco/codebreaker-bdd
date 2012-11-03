Feature: code-breaker submits guess

  The code-breaker submits a guess of four numbers.  The game marks the guess with
  + and - signs.
  
  For each number in the guess that matches the number and position of a number in
  the secret code, the mark includes one +.  For each number in the guess that
  matches the number but not the position of a number in the secret code,
  a - is added to the mark.
  
  Scenario Outline: submit guess
    Given the secret code is "<code>"
    When I guess "<guess>"
    Then the mark should be "<mark>"
    
  