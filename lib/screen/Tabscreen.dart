//import 'package:dreezeacademy/screen/First_screen.dart';
//import 'package:dreezeacademy/screen/notificationscreen.dart';
//import 'package:dreezeacademy/screen/profilescreen.dart';
//import 'package:dreezeacademy/screen/resultscreen.dart';
//import 'package:dreezeacademy/screen/searchscreen.dart';
//import 'package:flutter/material.dart';
//
//class TabScreen extends StatefulWidget {
//  static const routeName = '/TabScreen';
//  @override
//  _TabScreenState createState() => _TabScreenState();
//}
//
//class _TabScreenState extends State<TabScreen> {
//
//
//  final List<Widget> _pages = [
//    ProfileScreen(),
//    ResultScreen(),
//    SearchScreen(),
//    NotificationScreen(),
//    FirstScreen(),
//
//  ];
// int _selectedPage =4;
//
// void _selectnumber(int index){
//   setState(() {
//     _selectedPage = index;
//     print(_selectedPage);
//   });
// }
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//
//      body: _pages[_selectedPage],
//
//      bottomNavigationBar: BottomNavigationBar(
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.account_circle),
//            title: Text('Account'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.graphic_eq),
//            title: Text('Results'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.search),
//            title: Text('Search'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.notifications),
//            title: Text('Notifications'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text('Home'),
//          ),
//        ],
//        currentIndex: _selectedPage,
//        selectedItemColor: Colors.blueAccent,
//        unselectedItemColor: Colors.black,
//        onTap:_selectnumber,
//      ),
//    );
//  }
//}
