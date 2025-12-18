import 'dart:async';

Future<String> fetchUser(int id) async
{
  await Future.delayed(Duration(seconds: 2));
  return "User $id";
}

Future<void> main() async
{
  List<String> users = [];

  print("Fetching users...");

  for (int i = 1; i <= 5; i++)
  {
    String user = await fetchUser(i);
    users.add(user);
    print("$user loaded");
  }
  print("All users load:");
}