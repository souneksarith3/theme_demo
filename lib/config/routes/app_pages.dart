import 'package:get/get.dart';
import 'package:theme_demo/config/routes/route_name.dart';
import 'package:theme_demo/screens/home_screen.dart';
import 'package:theme_demo/screens/profile.dart';
import 'package:theme_demo/screens/sign_in.dart';
import 'package:theme_demo/screens/sign_up.dart';
import 'package:theme_demo/screens/student/student_add.dart';
import 'package:theme_demo/screens/student/student_update.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(name: RouteName.home, page: () => HomeScreen(),),
    GetPage(name: RouteName.signIn, page: () => SignIn(),),
    GetPage(name: RouteName.signUp, page: () => SignUp(),),
    GetPage(name: RouteName.profile, page: () => Profile(),),
    GetPage(name: RouteName.studentAdd, page: () => StudentAdd(),),
    GetPage(name: RouteName.studentUpdate, page: () => StudentUpdate(),),
  ];
}