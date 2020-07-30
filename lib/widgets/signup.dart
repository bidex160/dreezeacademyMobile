import 'dart:convert';
import 'dart:ffi';
import 'package:country_pickers/country.dart';
import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/screen/signup2screen.dart';
import 'package:dreezeacademy/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../provider/signupprovider.dart';
import 'package:country_pickers/country_pickers.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 String _error="";
  var _loading = false;
  var _hide = true;
 String _selectstatus;

  TextEditingController _useranme = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
 TextEditingController _phone= TextEditingController();

  List<String> selectstatus = ['Student/Professional','Teacher','Parent','School/Institution','Company','Organization'];

  String _statusChar;
 Country _selectedDialogCountry =
 CountryPickerUtils.getCountryByPhoneCode('90');

  final _key = GlobalKey<FormState>();

  Future<Void> _validatedetails() async{


    if(_key.currentState.validate()){
      setState(() {
        _loading = true;
      });

                   Navigator.of(context).pushReplacement(MaterialPageRoute(
                 builder: (_){
                   return SignUpSecond(_useranme.value.text, _email.value.text, _password.value.text, _statusChar);
                 }
             ));
//      SignUpProvider.signupmethod(_useranme.value.text,_statusChar, _email.value.text, _password.value.text).then((value) {
//        print(".......value....");
//        print(value);
//
//           if(value == "signup_success|${_email.value.text}|${_password.value.text}|${_useranme.value.text}"){
//
//             Navigator.of(context).pushReplacement(MaterialPageRoute(
//                 builder: (_){
//                   return SignUpSecond(_useranme.value.text, _email.value.text, _password.value.text, _statusChar);
//                 }
//             ));
//           }else{
//             setState(() {
//               _loading = false;
//               _error = value;
//             });
//           }
//
//
//
//      });
      print("..............Validating........");
    }

  }

  String _statusConverter(String value){
   switch(value){
     case "Student/Professional":
       return "s";
     case 'Teacher':
       return 't';
     case 'Parent':
       return 'p';
     case 'School/Institution' :
        return 'i';
     case 'Company':
       return 'c';
     case 'Organization' :
       return 'o';
     default :
       return "t";
   }

  }


 Widget _buildDialogItem(Country country) => Row(
   children: <Widget>[
     CountryPickerUtils.getDefaultFlagImage(country),
     SizedBox(width: 8.0),
     Text("+${country.phoneCode}"),
//     SizedBox(width: 8.0),
//     Flexible(child: Text(country.name))
   ],
 );
  void _openCountryPickerDialog() => showDialog(
   context: context,
   builder: (context) => Theme(
     data: Theme.of(context).copyWith(primaryColor: Colors.pink),
     child: CountryPickerDialog(
       titlePadding: EdgeInsets.all(8.0),
       searchCursorColor: Colors.pinkAccent,
       searchInputDecoration: InputDecoration(hintText: 'Search...'),
       isSearchable: true,
       title: Text('Select your phone code'),
       onValuePicked: (Country country) =>
           setState(() => _selectedDialogCountry = country),
       itemBuilder: _buildDialogItem,
       priorityList: [
         CountryPickerUtils.getCountryByIsoCode('TR'),
         CountryPickerUtils.getCountryByIsoCode('US'),
       ],
     ),
   ),
 );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,

      body: Container(
        height: Config.yMargin(context, 100),
        child: CustomPaint(
          painter: Draw(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [

              Text("Sign Up", style: appThemeLight.textTheme.subhead,),


              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,top: 30),
                child: Form(
                  key: _key,

                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: _useranme,

                          decoration: InputDecoration(
                            hintText: "Username"
                          ),
                          validator: (value){
                            if(value.isEmpty){
                              return 'Username';
                            }

                            return null;
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                         // _buildDialogItem(Country cou)
                          InkWell(child: _buildDialogItem(_selectedDialogCountry),
                          onTap: (){
                            _openCountryPickerDialog();
                          },),
                          Container(
                            width: Config.xMargin(context, 60),
                              child: TextFormField(
                                controller: _phone,

                                decoration: InputDecoration(
                                    hintText: "700000000",


                                ),
                                keyboardType: TextInputType.phone,
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
                                validator: (value){
                                  if(value.isEmpty){
                                    return 'Username';
                                  }

                                  return null;
                                },

                            ),
                          ),
                        ],

                      ),



                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                              hintText: "Email"
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if(value.isEmpty){
                              return 'email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),

                        child: TextFormField(

                            obscureText: _hide,
                          controller: _password,
                          decoration: InputDecoration(
                           suffixIcon: IconButton(
                             icon: Icon(
                                Icons.remove_red_eye
                             ),
                             onPressed: (){
                               setState(() {
                                 _hide = !_hide;
                               });
                             },

                           ),
                              hintText: "Password"
                          ),
                          validator: (value){
                            if(value.isEmpty){
                              return 'password';
                            }

                            return null;
                          },
                        ),
                      ),
                      Text(_error, style: TextStyle(
                        color: Colors.redAccent
                      ),),

                     _loading?  Padding(
                       padding: const EdgeInsets.only(top: 10),
                       child: Container(child: CircularProgressIndicator()),
                     ): Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          width: Config.xMargin(context, 90),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),

                            color: appThemeLight.primaryColor,
                            child: Text(
                                "SignUp", style: appThemeLight.textTheme.display3,
                            ),
                            onPressed: (){
                             _validatedetails();
                            },
                          ),
                        ),
                      ),




                    ],
                  ),

                ),
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
    ovaltop.quadraticBezierTo(width/2, height /8, width , height *0.25);

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