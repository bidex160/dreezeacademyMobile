import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/model/SolutionModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

class AnswersScreen extends StatefulWidget  {
  //List<solutionModel> question;
  AnswersScreen();


  @override
  _AnswersScreenState createState() => _AnswersScreenState();
}

class _AnswersScreenState extends State<AnswersScreen>  with TickerProviderStateMixin{
 AnimationController _controllerA;
 AnimationController _controllerB;
 Animation<double> _animation;

 Animation<Offset> _slide;
 Animation<Offset> _slideB;

    @override
  void initState() {

      _controllerA  = AnimationController(
       vsync: this,
        duration: Duration(milliseconds: 500),
      );
      _controllerB  = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 5000),
      );
      _animation = Tween(begin:0.0, end: 1.0 ).animate(
        CurvedAnimation(
            parent: _controllerA,
            curve: Curves.easeIn)
      );
      _slide = Tween<Offset>(begin: Offset(0.0, -0.15), end: Offset(0.0,0)

      ).animate(
          CurvedAnimation(
              parent: _controllerA,
              curve:Curves.fastOutSlowIn
          )
      );

      _slideB = Tween<Offset>(begin: Offset(0.0, -0.15), end: Offset(0.0,0)

      ).animate(
          CurvedAnimation(
              parent: _controllerB,
              curve:Curves.fastOutSlowIn
          )
      );

    print(".....................question.....................");
   // print(widget.question.length);
    print(".....................question.....................");
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeLight.backgroundColor,

      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          padding: const EdgeInsets.only(top: 50),
         // color: Colors.redAccent,
          height: Config.yMargin(context, 100),

           child: Column(
             children: [

               Container(
                 height: Config.yMargin(context, 10) ,
                 child: TextFormField(
                   decoration: InputDecoration(
                     hintText: "rttt"
                   ),
                 ),
               ),

//               FadeTransition(
//                  opacity: _animation,
//
//                  child: SlideTransition(
//                    position: _slide,
//
//                    child: Container(
//                      color: Colors.black,
//                      height: Config.yMargin(context, 10),
//                      width: Config.xMargin(context, 90),
//                      child: Card(
//                        child: Text("............yes..."),
//                      ),
//                    ),
//                  ),
//                ),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   color: Colors.black,
                   height: Config.yMargin(context, 10),
                   width: Config.xMargin(context, 90),
                   child: Card(
                     child: Text("............yes..."),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: FadeTransition(
                   opacity: _animation,

                   child: SlideTransition(
                     position: _slide,

                     child: Container(
                       color: Colors.black,
                       height: Config.yMargin(context, 10),
                       width: Config.xMargin(context, 90),
                       child: Card(
                         child: Text("............yes..."),
                       ),
                     ),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: FadeTransition(
                   opacity: _animation,

                   child: SlideTransition(
                     position: _slideB,

                     child: Container(
                       color: Colors.black,
                       height: Config.yMargin(context, 10),
                       width: Config.xMargin(context, 90),
                       child: Card(
                         child: Text("............yes..."),
                       ),
                     ),
                   ),
                 ),
               ),


             InkWell(
               child:Text("Next") ,
               onTap: (){
//                 _controllerA.forward();
//                 _controllerB.forward();

                 if(_controllerA.isCompleted && _controllerB.isCompleted){
                   _controllerA.reset();
                   _controllerB.reset();

              Future.delayed(Duration(milliseconds: 500),(){
                _controllerA.forward();
                _controllerB.forward();
              });

                 }



                 print("..........Tappped.........");
               },
             ),
             ],
           ),



        ),
      ),
    );
  }
}
