import 'package:dreezeacademy/screen/ClassRoom.dart';
import 'package:dreezeacademy/screen/practicequestionscreen.dart';
import 'package:dreezeacademy/screen/subscriptionscreen.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  Widget buildListTile(IconData icons, String title, Function handler){
    return  ListTile(
      leading: Icon(
          icons
      ),
      title: Text(title),
      onTap: (){
        handler();
      },

    );
  }

  void navigationMethod(BuildContext context, String pageName){
    Navigator.of(context).pushReplacementNamed(pageName);

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            height: 200,
          ),


        buildListTile( Icons.class_, "Classroom", (){

        navigationMethod(context, ClassRoom.routeName);
    }),
          buildListTile( Icons.scanner, "Subscription", (){
            navigationMethod(context, SubscriptionScreen.routeName);

          }),
          buildListTile( Icons.question_answer, "Practice Questions", (){
            navigationMethod(context, PracticeScreeen.routeName);

          }),
          buildListTile( Icons.share, "ShareApp", (){
            //navigationMethod(context, ShareApp.routeName);

          }),
          buildListTile( Icons.scanner, "Support", (){


          }),



        ],
      ),

    );
  }
}

