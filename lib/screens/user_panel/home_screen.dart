import 'package:e_comm/utills/app_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppConstants.AppMainColor,
      title: Text("Ecomm"),
      centerTitle: true,),
    );
  }
}
