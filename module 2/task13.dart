import 'dart:io';

void main()
{
  print("How many number enter: ");
  int n = int.parse(stdin.readLineSync().toString());

  List<int> numbers = [];

  for (int i = 0; i < n; i++)
  {
    print("Enter number ${i + 1}:");
    numbers.add(int.parse(stdin.readLineSync().toString()));
  }

  for (int i = 0; i < n - 1; i++)
  {
    for (int j = 0; j < n - i - 1; j++)
    {
      if (numbers[j] > numbers[j + 1])
      {
        int temp = numbers[j];
        numbers[j] = numbers[j + 1];
        numbers[j + 1] = temp;
      }
    }
  }
  print("Ascending order: $numbers");

  for (int i = 0; i < n - 1; i++)
  {
    for (int j = 0; j < n - i - 1; j++)
    {
      if (numbers[j] < numbers[j + 1])
      {
        int temp = numbers[j];
        numbers[j] = numbers[j + 1];
        numbers[j + 1] = temp;
      }
    }
  }
  print("Descending order: $numbers");
}