import 'package:custom_dropdown/custom_dropdown.dart';
import 'package:dreezeacademy/screen/mathematicsScreen.dart';
import 'package:dreezeacademy/screen/testanswer.dart';
import 'package:dreezeacademy/screen/testsubject.dart';
import 'package:dreezeacademy/screen/questionsubjectscreen.dart';
import 'package:dreezeacademy/screen/testquestionscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
class WelcomeWidget extends StatefulWidget {
  @override
  _WelcomeWidgetState createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  int _checkboxValue;
  int _topicalValue;
  bool _maths = false;
  FlickManager flickManager;
  FlickTotalDuration flickTotalDuration;
  CarouselController buttonCarouselController = CarouselController();
  final List<Color> colorCodes = <Color>[Colors.blue, Colors.yellow, Colors.purple];
  List<double> _stops = [0.0, 0.5,0.7];

  Widget _buildTopicContainer(String title, Color color){

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: Config.xMargin(context, 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: _stops,
              colors: colorCodes,

            ),
            color: color,
            shape: BoxShape.rectangle,
            border: Border.all(color: appThemeLight.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child:Stack(
            children: <Widget>[
              Text(title),
              Text("new one"),
              Text(title)
            ],
          )
      ),
    );

  }


  int _bottomselectedIndex = 0;
  void _onItemTapped(int bindex) {
    setState(() {
      _bottomselectedIndex = bindex;
      print("$_bottomselectedIndex");
    });
  }

  @override
  void initState() {
    super.initState();


    flickManager = FlickManager(

      videoPlayerController:
      VideoPlayerController.network("https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/rio_from_above_compressed.mp4?raw=true"),
    );
  }
  @override
  void dispose() {

    flickManager.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20,),
              child: Text("QuickLinks",style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: Config.textSize(context, 8),
                fontFamily: 'ABeeZee'
              ),),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: Config.yMargin(context, 12),
                    width: Config.xMargin(context, 26),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: _stops,
                        colors: colorCodes,

                      ),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: appThemeLight.primaryColor),

                    ),
                    child: InkWell(
                      child: Card(


                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                                Icons.question_answer
                            ),
                            Text("Q&A")
                          ],
                        ),


                      ),
                      onTap: (){

                        showDialog(context: context, builder: (context){
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage('images/test.gif'),
                                    child: Image.asset('images/test.gif'),
                                  ),


                                  Container(

                                    width: Config.xMargin(context, 70),
                                    height: Config.yMargin(context, 5),

                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blue
                                    ),

                                    child: FlatButton (
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)
                                      ),

                                      child: Text("Question & Answer (WASSCE)", style: TextStyle(
                                          color: Colors.white
                                      ),),
                                      onPressed: (){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                                          builder: (_){
                                            return QuestionSubjectScreen("WASSCE");
                                          }
                                        ));

                                      },
                                    ),

                                  ),
                                  Container(

                                    width: Config.xMargin(context, 70),
                                    height: Config.yMargin(context, 5),

                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blue
                                    ),

                                    child: FlatButton (
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)
                                      ),

                                      child: Text("Question & Answer (JAMB)", style: TextStyle(
                                          color: Colors.white
                                      ),),
                                      onPressed: (){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            builder: (_){
                                              return QuestionSubjectScreen("JAMB");
                                            }
                                        ));

                                      },
                                    ),

                                  ),
                                  Container(

                                    width: Config.xMargin(context, 70),
                                    height: Config.yMargin(context, 5),

                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blue
                                    ),

                                    child: FlatButton (
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)
                                      ),

                                      child: Text("Take a Test", style: TextStyle(
                                          color: Colors.white
                                      ),),
                                      onPressed: (){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                                          builder: (_){
                                            return TestSubject();
                                          }
                                        ));

                                      },
                                    ),

                                  ),




                                ],
                              ),
                            ),
                          );
                        });

                      },
                    ),
                  ),
                  Container(

                    height: Config.yMargin(context, 12),
                    width: Config.xMargin(context, 26),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: _stops,
                        colors: colorCodes,

                      ),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: appThemeLight.primaryColor),

                    ),
                    child: Card(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                              Icons.school
                          ),
                          Text("Result")
                        ],
                      ),

                    ),
                  ),
                  Container(

                    height: Config.yMargin(context, 12),
                    width: Config.xMargin(context, 26),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: _stops,
                        colors: colorCodes,

                      ),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: appThemeLight.primaryColor),

                    ),
                    child: InkWell(
                      child: Card(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                                Icons.games
                            ),
                            Text("Game")
                          ],
                        ),

                      ),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_){
                            return AnswersScreen();
                          }
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),


            Container(
              width: double.infinity,
              child: Row(

                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: Config.xMargin(context, 35),
                    child: CustomDropdown(

                      valueIndex: _checkboxValue,
                      hint: "Class",
                      items: [
                        CustomDropdownItem(text: "SS1"),
                        CustomDropdownItem(text: "SS2"),
                        CustomDropdownItem(text: "SS3"),
                      ],
                      onChanged: (newValue) {

                        setState(() => _checkboxValue = newValue);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: Config.xMargin(context, 40),
                    child: CustomDropdown(

                      valueIndex: _topicalValue,
                      hint: "Topical",
                      items: [
                        CustomDropdownItem(text: "First Term"),
                        CustomDropdownItem(text: "Second Term"),
                        CustomDropdownItem(text: "Third Term"),
                      ],
                      onChanged: (newValue) {

                        setState(() => _topicalValue = newValue);
                      },
                    ),
                  ),
                ],
              ),
            ),





            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20),
              child: Text("Prerequisites",style: TextStyle(
                //  fontWeight: FontWeight.w100,
                  fontSize: Config.textSize(context, 8),
                  fontFamily: 'ABeeZee'
              ),),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10),

                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                             header: Center(child: Text("Mathematics")),
                            child: InkWell(
                                child: Container(
                                  height: Config.yMargin(context, 10),
                                    child: Image.asset('images/geometry.png', height: 40,)),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_){
                                    return MathsScreen();
                                  }
                                ));
                              },
                            ),

                        footer: Center(child: Text("Mathematics")),


                            ),

                      ),


                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("English")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("English")),


                        ),

                      ),


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("Civic Education")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("Civic Education")),


                        ),

                      ),


                    ),
                  ),
                ],

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 10),
              child: Text("Sciences",style: TextStyle(
                  fontFamily: 'ABeeZee',
                  fontWeight: FontWeight.w300,
                  fontSize: Config.textSize(context, 8)
              ),),
            ),

            Container(
              padding: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10),

                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("Physics")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("Physics")),


                        ),

                      ),


                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("Chemistry")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("Chemistry")),


                        ),

                      ),


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("Biology")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("Biology")),


                        ),

                      ),


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("Agric")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("Agric")),


                        ),

                      ),


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("Geography")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("Computer Science")),


                        ),

                      ),


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("Computer")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("Science")),


                        ),

                      ),


                    ),
                  ),
                ],

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20),
              child: Text("Social",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Config.textSize(context, 8)
              ),),
            ),

            Container(
              padding: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10),

                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("Economics")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("Economics")),


                        ),

                      ),


                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("Financial")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text(" Accounting")),


                        ),

                      ),


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("Commerce")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("Commerce")),


                        ),

                      ),


                    ),
                  ),
                ],

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20),
              child: Text("Art",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Config.textSize(context, 8)
              ),),
            ),

            Container(
              padding: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: Config.yMargin(context, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10),

                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("Literature")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("in-English")),


                        ),

                      ),


                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("Government")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("Government")),


                        ),

                      ),


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //padding: const EdgeInsets.only(left: 30),
                      height: Config.yMargin(context, 20),
                      width: Config.xMargin(context, 35),
                      child: Card(
                        elevation: 5,
                        child: GridTile(
                          header: Center(child: Text("History")),
                          child: InkWell(
                            child: Container(
                                height: Config.yMargin(context, 10),
                                child: Image.asset('images/geometry.png', height: 40,)),
                            onTap: (){
                              print("Image");
                            },
                          ),

                          footer: Center(child: Text("History")),


                        ),

                      ),


                    ),
                  ),
                ],

              ),
            ),



            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20,bottom: 20),
              child: Text("Recently Viewed Classes",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Config.textSize(context, 7)
              ),),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20,),
              child: Text("Recent Q&A",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Config.textSize(context, 8)
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(


                height: Config.yMargin(context, 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) =>
                      Container(
                        width: Config.xMargin(context, 30),
                        height: Config.yMargin(context, 15),
                        child: Card(
                          child: Column(
                            children: [

                              Text("Mathetics"),


                            ],
                            //] child: Text('Dummy Card Text')
                          ),
                        ),
                      ),
                ),
              ),
            ),





          ],
        ),

      ),
    );
  }
}



