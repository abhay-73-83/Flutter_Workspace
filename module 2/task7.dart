import 'dart:io';

void main()
{
  print("Enter a number:");
  int num = int.parse(stdin.readLineSync().toString());

  for (int i = 2; i < num; i++)
  {
    if (num % i == 0)
    {
      print("$num is Not a Prime Number");
    }
  }
  print("$num is a Prime Number");
}
