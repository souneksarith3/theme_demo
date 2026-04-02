import 'package:flutter/material.dart';
import 'package:theme_demo/config/themes/app_theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }
  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      title: Text("Profile", style: AppTheme.lightTheme.textTheme.bodyLarge,),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(18),
    );
  }
}