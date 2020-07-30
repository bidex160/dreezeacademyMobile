import 'package:dreezeacademy/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';


class LoginScreen extends StatelessWidget {
  static const routeName = '/LoginScreen';
  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
     app: MaterialApp(
        home: loginScreen(),
      ),
    );
  }
}

class loginScreen extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,

      body: LoginWidget(),

    );
  }



}
