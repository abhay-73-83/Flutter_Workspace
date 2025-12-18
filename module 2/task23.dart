import 'dart:io';

void main()
{
  double num1, num2;
  String op;

  while (true)
  {
    try
    {
      print("Enter first number:");
      num1 = double.parse(stdin.readLineSync()!);

      print("Enter second number:");
      num2 = double.parse(stdin.readLineSync()!);

      print("Enter operator (+, -, *, /):");
      op = stdin.readLineSync()!;

      if (op == "+")
      {
        print("Result: ${num1 + num2}");
      }
      else if (op == "-")
      {
        print("Result: ${num1 - num2}");
      }
      else if (op == "*")
      {
        print("Result: ${num1 * num2}");
      }
      else if (op == "/")
      {
        if (num2 == 0) {
          print("Cannot divide by zero");
        }
        else
        {
          print("Result: ${num1 / num2}");
        }
      }
      else
      {
        print("Invalid operator");
      }
      break;
    }
    catch (e)
    {
      print("Invalid input. Please enter numbers");
    }
  }
}