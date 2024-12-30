import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant/auth/login.dart';
import 'package:restaurant/auth/signup.dart';
import 'package:restaurant/auth/HomePage.dart';
import 'package:restaurant/region/Constantine.dart'; // Import Constantine
import 'package:restaurant/region/Batna.dart'; // Import Batna

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      routes: {
        "signup": (context) => const SignUp(),
        "login": (context) => const Login(),
        "home": (context) => const HomePage(),
        "/constantine": (context) => const Constantine(), // Lowercase route
        "/batna": (context) => const Batna(), // Lowercase route
      },
    );
  }
}
