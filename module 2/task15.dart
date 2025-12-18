import 'dart:io';

void main()
{
  print("Enter a string:");
  String text = stdin.readLineSync().toString();

  Map<String, int> count = {};

  for (var c in text.split(''))
  {
    count[c] = (count[c] ?? 0) + 1;
  }

  print(count);
}