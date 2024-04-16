import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 30,
            fontFamily: "myfont",
            fontWeight: FontWeight.w200,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Stack(
        children: [
          // Background Rectangle
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 206, 138),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
            ),
          ),

          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Name Container
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 266,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
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
                SizedBox(
                  height: 23,
                ),

                // Email Container
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 266,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
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
                SizedBox(
                  height: 23,
                ),

                // Password Container
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 253, 252, 253),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 266,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
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
                SizedBox(
                  height: 23,
                ),

                // Confirm Password Container
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 253, 252, 253),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 266,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
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
                SizedBox(
                  height: 10,
                ),

                // Phone Container
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 266,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 252, 206, 138),
                      ),
                      hintText: "Phone Number",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),

          // Save Button
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your save logic here
                  print('Save button pressed');
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF742A64),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ],
     ),
);
}
}