import 'dart:io';

void main()
{
  int last, first, sum;

  print("Enter Any Number :");
  int num = int.parse(stdin.readLineSync().toString());

  last = num % 10;

  first = num;
  while(first >= 10)
  {
    first ~/= 10;
  }

  sum = first + last;

  print("First And Last Digit Sum is : $sum");
}