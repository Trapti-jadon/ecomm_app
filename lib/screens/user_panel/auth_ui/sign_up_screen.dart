import 'package:e_comm/controllers/signup_controller.dart';
import 'package:e_comm/screens/user_panel/auth_ui/signin_screen.dart';
import 'package:e_comm/utills/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignupController signupController = Get.put(SignupController());
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.AppSecendaryColor,
          title: Text(
            "Sign Up",
            style: TextStyle(color: AppConstants.AppTextColor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                isKeyboardVisible
                    ? Text("Welcome to my app")
                    : Column(
                        children: [
                          Lottie.asset("assets/images/welcome_logo.json"),
                        ],
                      ),
                Container(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        controller: userEmail,
                        cursorColor: AppConstants.AppSecendaryColor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        controller: username,
                        cursorColor: AppConstants.AppSecendaryColor,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: "UserName",
                            prefixIcon: Icon(Icons.person),
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        controller: userPhone,
                        cursorColor: AppConstants.AppSecendaryColor,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "Phone",
                            prefixIcon: Icon(Icons.phone),
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        controller: userCity,
                        cursorColor: AppConstants.AppSecendaryColor,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "City",
                            prefixIcon: Icon(Icons.location_pin),
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => TextFormField(
                            controller: userPassword,
                            obscureText:
                                signupController.isPasswordVisible.value,
                            cursorColor: AppConstants.AppSecendaryColor,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.password),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      signupController.isPasswordVisible
                                          .toggle();
                                    },
                                    child:
                                        signupController.isPasswordVisible.value
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility)),
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ))),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Forget Password",
                    style: TextStyle(
                        color: AppConstants.AppSecendaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Material(
                  child: Container(
                    width: Get.width / 2,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                        color: AppConstants.AppSecendaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextButton(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 12, color: AppConstants.AppTextColor),
                      ),
                      onPressed: () async {
                        String name = username.text.trim();
                        String email = userEmail.text.trim();
                        String phone = userPhone.text.trim();
                        String city = userPassword.text.trim();
                        String password = userPassword.text.trim();
                        String userDeviceTocken = '';

                        if (name.isEmpty ||
                            email.isEmpty ||
                            phone.isEmpty ||
                            city.isEmpty ||
                            password.isEmpty) {
                          Get.snackbar("Error", "Please Enter all details",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstants.AppSecendaryColor,
                              colorText: AppConstants.AppTextColor);
                        } else {
                          UserCredential? userCredential =
                              await signupController.SignupMethod(name, email,
                                  phone, city, password, userDeviceTocken);
                          if (userCredential != null) {
                            Get.snackbar("Verification Email Sent",
                                "Please Check Your Email",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstants.AppSecendaryColor,
                                colorText: AppConstants.AppTextColor);
                                FirebaseAuth.instance.signOut();
                                Get.offAll(()=> SignInScreen());
                          }
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: AppConstants.AppSecendaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => SignInScreen());
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: AppConstants.AppSecendaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
