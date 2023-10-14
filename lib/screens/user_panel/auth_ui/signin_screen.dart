import 'package:e_comm/screens/user_panel/auth_ui/sign_up_screen.dart';
import 'package:e_comm/utills/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.AppSecendaryColor,
          title: Text("Sign In",style: TextStyle(color: AppConstants.AppTextColor),),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              isKeyboardVisible?Text("Welcome to my app"):
              Column(
                children: [
                  Lottie.asset("assets/images/welcome_logo.json"),
                ],
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    cursorColor: AppConstants.AppSecendaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                )),
                Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: AppConstants.AppSecendaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "Password",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.visibility_off),
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.bottomRight,
                  child: Text("Forget Password",style: TextStyle(color: AppConstants.AppSecendaryColor,fontWeight: FontWeight.bold),),
                ),
                 SizedBox(height: Get.height/20,),
              Material(
                child: Container(
                  width: Get.width / 2,
                  height: Get.height /18,
                  decoration: BoxDecoration(
                    color: AppConstants.AppSecendaryColor,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: TextButton(child: Text("Sign In",style: TextStyle(fontSize: 12,color: AppConstants.AppTextColor),),
                 
                  onPressed: (){ },),
                ),
              ),
              SizedBox(height: Get.height/20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                "Don't have an account? ",style: TextStyle(
                  color: AppConstants.AppSecendaryColor,
                
                ),
                ),
                GestureDetector(
                  onTap: ()=>Get.offAll(()=>SignUpScreen()),
                  child: Text(
                  "Sign Up",style: TextStyle(
                    color: AppConstants.AppSecendaryColor,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                )
              ],)
            ],
          ),
        ),  
      );
    });
  }
}
