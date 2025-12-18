import 'dart:io';
import 'dart:math';

void main()
{
  Random r1 = Random();
  int numberToGuess = r1.nextInt(100) + 1;
  int? userGuess;

  print("Guess the number between 1 and 100:");

  String hint(int guess) => guess < numberToGuess
      ? "Too low!"
      : guess > numberToGuess
      ? "Too high!"
      : "Correct! You guessed it.";

  while (true)
  {
    try
    {
      userGuess = int.parse(stdin.readLineSync().toString());

      String message = hint(userGuess);
      print(message);

      if (userGuess == numberToGuess) break;
    }
    catch (e)
    {
      print("Invalid input. Please enter an integer.");
    }
  }
}