import 'package:dal/pages/prefpage.dart';
import 'package:flutter/material.dart';

import 'SupportPage.dart';
import 'EditProfilePage.dart';
import 'HistoryPage.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: Color.fromARGB(255, 249, 246, 249),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 110,
                backgroundColor: Color.fromARGB(255, 249, 249, 249),
                child: Icon(
                  Icons.person,
                  size: 110,
                  color: Color(0xFF742A64),
                ),
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  buildButton("Edit Profile", Icons.edit, context),
                  buildButton("Edit Preference", Icons.settings, context),
                  buildButton("History", Icons.history, context),
                  buildEmailButton("Connect with us", context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String label, IconData icon, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
          if (label == "Connect with us") {
            // Navigate to SupportPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SupportPage()),
            );
          } else if (label == "Edit Profile") {
            // Navigate to EditProfilePage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfilePage()),
            );
          } else if (label == "History") {
            // Navigate to ProfileHistoryPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoryPage()),
            );
          }else if (label == "Edit Preference") {
            // Navigate to ProfileHistoryPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PreferenceSelectionApp()),
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
            EdgeInsets.zero,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Color(0xFF742A64)),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            Size(double.infinity, 60),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 24,
                    color: Color(0xFF742A64),
                  ),
                  SizedBox(width: 16),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF742A64),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xFF742A64),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmailButton(String label, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
          sendEmail('Dal_App@hotmail.com', '', '');
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
            EdgeInsets.zero,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Color(0xFF742A64)),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            Size(double.infinity, 60),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.mail,
                    size: 24,
                    color: Color(0xFF742A64),
                  ),
                  SizedBox(width: 16),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF742A64),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xFF742A64),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendEmail(String recipientEmail, String subject, String body) {
    final url = Uri(
      scheme: 'mailto',
      path: recipientEmail,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    ).toString();
    
  }
}

void main() {
  runApp(MaterialApp(
    home: UserProfilePage(),
));
}