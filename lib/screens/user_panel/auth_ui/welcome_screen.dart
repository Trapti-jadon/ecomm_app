// ignore_for_file: unused_import

import 'package:e_comm/utills/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.AppSecendaryColor,
        elevation: 0,
        title: Text("Welcome to my app",style: TextStyle(color: AppConstants.AppTextColor),),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(child: Lottie.asset("assets/images/welcome_logo.json",width: MediaQuery.of(context).size.width*0.5)),
            )
          ],
        ),
      ),
    );
  }
}