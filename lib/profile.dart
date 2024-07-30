import 'package:flutter/material.dart';
import 'package:loginform_demo/loginform.dart'; // Import your login form

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back arrow
        backgroundColor: Color.fromARGB(255, 174, 20, 20),
        title: Text(''), // Added a title for clarity
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,), 
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK8on4nqoYBX4aDox2Kz3N0pBTY4IauMSobA&s'),
            ),
            SizedBox(height: 50),
            Text(
              'Test Username',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)), // Changed color to black
            ),
            SizedBox(height: 10),
            Text(
              'TestUsername@gmail.com',
              style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0)), // Changed color to black
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                _showSignOutDialog(context);
              },
              child: Text('Sign Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 174, 20, 20), // Button color
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Out'),
          content: Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sign Out'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginForm()),
                ); // Navigate to login form
              },
            ),
          ],
        );
      },
    );
  }
}