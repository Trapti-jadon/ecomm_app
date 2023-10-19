// ignore_for_file: unused_import

import 'package:e_comm/controllers/google_signin_controller.dart';
import 'package:e_comm/utills/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'signin_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSigninController _googleSigninController =
      Get.put(GoogleSigninController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.AppSecendaryColor,
        elevation: 0,
        title: Text(
          "Welcome to my app",
          style: TextStyle(color: AppConstants.AppTextColor),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: AppConstants.AppSecendaryColor,
              child: Center(
                  child: Lottie.asset(
                "assets/images/welcome_logo.json",
              )),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Happy Shopping",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: Get.height / 12,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: AppConstants.AppSecendaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: TextButton.icon(
                  label: Text(
                    "Sign in with google",
                    style: TextStyle(
                        fontSize: 12, color: AppConstants.AppTextColor),
                  ),
                  icon: Image.asset(
                    "assets/images/google_img.png",
                    width: Get.width / 12,
                    height: Get.height / 12,
                  ),
                  onPressed: () {
                    _googleSigninController.signInWithGoogle();
                  },
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 35,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: AppConstants.AppSecendaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: TextButton.icon(
                  label: Text(
                    "Sign in with Email",
                    style: TextStyle(
                        fontSize: 12, color: AppConstants.AppTextColor),
                  ),
                  icon: Icon(Icons.mail),
                  onPressed: () {
                    Get.to(()=> SignInScreen());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
