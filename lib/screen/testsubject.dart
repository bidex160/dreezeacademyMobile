import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/provider/testprovider.dart';
import 'package:dreezeacademy/screen/testquestionscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class TestSubject extends StatefulWidget {
  @override
  _TestSubjectState createState() => _TestSubjectState();
}

class _TestSubjectState extends State<TestSubject> {
  var _init = true;

//  @override
//  void didChangeDependencies() {
//    if(_init){
//      print(".........................isLoading>>>>>>>>>>>>>>>>>>>>>");
//      setState(() {
//
//      });
//    }
//    _init = false;
//    super.didChangeDependencies();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),

     body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Mathematics",style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_){
                    return TestScreeen();
                  }
                ));
              },
            ),

            InkWell(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("English", style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
              },
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Physics", style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){

              },
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Chemistry", style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){

              },
            ),
            InkWell(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Biology", style: TextStyle(
                        //  fontWeight: FontWeight.w100,
                          fontSize: Config.textSize(context, 8),
                          fontFamily: 'ABeeZee'
                      )),

                      Icon(
                          Icons.keyboard_arrow_down
                      )
                    ],
                  ),
                ),
                onTap: (){
                }
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Civic Education", style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
              },
            ),

            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Agric", style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
              },
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Geography", style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){

              },
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Computer Science",style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
              },
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Economics", style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){

              },
            ),

            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Commerce", style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
              },
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Literature", style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
              },
            ),


            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Government",  style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
              },
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("History",  style: TextStyle(
                      //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 8),
                        fontFamily: 'ABeeZee'
                    )),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){


              },
            ),




          ],
        ),
      ),


      );
  }
}
