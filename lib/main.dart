import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:theme_demo/config/routes/app_pages.dart';
import 'package:theme_demo/config/routes/route_name.dart';
import 'package:theme_demo/config/themes/app_theme.dart';

void main() async {
  await Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR4YmVzcGF0dWVrdXBkb214c2xhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ0NTEwMjQsImV4cCI6MjA5MDAyNzAyNH0.DylWwMibE4evZs6DbAI4BO9MSi7SwNSrmvoCX0Q6hW4",
    url: "https://dxbespatuekupdomxsla.supabase.co",
  );
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
