import 'package:country_pickers/country.dart';
import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/provider/signupprovider.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:dreezeacademy/screen/WelcomeScreen.dart';
import 'package:dreezeacademy/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../apptheme/app_theme.dart';
import 'dart:async';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
 var _hide = true;
  @override
  void initState() {

    super.initState();
  }

  Future<void> validateDetails() async{
    if(_key.currentState.validate()){
      print("....................here.....................");

//      SignUpProvider.Login(_username.value.text, _password.value.text).then((value) {
//        print("....................here.....................");
//        print(value);
//        print("....................here.....................");
//      });
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) {
        return WelcomeScreen();
      }
    ));

    }
  }
  final _key = GlobalKey<FormState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return ConnectivityWidgetWrapper(
      decoration: BoxDecoration(
        color: appThemeLight.primaryColor,
      ),
      child: Container(

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
                              autofocus: true,
                              style: appThemeLight.textTheme.display2,
                              decoration: InputDecoration(
                               labelText: "Username/email",
                                labelStyle: appThemeLight.textTheme.display1,



                              ),
                              validator: (value){
                                if(value.isEmpty){
                                  return 'Please enter username';
                                }
                                return null;
                              },
                            ),
                            TextFormField(

                              obscureText: _hide,
                              style: appThemeLight.textTheme.display2,
                              decoration: InputDecoration(

                                labelText: "password",
                                labelStyle: appThemeLight.textTheme.display1,
                               suffixIcon: IconButton(
                                 icon: Icon(
                                   Icons.remove_red_eye
                                 ),
                                 onPressed: (){
                                   setState(() {
                                     _hide = !_hide;
                                   });
                                 },
                               )

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
                                     width: Config.xMargin(context, 35),
                                     child: FlatButton(
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(10),
                                       ),

                                       color: appThemeLight.primaryColor,
                                       child: Text(
                                           "Signin", style: TextStyle(
                                         color: Colors.white
                                       ),
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
                             Navigator.of(context).push(MaterialPageRoute(
                               builder: (_){
                                 return SignUpScreen();
                               }
                             ));
                            },
                          ),



                        ],

                      ),


                      

                    ],
                  ),

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
