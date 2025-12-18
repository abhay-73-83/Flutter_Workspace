import 'dart:io';

void main()
{
  print("Enter your Name:");
  var name = stdin.readLineSync().toString();

  print("Enter Your Age: ");
  var age = int.parse(stdin.readLineSync().toString());
  
  print("your name is $name and you have ${100 - age} years left untill you turn 100");
}