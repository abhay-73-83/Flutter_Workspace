import 'dart:io';

void main()
{
  BankAccount account = BankAccount("12345", "Abhay", 1000);

  print("Enter amount to deposit:");
  double depositAmount = double.parse(stdin.readLineSync().toString());
  account.deposit(depositAmount);

  print("Enter amount to withdraw:");
  double withdrawAmount = double.parse(stdin.readLineSync().toString());
  account.withdraw(withdrawAmount);

  account.checkBalance();
}

class BankAccount
{
  String accountNumber;
  String accountHolder;
  double balance;

  BankAccount(this.accountNumber, this.accountHolder, this.balance);

  void deposit(double amount)
  {
    balance += amount;
  }

  void withdraw(double amount)
  {
    if (amount <= balance)
    {
      balance -= amount;
    }
    else
    {
      print("Insufficient balance!");
    }
  }

  void checkBalance()
  {
    print("Current Balance: $balance");
  }
}