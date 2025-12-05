import 'dart:io';

void main()
{
  int reverse = 0, digit;

  print("Enter Any Number:");
  int num = int.parse(stdin.readLineSync().toString());

  while(num!=0)
    {
      digit = num % 10;
      reverse = reverse * 10 + digit;
      num ~/= 10;
    }
    print("Reversed Number is $reverse");
}