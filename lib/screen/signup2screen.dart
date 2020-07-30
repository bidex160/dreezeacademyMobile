import 'dart:ffi';

import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/provider/signupprovider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class SignUpSecond extends StatefulWidget {
  final String u;
  final String e;
  final String p;
  final String s;
  SignUpSecond(this.u, this.e, this.p, this.s);
  @override
  _SignUpSecondState createState() => _SignUpSecondState();
}

class _SignUpSecondState extends State<SignUpSecond> {
  var _loading = false;
  String _error="";

  List<String> _Status= ['Student/Professional','Teacher','Parent','School/Institution','Company','Organization'];
  String _selectedStatus;
  String _StatusChar;
  List<String> _Gender= ['Male','Female'];
  String _selectedgender;
  String _genderChar;
  final _key = GlobalKey<FormState>();
  DateTime _selectedDate;

  TextEditingController _firstname= TextEditingController();
  TextEditingController _lastname= TextEditingController();


  Future<Void> validateDetails(){
    setState(() {
      _loading = true;
    });


    if(_key.currentState.validate()) {

//      SignUpProvider.CompleteSetup(widget.u,
//          widget.e, widget.p,widget.s,
//          _firstname.value.text, _lastname.value.text,
//          _phone.value.text, _selectedCountry, _genderChar, _selectedDate).then((value) {
//
//        print(value);
//        if(value == 'complete_signup_success'){
//          setState(() {
//            _loading = false;
//
//          });
//
//
//          Dialog(
//
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(10),
//            ),
//            child: Container(
//              height: 200,
//              child: Text("Registration Successfully"),
//            ),
//
//          );
//        }
//        else{
//          setState(() {
//            _loading = false;
//            _error = value;
//          });
//
//        }
//        return value;
//      });
    }

    print(".....onpressed.....");



  }

  String _genderConverter(String value){
    switch(value){
      case "Male":
        return 'm';
      case 'Female':
        return 'f';
      default:
        return 'm';
    }
  }

  String _StatusConverter(String value){
    switch(value){
      case "Student/Professional":
        return 's';
      case 'Teacher':
        return 't';
      case 'Parent':
        return 'p';
      case 'School/Institution':
        return 'i';
      case 'Company':
        return 'c';
      case 'Organization':
        return 'o';
      default:
        return 's';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: Draw(),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,

          children: <Widget>[

            Text("Complete Setup", style: appThemeLight.textTheme.subhead,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
              key: _key,

                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _firstname,
                      style: appThemeLight.textTheme.display2,
                      decoration: InputDecoration(
                        labelText: "FirstName",
                        labelStyle: appThemeLight.textTheme.display1,



                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please enter firstname';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastname,
                      style: appThemeLight.textTheme.display2,

                      decoration: InputDecoration(
                        labelText: "LastName",
                        labelStyle: appThemeLight.textTheme.display1,


                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please enter phone number';
                        }
                        return null;
                      },
                    ),
                    Container(
                      width: Config.xMargin(context, 100),
                      height: Config.yMargin(context, 5),

                      child: DropdownButton<String>(
                        hint: Text("Select Status.."),
                        value: _selectedStatus,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 20.0, // can be changed, default: 24.0
                        iconEnabledColor: Colors.blue,
                        underline: Container(),

                        items: _Status.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child:Text(value),
                          );

                        }).toList(),

                        onChanged: (value){
                          print(value);
                          setState(() {
                            _selectedStatus= value;
                            _StatusChar = _StatusConverter(value);
                          });

                          print(_StatusChar);


                        },

                      ),
                    ),
                    Container(
                      width: Config.xMargin(context, 100),
                      height: Config.yMargin(context, 5),

                      child: DropdownButton<String>(
                        hint: Text("Select Gender"),
                        value: _selectedgender,
                         isExpanded: true,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 20.0, // can be changed, default: 24.0
                        iconEnabledColor: Colors.blue,
                        underline: Container(),

                        items: _Gender.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child:Text(value),
                          );

                        }).toList(),

                        onChanged: (value){
                          print(value);
                          setState(() {
                            _selectedgender= value;
                            _genderChar = _genderConverter(value);
                          });

                          print(_genderChar);


                        },

                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          InkWell(

                            child: Text("Choose Date", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: appThemeLight.primaryColor,
                            ),),

                            onTap: (){
                              _presentdatePicker();

                            },
                          ),
                          Text( _selectedDate == null ? "No Date Selected": DateFormat.yMd().format(_selectedDate)),

                        ],
                      ),
                    ),
                    Text(_error, style: TextStyle(
                        color: Colors.redAccent
                    ),),

                    _loading ? Padding(
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
                            "Complete Setup", style: TextStyle(
                              color: Colors.white
                          ),
                          ),
                          onPressed: (){
                            validateDetails();
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
    );
  }

  void _presentdatePicker(){
  showDatePicker(

      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2222),

  ).then((value) {
    if(value == null){
      return null;
    }

    setState(() {
      _selectedDate = value;
    });

  });
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