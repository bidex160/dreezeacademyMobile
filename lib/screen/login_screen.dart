import 'package:dreezeacademy/widgets/login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget  {
  static const routeName = '/LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,

      body: LoginWidget(),

    );
  }



}
