import 'package:flutter/material.dart';


class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Connect with us",
          style: TextStyle(
            fontSize: 30,
            fontFamily: "myfont",
            fontWeight: FontWeight.w200,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 252, 206, 138),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "For any questions or assistance, please feel free to contact us.",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  "Email:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF742A64),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    sendEmail('Dal_App@hotmail.com', '', '');
                  },
                  child: Text(
                    "Send Email",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF742A64),
                  ),
                ),
              ],
            ),
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
   
  }}