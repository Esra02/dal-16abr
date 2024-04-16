
import 'package:dal/pages/HomeScreen.dart';
import 'package:dal/pages/SignUp.dart';
import 'package:dal/pages/Signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              backgroundColor: const Color.fromARGB(255, 252, 206, 138),
              body: Center(
                child: Image.asset(
                  'assets/DAL.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/backgrounduser.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/DAL.png'),
                      ),
                      SizedBox(height: 80),
                      ElevatedButton(
                        onPressed: () {
                          print('Email login button pressed');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signin()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), // تعيين شكل الحافة
                          minimumSize: Size(50, 60),
                          foregroundColor:
                              const Color.fromARGB(255, 251, 250, 250),
                          backgroundColor:
                              const Color.fromARGB(255, 252, 206, 138),
                        ),
                        child: Text(
                          '          Sign in          ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          print('Phone number login button pressed');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUp()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), // تعيين شكل الحافة
                          minimumSize: Size(50, 60),
                          foregroundColor:
                              const Color.fromARGB(255, 252, 251, 251),
                          backgroundColor: Colors.orange[200],
                        ),
                        child: Text(
                          '          Sign up          ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}