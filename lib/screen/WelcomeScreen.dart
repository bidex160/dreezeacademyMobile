import 'package:dreezeacademy/widgets/Drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/welcome.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/Size_Config/Config.dart';
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
        title: Center(child: Text("DreezeAcademy", style: appThemeLight.appBarTheme.textTheme.title)),

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