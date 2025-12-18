import 'dart:io';

void main()
{
  const pi = 3.14159;

  print("Enter the radius of the circle:");
  var radius = double.parse(stdin.readLineSync().toString());

  var area = pi * radius * radius;
  var circumference = 2 * pi * radius;

  print("Area of the circle = $area");
  print("Circumference of the circle = $circumference");
}