import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dal/pages/HomeScreen.dart';
import 'package:dal/pages/Signin.dart';
import 'package:dal/pages/prefpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _Signupstate createState() => _Signupstate();
}

class _Signupstate extends State<SignUp> {
  final _userNameTextController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmedpasswordController = TextEditingController();
  String selectedCity = 'الرياض'; // تحديد المدينة الافتراضية

  Future signup() async {
  if (passwordCondirmed()) {
    try {
      // Create user with email and password
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Get the UID of the newly created user
      String uid = userCredential.user!.uid;

      // Store user's city and preferences in Firebase
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'city': selectedCity,
        'preferences': {}, // You can update this with the user's preferences
      });

      // Navigate to preference selection page
      print("Navigating to preference selection page...");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PreferenceSelectionPage(uid: uid)), // Pass the UID to the preference selection page
      );
      print("Navigation complete.");
    } catch (error) {
      print("Error during signup: $error");
      // Handle error
    }
  }
}


  bool passwordCondirmed() {
    return _passwordController.text.trim() ==
        _confirmedpasswordController.text.trim();
  }

  @override
  void dispose() {
    super.dispose();
    _userNameTextController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmedpasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Your Account",
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
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
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 266,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _userNameTextController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 252, 206, 138),
                    ),
                    hintText: "Name         ",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 23),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 266,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 252, 206, 138),
                    ),
                    hintText: "Email     ",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 23),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 253, 252, 253),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 266,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    suffix: Icon(
                      Icons.visibility,
                      color: Color.fromARGB(255, 252, 206, 138),
                    ),
                    icon: Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 252, 206, 138),
                      size: 19,
                    ),
                    hintText: "Password    ",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 23),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 253, 252, 253),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 266,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _confirmedpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    suffix: Icon(
                      Icons.visibility,
                      color: Color.fromARGB(255, 252, 206, 138),
                    ),
                    icon: Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 252, 206, 138),
                      size: 19,
                    ),
                    hintText: "Confirm Password    ",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: selectedCity,
                    icon: Icon(Icons.arrow_drop_down),
                    dropdownColor:
                        Colors.white, // Set dropdown background color to white
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCity = newValue!;
                      });
                    },
                    items: <String>['الرياض', 'جدة', 'مكة', 'المدينة']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF742A64),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signin()),
                      );
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(228, 88, 101, 100),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: GestureDetector(
                  onTap: signup,
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF742A64),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 106, vertical: 10),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
