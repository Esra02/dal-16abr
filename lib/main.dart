import 'package:dal/pages/SignUp.dart';
import 'package:dal/pages/Signin.dart';
import 'package:dal/pages/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: 'AIzaSyAXTPTEHKkqfWD2uuefQICuI3SncE8KQU8',
    appId: '1:500255415974:android:e60694fb1b96dfcaca1e67',
    messagingSenderId: 'sendid',
    projectId: 'daal-339d8',
    storageBucket: 'myapp-b9yt18.appspot.com',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Welcome()
    );
  }
}