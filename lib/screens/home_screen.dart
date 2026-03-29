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
                Text("Welcome to Supabase", style: AppTheme.lightTheme.textTheme.headlineLarge,),
                Text("Your best sulution to manage your project"),
              ],
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Flexible(
              child: Row(
                mainAxisAlignment: .spaceBetween,
                spacing: 0,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RouteName.signUp);
                    },
                    child: Text("Sign In"),
                  ),
                   ElevatedButton(
                    onPressed: () {
                      
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
