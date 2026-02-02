import 'dart:io';

void main()
{
  Map<String, String> addressBook = {};

  while (true)
  {
    print("Address Book Menu");
    print("1. Add contact");
    print("2. Update contact");
    print("3. Remove contact");
    print("4. View contacts");
    print("5. Exit");

    print("Enter your choice:");
    int choice = int.parse(stdin.readLineSync().toString());

    if (choice == 1)
    {
      print("Enter name:");
      String name = stdin.readLineSync().toString();

      print("Enter phone number:");
      String phone = stdin.readLineSync()!;

      addressBook[name] = phone;
      print("Contact added successfully.");

    }
    else if (choice == 2)
    {
      print("Enter name to update:");
      String name = stdin.readLineSync().toString();

      if (addressBook.containsKey(name))
      {
        print("Enter new phone number:");
        String phone = stdin.readLineSync().toString();
        addressBook[name] = phone;
        print("Contact updated");
      }
      else {
        print("Contact not found.");
      }

    }
    else if (choice == 3)
    {
      print("Enter name to remove:");
      String name = stdin.readLineSync().toString();

      if (addressBook.containsKey(name))
      {
        addressBook.remove(name);
        print("Contact removed successfully.");
      }
      else
      {
        print("Contact not found.");
      }

    }
    else if (choice == 4)
    {
      print("Contacts:");
      if (addressBook.isEmpty)
      {
        print("Address book empty");
      }
      else
      {
        addressBook.forEach((name, phone)
        {
          print("$name : $phone");
        });
      }

    }
    else if (choice == 5)
    {
      print("Exiting program...");
      break;

    }
    else
    {
      print("Invalid choice.");
    }
  }
}
