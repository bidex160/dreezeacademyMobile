import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class QuizScreen extends StatelessWidget {
  final String title;
  final String paper;

  QuizScreen(this.title, this.paper);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: questionanswerscreen(title, paper),
    );
  }
}

class questionanswerscreen extends StatefulWidget {
  String title;
  String Paper;
  questionanswerscreen(this.title, this.Paper);
  @override
  _questionanswerscreenState createState() => _questionanswerscreenState();
}

class _questionanswerscreenState extends State<questionanswerscreen> with TickerProviderStateMixin{

//  Animation<double> animation;
//  AnimationController controller;
//  Tween<double> _tween = Tween(begin: -math.pi, end: math.pi);

  @override
  void initState() {
//  controller = AnimationController(
//    duration: Duration(seconds: 4),
//    vsync: this,
//  );
//  animation = _tween.animate(controller)
//    ..addListener(() {
//    setState(() {});
//    })
//    ..addStatusListener((status) {
//    if (status == AnimationStatus.completed) {
//    controller.repeat();
//    } else if (status == AnimationStatus.dismissed) {
//    controller.forward();
//    }
//    });
//
//  controller.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Question & Answer"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text("${widget.title} ${widget.Paper}"),
          ),

         Container(
           height: Config.yMargin(context, 10),
           child: CustomPaint(
            painter: Draw(),
             child: Text("Meeeeeeeeeeeeeeeee"),
           ),
         ),

//          Container(
//            color: Colors.black,
//            height: Config.yMargin(context, 30) ,
//            child: CustomPaint(
//              child:Text("new poo"),
//              painter: Draw(),
//            ),
//          )


        ],
      ),

    );
  }
}
//class bottomClipper extends CustomPainter{
//  @override
//  void paint(Canvas canvas, Size size) {
//    var path = Path();
//    path.lineTo(0.0, size.height);
//
//    path.quadraticBezierTo(size.width / 6, size.height-40, //point #3
//        size.width / 2, size.height-20); //point #4
//
//    var secondControlPoint =
//    Offset(size.width - size.width/6, size.height); //#point #5
//    var secondEndPoint = Offset(size.width, size.height-30); //point #6
//    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//        secondEndPoint.dx, secondEndPoint.dy);
//    path.lineTo(size.width, size.height); //move to top right #7
//    path.lineTo(size.width, 0.0); //and back to the origin, could not be necessary #1
//  //  path.close();
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return oldDelegate != this;
//  }
//
//
//}

class Draw extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    Paint paint = Paint();
    paint.color = Colors.redAccent;

    path.lineTo(0.0, size.height);

    path.quadraticBezierTo(size.width / 6, size.height-40, //point #3
        size.width / 2, size.height-20); //point #4

    var secondControlPoint =
    Offset(size.width - size.width/6, size.height); //#point #5
    var secondEndPoint = Offset(size.width, size.height-30); //point #6
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
         secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height); //move to top right #7
    path.lineTo(size.width, 0.0); //and back to the origin, could not be necessary #1

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}