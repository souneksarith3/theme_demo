import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_demo/config/routes/route_name.dart';
import 'package:theme_demo/config/themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppTheme.primaryLight,
      child: Column(
        spacing: 30,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              spacing: 10,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: Icon(Icons.flutter_dash_outlined, size: 60,),
                ),
                Text("Welcome to Supabase", style: AppTheme.lightTheme.textTheme.headlineLarge,),
                Text("Your best sulution to manage your project"),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Flexible(
              child: Column(
                mainAxisAlignment: .spaceBetween,
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RouteName.signUp);
                    },
                    child: Text("Sign In"),
                  ),
                   ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RouteName.signIn);
                    },
                    child: Text("Log In"),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }  
}
