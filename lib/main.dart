import 'package:flutter/material.dart';
import 'package:shop/core/class/app_route.dart';

import 'package:shop/core/class/sharePrefrences.dart';
import 'package:shop/core/class/dio_helper.dart';
import 'package:shop/core/themes/app_theme.dart';
import 'package:shop/view/screen/splash_screen/Entery_Page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute.routes,
      title: "Shop App",
      theme: AppTheme.lightTheme,
      home: const EnterPage(),
    );
  }
}
