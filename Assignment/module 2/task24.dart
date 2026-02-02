import 'dart:io';

void main()
{
  List<int> numbers = [];

  print("Enter integers (type 'stop' to finish):");

  while (true)
  {
    try
    {
      String input = stdin.readLineSync().toString();

      if (input.toLowerCase() == 'stop')
      {
        break;
      }

      int num = int.parse(input);
      numbers.add(num);
    }
    catch (e)
    {
      print("Invalid input. Please enter an integer.");
    }
  }

  print("Your list of integers:");
  print(numbers);
}