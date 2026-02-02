import 'dart:io';

class Book
{
  String title;
  String author;
  int year;

  Book(this.title, this.author, this.year);

  void showDetails()
  {
    print("Title: $title, Author: $author, Year: $year");
  }

  bool isOld() => DateTime.now().year - year > 10;
}

void main()
{
 print("Enter book title: ");
  String title = stdin.readLineSync().toString();

  print("Enter author name: ");
  String author = stdin.readLineSync().toString();

  print("Enter publication year: ");
  int year = int.parse(stdin.readLineSync().toString());

  var book = Book(title, author, year);

  book.showDetails();
  print(book.isOld() ? "This book is over 10 years old." : "This book is not over 10 years old.");
}