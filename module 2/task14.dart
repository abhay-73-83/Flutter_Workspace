import 'dart:io';

void main()
{
  print("How many word enter: ");
  int n = int.parse(stdin.readLineSync().toString());

  List<String> words = [];

  // Input words
  for (int i = 0; i < n; i++)
  {
    print("Enter word ${i + 1}:");
    words.add(stdin.readLineSync().toString());
  }

  // Remove duplicate
  Set<String> uniqueWords = words.toSet();

  // Convert back to list and sort alphabetically
  List<String> sortedWords = uniqueWords.toList();
  sortedWords.sort();

  print("Unique words in alphabetical order:");
  for (String word in sortedWords)
  {
    print(word);
  }
}