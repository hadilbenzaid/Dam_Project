import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant/auth/login.dart';
import 'package:restaurant/auth/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  //@override
  //void initState() {
   //FirebaseAuth.instance.authStateChanges().listen((User? user){
     //if(user == null){
       //print('user is currently signed out');
     //}else{
      // print('user is sign in');
    // }
  // }

  // );
 //   super.initState();
 // }

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Login(),
     routes: {
       "signup" : (context) => SignUp() ,
       "login" : (context) => Login(),
       //"home" : (context) => Home()
     },
   );
  }


}




