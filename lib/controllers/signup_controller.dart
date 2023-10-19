import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/user_model.dart';
import 'package:e_comm/utills/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //for password visibilityF
  var isPasswordVisible = false.obs;

  Future<UserCredential?> SignupMethod(
      String userName,
      String userEmail,
      String userPhone,
      String userCity,
      String userPassword,
      String userDeviceTocken
      ) async {
    try {
      EasyLoading.show(status: "Please wait");
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);

      //send email verification
      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: userName,
          email: userEmail,
          phone: userPhone,
          userImg: '',
          userDeviceToken: userDeviceTocken,
          country: '',
          userAddress: '',
          street: '',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now(),
          city: userCity);

          //add data into database
          _firestore.collection('user').doc(userCredential.user!.uid).set(userModel.toMap());
          EasyLoading.dismiss();
          return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstants.AppSecendaryColor,
          colorText: AppConstants.AppTextColor);
    }
  }
}
