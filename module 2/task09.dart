import 'dart:io';

int factorial(int n)
{
  int fact = 1;
  for (int i = 1; i <= n; i++)
  {
    fact *= i;
  }
  return fact;
}

void main()
{
  print("Enter a number:");
  int num = int.parse(stdin.readLineSync().toString());

  if (num < 0)
  {
    print("Factorial isn't defined for negative number");
  }
  else
  {
    int result = factorial(num);
    print("Factorial of $num is $result");
  }
}