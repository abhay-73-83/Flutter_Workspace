import 'dart:io';

void main()
{
  int big = 0, digit;

  print("Enter Any Number :");
  int num = int.parse(stdin.readLineSync().toString());

  while(num > 0)
    {
      digit = num % 10;
      if(digit > big)
        {
          big = digit;
        }
      num ~/= 10;
    }
    print("Biggest number is : $big");
}