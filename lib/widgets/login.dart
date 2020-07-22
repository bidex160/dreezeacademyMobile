import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/provider/classProvider.dart';
import 'package:dreezeacademy/screen/Tabscreen.dart';
import 'package:dreezeacademy/screen/WelcomeScreen.dart';
import 'package:dreezeacademy/screen/mathematicsScreen.dart';
import 'package:dreezeacademy/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import '../apptheme/app_theme.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  AnimationController _controller;
  final _myDuration = Duration(seconds: 5);
  // starting
  var _myValue = 0.0;

  var _isInit=true;

  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(_isInit){
      final classprovider = Provider.of<ClassProvider>(context).testurl();

    }
    _isInit = false;
    super.didChangeDependencies();
  }
  final _myNewValue = 100.0;

  Future<void> validateDetails() async{
    if(_key.currentState.validate()){
     Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);

    }
  }
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Container(

      child: CustomPaint(
        painter: Draw(),


            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
             // elevation: 5,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello,", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Config.yMargin(context, 5)
                            ),),
                            Text("Welcome", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Config.yMargin(context, 5)
                            ),),

                          ],
                        ),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Card(

                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _key,

                           child:Column(
                             children: <Widget>[

                          TextFormField(
                            decoration: InputDecoration(
                             labelText: "Username/email"
                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'Please enter username';
                              }
                              return null;
                            },
                          ),
                          TextFormField(

                            decoration: InputDecoration(
                              labelText: "password",

                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 25),
                                 child: Container(
                                   width: Config.xMargin(context, 60),
                                   child: FlatButton(
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(10),
                                     ),

                                     color: appThemeLight.primaryColor,
                                     child: Text(
                                         "Signin"
                                     ),
                                     onPressed: (){
                                     validateDetails();
                                     },
                                   ),
                                 ),
                               ),
                             ]
                           ),
                      ),
                    ),

                  ),
                ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an Account?"),

                        InkWell(
                          child: Text(" SignUp", style: TextStyle(
                            color: appThemeLight.primaryColor,
                          ),),
                          onTap: (){
                           Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
                          },
                        ),



                      ],

                    ),
                    

                  ],
                ),

            ),




      ),
    );
  }
}

class Draw extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
   final height = size.height;
   final width = size.width;
   Paint paint =Paint();
   paint.style = PaintingStyle.fill;


    Path ovalpath = Path();
   ovalpath.moveTo(0, height*0.9167);
   ovalpath.quadraticBezierTo(width * 0.25, height * 0.875, width * 0.5, height *0.9167);

   ovalpath.quadraticBezierTo(width * 0.75, height * 0.9584, width * 1.0, height *0.9167);

   ovalpath.lineTo(width, height);
   ovalpath.lineTo(0, height);
   paint.color = appThemeLight.primaryColor;
    canvas.drawPath(ovalpath, paint);

   Path ovaltop = Path();
   ovaltop.moveTo(0, height*0.25);
   ovaltop.quadraticBezierTo(width/2, height /2, width , height *0.25);

   ovaltop.lineTo(width, 0);
   ovaltop.lineTo(0, 0);
   paint.color = appThemeLight.primaryColor;
   canvas.drawPath(ovaltop, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
   return oldDelegate != this;
  }

}
