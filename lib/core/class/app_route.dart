import 'package:flutter/material.dart';
import 'package:shop/core/const/app_route_name.dart';

import '../../view/screen/auth_screen/login_screen.dart';
import '../../view/screen/auth_screen/sigIn.dart';
import '../../view/screen/home_screen/main_screen.dart';

abstract class AppRoute {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRouteName.homeScreen: (context) => MainScreen(),
    AppRouteName.sigIn: (context) => SigIn(),
    AppRouteName.logIn: (context) => LoginScreen(),
  };
}
