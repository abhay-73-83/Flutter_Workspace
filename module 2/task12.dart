import 'dart:io';

void findLargestSmallest()
{
  print("How many number add: ");
  int n = int.parse(stdin.readLineSync().toString());

  print("Enter number 1:");
  int largest = int.parse(stdin.readLineSync().toString());
  int smallest = largest;

  for (int i = 2; i <= n; i++)
  {
    print("Enter number $i:");
    int num = int.parse(stdin.readLineSync().toString());

    if (num > largest)
    {
      largest = num;
    }
    if (num < smallest)
    {
      smallest = num;
    }
  }

  print("Largest number: $largest");
  print("Smallest number: $smallest");
}

void main()
{
  findLargestSmallest();
}