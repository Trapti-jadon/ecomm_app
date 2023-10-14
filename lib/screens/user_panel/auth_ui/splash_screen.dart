import 'dart:async';
import 'package:e_comm/utills/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () { 
      Get.offAll(()=>WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstants.AppSecendaryColor,
      appBar: AppBar(
        backgroundColor: AppConstants.AppSecendaryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Container(
              child: Center(child: Lottie.asset("assets/images/welcome_logo.json",width: MediaQuery.of(context).size.width*0.5)),
            ),
            SizedBox(height: 12,),
            
            Container(
              width: Get.width,
              alignment: Alignment.center,
              child: Center(
                  child: Text(
                AppConstants.appCreatedBy,
                style: TextStyle(color: AppConstants.AppTextColor,fontSize: 18,fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }
}
