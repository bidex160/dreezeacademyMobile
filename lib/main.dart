import 'package:dreezeacademy/provider/classProvider.dart';

import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/provider/testprovider.dart';
import 'package:dreezeacademy/screen/WelcomeScreen.dart';
import 'package:dreezeacademy/screen/highlightscreen.dart';
import './screen/ClassRoom.dart';
import './screen/biologyscreen.dart';
import 'package:dreezeacademy/screen/login_screen.dart';
import 'package:dreezeacademy/screen/mathematicsScreen.dart';
import 'package:dreezeacademy/screen/signup_screen.dart';
import 'package:dreezeacademy/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: appThemeLight.primaryColor));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (ctx) => ClassProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TestProvider(),
        )

      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'DreezeAcademy',
          theme: appThemeLight,
//      home: MyHomePage(),
        initialRoute: '/',
        routes:{
            '/':(ctx)=> SplashScreenMain(),
             LoginScreen.routeName:(ctx) =>LoginScreen(),
             SignUpScreen.routeName:(ctx) => SignUpScreen(),
             ClassRoom.routeName:(ctx) => ClassRoom(),
             WelcomeScreen.routeName:(ctx) => WelcomeScreen(),
             MathsScreen.routeName:(ctx) => MathsScreen(),
             BiologyScreen.routeName:(ctx) => BiologyScreen(),



//           SubscriptionScreen.routeName:(ctx) => SubscriptionScreen(),
//           PracticeScreeen.routeName:(ctx) => PracticeScreeen(),



        },

      ),
    );
  }
}

