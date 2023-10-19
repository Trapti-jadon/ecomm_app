import 'package:e_comm/screens/user_panel/auth_ui/welcome_screen.dart';
import 'package:e_comm/utills/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppConstants.AppMainColor,
      actions: [
        GestureDetector(
          onTap: ()async{
            GoogleSignIn googleSignIn = GoogleSignIn();
           await googleSignIn.signOut();
            Get.offAll(()=>WelcomeScreen());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.logout),
          ),
        )
      ],
      title: Text("Ecomm"),
      centerTitle: true,),
      
    );
  }
}
