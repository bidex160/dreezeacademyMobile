import '../widgets/signup.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatelessWidget {
  static const routeName = '/SignUpScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: SignUp(),
    );
  }
}
