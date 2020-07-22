import 'package:dreezeacademy/screen/Tabscreen.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profilescreen"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back
          ),
          onPressed: (){
          //  Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
          },
        ),
      ),
      body: Container(
        child: Text("profilescreen"),
      ),

    );
  }
}

