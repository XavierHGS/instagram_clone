import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginform_demo/firebase_options.dart'; // Adjust path if necessary
import 'package:loginform_demo/loginform.dart';
import 'package:loginform_demo/home.dart'; // Import the HomePage class from home.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: checkUserLoggedIn(), // Replace with actual check
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data == true) {
            return HomePage(); // User is logged in
          } else {
            return LoginForm(); // User is not logged in
          }
        },
      ),
    );
  }

  Future<bool> checkUserLoggedIn() async {
    // Implement your logic to check if the user is logged in
    // For example:
    // final user = FirebaseAuth.instance.currentUser;
    // return user != null;
    return false; // Placeholder
  }
}