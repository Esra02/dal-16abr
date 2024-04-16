// Import necessary packages
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Import other pages
import 'package:dal/pages/ForgotPassword.dart';
import 'package:dal/pages/HomeScreen.dart';
import 'package:dal/pages/SignUp.dart';

// Define a StatefulWidget for the Signin page
class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _Signinstate createState() => _Signinstate();
}

// Define the state for the Signin page
class _Signinstate extends State<Signin> {
  // Controllers for email and password text fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String uid = FirebaseAuth.instance.currentUser!.uid;
  
  Future signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    )
        .then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreen(uid: uid)));
    }).onError((error, stackTrace) {
      print("Error ${error.toString()}");
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // App bar title
        title: const Text(
          "Welcome Back",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "myfont",
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Stack(
        children: [
          // Background container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 252, 206, 138),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Email text field
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 266,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 252, 206, 138),
                    ),
                    hintText: "Email      ",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              // Password text field
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 253, 252, 253),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 266,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    suffix: Icon(
                      Icons.visibility,
                      color: Color.fromRGBO(252, 206, 138, 1),
                    ),
                    icon: Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 252, 206, 138),
                      size: 19,
                    ),
                    hintText: "Password      ",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Forgot Password button
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()),
                  );
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF742A64),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Sign in button
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: GestureDetector(
                  onTap: signIn, // Call signIn method when tapped
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF742A64), // Set background color
                        borderRadius:
                            BorderRadius.circular(27), // Set border radius
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 106, vertical: 10), // Set padding
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Sign up option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF742A64),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(228, 88, 101, 100),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
