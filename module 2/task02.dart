import 'dart:io';

void main()
{
  print("Choose conversion type:");
  print("1. Celsius to Fahrenheit");
  print("2. Fahrenheit to Celsius");

  int choice = int.parse(stdin.readLineSync().toString());

  switch (choice)
  {
    case 1:
      print("Enter temperature in Celsius:");
      var celsius = double.parse(stdin.readLineSync().toString());
      var result = (celsius * 9 / 5) + 32;
      print("$celsius C = $result F");

    case 2:
      print("Enter temperature in Fahrenheit:");
      var fahrenheit = double.parse(stdin.readLineSync().toString());
      var result = (fahrenheit - 32) * 5 / 9;
      print("$fahrenheit F = $result C");

    default:
      print("Invalid choice.");
  }
}