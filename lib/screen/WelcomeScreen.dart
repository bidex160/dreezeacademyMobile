import 'package:dreezeacademy/widgets/Drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/welcome.dart';
class WelcomeScreen extends StatelessWidget  {
  static const routeName = '/WelcomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerScreen(),
      appBar: AppBar(

        leading: Icon(
          Icons.school
        ),
        title: Text("DreezeAcademy"),

      ),
      //resizeToAvoidBottomInset: false,

      body: WelcomeWidget(),


            bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            title: Text('Results'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
        ],
        //currentIndex: _selectedPage,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
      //  onTap:_selectnumber,
      ),

    );
  }



}