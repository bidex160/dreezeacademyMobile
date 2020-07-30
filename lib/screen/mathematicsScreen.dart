
import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/screen/ClassRoom.dart';
import 'package:dreezeacademy/screen/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MathsScreen extends StatelessWidget {
  static const routeName = '/MathsScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mathsscreen(),
    );
  }
}
class mathsscreen extends StatefulWidget {
  @override
  _mathsscreenState createState() => _mathsscreenState();
}

class _mathsscreenState extends State<mathsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 20,
          icon: Icon(

            Icons.arrow_back,
          ),
          onPressed: (){
           // Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
              return WelcomeScreen();
            }));
          },
        ),
        title: Text("Mathematics"),
      ),

      body: SingleChildScrollView(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
             padding: const EdgeInsets.only(left:20, top: 10),
              child: Text("Surds",  style: TextStyle(
                  fontFamily: 'Choco',
                 // fontWeight: FontWeight.w100,
                fontSize: Config.yMargin(context, 2.5),
              ),),
            ),
            Container(
              width: double.infinity,
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.all(Config.xMargin(context, 4)),
                     height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,

                      ),

                      color: Colors.amber,
                    ),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_){
                          return ClassRoom();
                        }
                      ));
                    },
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),



                ],

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:20, top: 10),
              child: Text("Logarithms",  style: TextStyle(
                fontFamily: 'Choco',
                // fontWeight: FontWeight.w100,
                fontSize: Config.yMargin(context, 2.5),
              ),),
            ),
            Container(
              width: double.infinity,
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),



                ],

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:20, top: 10),
              child: Text("Matrices",  style: TextStyle(
                fontFamily: 'Choco',
                // fontWeight: FontWeight.w100,
                fontSize: Config.yMargin(context, 2.5),
              ),),
            ),
            Container(
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),



                ],

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:20, top: 10),
              child: Text("Differentiation",  style: TextStyle(
                fontFamily: 'Choco',
                // fontWeight: FontWeight.w100,
                fontSize: Config.yMargin(context, 2.5),
              ),),
            ),
            Container(
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),



                ],

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:20, top: 10),
              child: Text("Integration",  style: TextStyle(
                fontFamily: 'Choco',
                // fontWeight: FontWeight.w100,
                fontSize: Config.yMargin(context, 2.5),
              ),),
            ),
            Container(
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),



                ],

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:20, top: 10),
              child: Text("Mensuration",  style: TextStyle(
                fontFamily: 'Choco',
                // fontWeight: FontWeight.w100,
                fontSize: Config.yMargin(context, 2.5),
              ),),
            ),

            Container(
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),



                ],

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20, top: 10),
              child: Text("Surds",  style: TextStyle(
                fontFamily: 'Choco',
                // fontWeight: FontWeight.w100,
                fontSize: Config.yMargin(context, 2.5),
              ),),
            ),
            Container(
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),



                ],

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20, top: 10),
              child: Text("Surds",  style: TextStyle(
                fontFamily: 'Choco',
                // fontWeight: FontWeight.w100,
                fontSize: Config.yMargin(context, 2.5),
              ),),
            ),
            Container(
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),



                ],

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20, top: 10),
              child: Text("Surds",  style: TextStyle(
                fontFamily: 'Choco',
                // fontWeight: FontWeight.w100,
                fontSize: Config.yMargin(context, 2.5),
              ),),
            ),
            Container(
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),



                ],

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20, top: 10),
              child: Text("Surds",  style: TextStyle(
                fontFamily: 'Choco',
                // fontWeight: FontWeight.w100,
                fontSize: Config.yMargin(context, 2.5),
              ),),
            ),
            Container(
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.all(Config.xMargin(context, 4)),
                    height: Config.yMargin(context, 20),
                    width: Config.xMargin(context, 35),
                    child: Card(
                      elevation: 5,

                    ),

                    color: Colors.amber,
                  ),



                ],

              ),
            ),



          ],




        ),
      ),



bottomNavigationBar: BottomNavigationBar(
  items: [
    BottomNavigationBarItem(
        title: Text("wwwww"),
      icon: Icon(
        Icons.subject
      )
    ),
    BottomNavigationBarItem(
        title: Text("wwwww"),
        icon: Icon(
            Icons.subject
        )
    ),
    BottomNavigationBarItem(
      title: Text("wwwww"),
        icon: Icon(
            Icons.subject
        )
    ),
  ],
)
    );
  }
}

