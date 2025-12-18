import 'dart:io';

void main()
{
  print("Enter a number:");

  int num = int.parse(stdin.readLineSync().toString());

  if (num % 2 == 0)
  {
    print("$num is Even");
  }
  else
  {
    print("$num is Odd");
  }
}