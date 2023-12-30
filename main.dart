import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Details App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserDetailsPage(),
    );
  }
}

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Name:-', border: OutlineInputBorder()),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Email:-', border: OutlineInputBorder()),
            ),
            TextField(
              controller: rollNoController,
              decoration: InputDecoration(
                  labelText: 'Roll No:-', border: OutlineInputBorder()),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  labelText: 'Phone Number:-', border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayDetailsPage(
                      name: nameController.text,
                      email: emailController.text,
                      rollNo: rollNoController.text,
                      phoneNumber: phoneController.text,
                    ),
                  ),
                );
              },
              child: Text('Show Details'),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayDetailsPage extends StatelessWidget {
  final String name;
  final String email;
  final String rollNo;
  final String phoneNumber;

  DisplayDetailsPage({
    required this.name,
    required this.email,
    required this.rollNo,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Logout'),
              content: Text('User $name Logged out'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $name', style: TextStyle(fontSize: 18)),
              Text('Email: $email', style: TextStyle(fontSize: 18)),
              Text('Roll no: $rollNo', style: TextStyle(fontSize: 18)),
              Text('Phone Number: $phoneNumber ',
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