//Container(
//padding: const EdgeInsets.only(left: 20,right: 20),
//height: Config.yMargin(context, 23),
//width: double.infinity,
//child: CarouselSlider.builder(
//itemCount: 3,
//
//itemBuilder: (_,int index) {
//return Container(
//height:  Config.yMargin(context, 20),
//child: FittedBox(
//child: Column(
//
//children: [
//
//
//Container(
//height: Config.yMargin(context, 20),
//
//child: InkWell(
//
//child: VisibilityDetector(
//key: ObjectKey(flickManager),
//onVisibilityChanged: (visibility) {
//if (visibility.visibleFraction == 0 && this.mounted) {
//flickManager.flickControlManager.autoPause();
//} else if (visibility.visibleFraction == 1) {
//flickManager.flickControlManager.autoPause();
//setState(() {
//
//});
//}
//},
//child: FlickVideoPlayer(
//
//
//flickManager: flickManager,
//flickVideoWithControls: FlickVideoWithControls(
//videoFit: BoxFit.cover,
//controls: FlickPortraitControls(),
//),
//flickVideoWithControlsFullscreen:FlickVideoWithControls(
//controls:FlickLandscapeControls(
//
//) ,
//
//),
//
//
//
//),
//
//),
//),
//),
//Container(
//height: Config.yMargin(context, 5),
//width: Config.xMargin(context, 75),
//decoration: BoxDecoration(
//color: Colors.grey
//),
//child: Row(
//
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//Row(
//children: <Widget>[
//Icon(
//Icons.thumb_up
//),
//Padding(
//padding: const EdgeInsets.only(left: 5),
//child: Text("12"),
//)
//],
//),
//Row(
//children: <Widget>[
//Icon(
//Icons.thumb_down
//),
//Padding(
//padding: const EdgeInsets.only(left: 5),
//child: Text("12"),
//)
//],
//),
//Row(
//children: <Widget>[
//Icon(
//Icons.school
//),
//Padding(
//padding: const EdgeInsets.only(left: 5),
//child: Text("12"),
//)
//],
//),
//
//
//],
//),
//
//),
//
//
//],
//),
//),
//
//);
//},
//options: CarouselOptions(
//autoPlay: false,
//aspectRatio: 2.0,
//enlargeCenterPage: true,
//scrollDirection: Axis.horizontal,
//),
//),
//),
