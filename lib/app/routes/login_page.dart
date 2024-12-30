import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/routes/Register_Page.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/home/controllers/auth_controller.dart';
import 'filled_login_page.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              color: Color(0xFFA52A2A), // Dark red
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Logo
                    Container(
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/Logo.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 40),
                    // Login Button
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => FilledLoginPage());
                      },
                      child: Text('MASUK'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFFA52A2A), // Dark red
                        minimumSize: Size(200, 40),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Register Button
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => RegistrationPage()); // Navigate to Sign Up Page
                      },
                      child: Text('DAFTAR'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFFA52A2A), // Dark red
                        minimumSize: Size(200, 40),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Admin Button
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => FilledLoginPage());
                      },
                      child: Text('ADMIN'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFFA52A2A), // Dark red
                        minimumSize: Size(200, 40),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom dark red section
            Container(
              height: 100,
              color: Color(0xFFA52A2A), // Dark red
            ),
          ],
        ),
      ),
    );
  }
}