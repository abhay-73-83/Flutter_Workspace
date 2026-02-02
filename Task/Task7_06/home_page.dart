import 'package:first/Task7_06/vegetable_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences sharedPreferences;
  late String mydata;

  List category = [
    "Animal",
    "Vehicle",
    "Vegetable",
    "Fruit"
  ];

  List logo = [
    "assets/animal.jpg",
    "assets/vehicle.jpg",
    "assets/vegetable.png",
    "assets/fruits.jpg",
  ];

  @override
  void initState() {
    super.initState();
    checkdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${mydata.toString()}"),
        actions: [
          IconButton(
            onPressed: () {
              callMe("7383073847");
            },
            icon: Icon(Icons.call_outlined),
          ),
          IconButton(
            onPressed: () {
              smsMe("7383073847", "Hello Team");
            },
            icon: Icon(Icons.sms_outlined),
          ),
          IconButton(
            onPressed: () {
              sharedPreferences.setBool("app1", true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyLoginPage()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: category.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              if (category[index] == "Vegetable") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VegetablePage()),
                );
              }
              else
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${category[index]} page not created yet"),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
              },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    logo[index],
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 10),
                  Text(
                    category[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void checkdata() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      mydata = sharedPreferences.getString("tops1")!;
    });
  }

  void callMe(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    await launchUrl(uri);
  }

  void smsMe(String phoneNumber, String message) async {
    final Uri uri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: {'body': message},
    );
    await launchUrl(uri);
  }
}