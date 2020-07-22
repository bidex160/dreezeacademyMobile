import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:custom_dropdown/custom_dropdown.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _checkboxvalue;
  TextEditingController _useranme = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _key = GlobalKey<FormState>();

  Future<Void> _validatedetails() async{
    var url = 'https://www.dreezeacademy.com/signup.php';
  print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");

    if(_key.currentState.validate()){
    var response = await http.get(url);

      if(response.statusCode == 200){

        print(".............................print nooo......................");
        http.post(url,
            body:json.encode({'username':"useranmetext",
              'status':"Teacher", 'email':"thabidemi@gmail.com",
              'password':"Password123"})).then((value) {
          print(value.body);
        });

        print("...............................print yes................");

      }else{
        print("......................QWETY..........................");

      }



    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back
          ),


        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [

          Text("Sign Up"),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
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

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(

                      padding: const EdgeInsets.only(left: 0),
                      width: Config.xMargin(context, 100),
                      child: CustomDropdown(

                        valueIndex: _checkboxvalue,
                        hint: "Select Status...",
                        items: [
                          CustomDropdownItem(text: "Student/Professional"),
                          CustomDropdownItem(text: "Teacher"),
                          CustomDropdownItem(text: "Parent"),
                          CustomDropdownItem(text: "School/Institution"),
                          CustomDropdownItem(text: "Company"),
                          CustomDropdownItem(text: "Organization"),
                        ],
                        onChanged: (newValue) {

                          setState(() {
                            _checkboxvalue = newValue;
                          } );
                        },
                      ),
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          hintText: "Email"
                      ),
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
                      controller: _password,
                      decoration: InputDecoration(
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

                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Container(
                      width: Config.xMargin(context, 90),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        color: appThemeLight.primaryColor,
                        child: Text(
                            "Signin"
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

    );
  }
}
