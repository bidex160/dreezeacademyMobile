
import 'package:flutter/material.dart';
import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:flutter/widgets.dart';

ThemeData appThemeLight = ThemeData(

  primaryColor: Colors.blue,
  accentColor: Color(0xff219653),
  primaryColorLight: Colors.white,
  primaryColorDark: Colors.black,
  backgroundColor: Colors.white,
  splashColor: Colors.purple,


  textTheme: ThemeData.light().textTheme.copyWith(
    title: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 20,
      fontWeight: FontWeight.bold,
     color: Colors.black

    ),
//subhead subject
subhead: TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 20,
    fontStyle: FontStyle.normal,
    //fontWeight: FontWeight.bold,

),
//display e.g labeltext textfield
display1: TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: Colors.blueAccent
),


    //display e.g textfield style
    display2: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
//button text
display3: TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 20,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.italic,
  color: Colors.white

),

//subtitle paper
subtitle: TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 18,
  fontWeight: FontWeight.w500,
),


//    bodyText1: ThemeData.light().textTheme.body1.copyWith(
//
//    ),
//  bodyText1: ThemeData.light().textTheme.body1.copyWith()
//    bodyText2: appThemeLight.textTheme.bodyText2.copyWith(
//      color: Colors.red
//    ),
//    headline6: ThemeData.textTheme.headline6.copyWith(
//      color: titleColor,
//    ),


  ),


  appBarTheme:AppBarTheme(
    textTheme:  ThemeData.light().textTheme.copyWith(
     title: TextStyle(
       fontFamily: 'OpenSans',
       fontSize: 20,
       fontWeight: FontWeight.w400
       //fontStyle: FontStyle.italic
     ),

    )

  ),


);