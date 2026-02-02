import 'dart:io';

int palindrome(int n)
{
  int reversed = 0;
  while (n > 0)
  {
    int reminder = n % 10;
    reversed = (reversed * 10) + reminder;
    n = n ~/ 10;
  }
  return reversed;
}

void main()
{
  int rn;

  print("enter a value : ");
  var number = int.parse(stdin.readLineSync().toString());
  rn = palindrome(number);

  if (number == rn)
  {
    print("Number is Palindrome");
  }
  else
  {
    print("Number is not Palindrome");
  }
}