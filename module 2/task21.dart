import 'dart:io';

void main()
{
  print("Enter first number:");
  int num = int.parse(stdin.readLineSync().toString());

  print("Enter second number:");
  int num2 = int.parse(stdin.readLineSync().toString());

  try
  {
    double result = num / num2;
    print("Result: $result");
  }
  catch (e)
  {
    print("Error: Cannot divide by zero!");
  }
}