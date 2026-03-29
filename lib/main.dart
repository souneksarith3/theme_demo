import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:theme_demo/config/routes/app_pages.dart';
import 'package:theme_demo/config/routes/route_name.dart';
import 'package:theme_demo/config/themes/app_theme.dart';


void main() async {
  // final String? URL = dotenv.env["URL"];
  // final String? KEY = dotenv.env["KEY"];
  // await Supabase.initialize(
  //   url: URL!,
  //   anonKey: KEY!,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: RouteName.home,
      getPages: AppPages.routes,
    );
  }
}
