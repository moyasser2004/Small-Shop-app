import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/ApiData/sharePrefrences.dart';
import 'package:shop/Cubit/loginCubit.dart';
import 'package:shop/dio/DioHelper.dart';
import 'package:shop/Entery_Page.dart';
import 'package:shop/Log_Pages/Login.dart';
import 'Home_pages/home_main.dart';
import 'Log_Pages/SigIn.dart';




main()async{

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  SharedPreferencesHelper.init();
  runApp(
      BlocProvider(
       create: (BuildContext context)=>LoginCubit(),
       child: BlocConsumer<LoginCubit,LoginStates>(
         listener: (context,state){},
         builder: (context,state){
           return MaterialApp(
             routes: {
               "Home_Page": (context)=> HomePage(),
               "SigIn" :(context)=>SigIn(),
               "LogIn" :(context)=> Login(),
             },
             title: "Shop",
             debugShowCheckedModeBanner: false,
             theme: ThemeData(
               appBarTheme: AppBarTheme(
                 systemOverlayStyle: SystemUiOverlayStyle(
                   statusBarColor: Colors.white.withOpacity(.6),
                   statusBarBrightness:Brightness.light,
                   statusBarIconBrightness: Brightness.dark,
                 ),
                 color: Colors.transparent,
                 elevation: 0.0,
               ),
               scaffoldBackgroundColor: Colors.white,

             ),
             home: const EnterPage(),
           );
         },

         )
       )
  );
}