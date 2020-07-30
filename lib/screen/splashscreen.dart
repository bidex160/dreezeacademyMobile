
import 'package:dreezeacademy/screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:splashscreen/splashscreen.dart';




class SplashScreenMain extends StatefulWidget {
  @override
  _SplashScreenMainState createState() => _SplashScreenMainState();
}

class _SplashScreenMainState extends State<SplashScreenMain> {

  final List<int> colorCodes = <int>[600, 500, 100];

  double height,width, xposition, yposition ;

  int _checkboxValue;

  @override
  Widget build(BuildContext context) {

    return new SplashScreen(

        seconds: 10,
      navigateAfterSeconds: new LoginScreen(),
        title: new Text('DreezeAcademy',style: TextStyle(fontFamily: 'ABeeZee',
            fontWeight: FontWeight.w300,
            fontSize: 30, ),),
        image: new Image.asset('images/daLogo.png', fit: BoxFit.contain,),
        backgroundColor: Colors.white,
        loadingText: Text("Loading...", style: TextStyle(fontFamily: 'ABeeZee',
          fontWeight: FontWeight.w300,
        fontSize: 20, ),),
        photoSize: 50.0,
        loaderColor: Colors.blue,

    );
  }
}
