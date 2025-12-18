import 'dart:io';

void main()
{
  print("Enter the file path:");
  String path = stdin.readLineSync().toString();

  try
  {
    String contents = File(path).readAsStringSync();
    print("File contents: $contents");
  }
  catch (e)
  {
    print("Error: File not found or cannot be read");
  }
}