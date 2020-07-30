import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/model/SolutionModel.dart';
import 'package:dreezeacademy/model/testmodel.dart';
import 'package:dreezeacademy/screen/testanswer.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:dreezeacademy/screen/staticsscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class HighlightScreen extends StatefulWidget {
  static const routeName = '/highscreen';

  final int correct;
  final List<TestModel> questions;
  final int _incorrect;
  List<solutionModel> answerModel;
  HighlightScreen(this.correct, this.questions,this._incorrect,this.answerModel);

  @override
  _HighlightScreenState createState() => _HighlightScreenState();
}

class _HighlightScreenState extends State<HighlightScreen> {

  double _UnAnswered =0.0;

  Map<String, double> dataMap = new Map();
  List<Color> _colors = [
    Colors.greenAccent,
    Colors.redAccent,
    Colors.amberAccent,
  ];
  void _viewSolutionNavigation(){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_){
        return AnswersScreen();
      }
    ));
  }

  @override
  void initState() {
    _UnAnswered = widget.questions.length.toDouble() - (widget.correct.toDouble() + widget._incorrect.toDouble());
    dataMap.putIfAbsent("Correct Question", () => widget.correct.toDouble());
    dataMap.putIfAbsent("Incorrect Question", () => (widget._incorrect.toDouble()));
    dataMap.putIfAbsent("Unanswered Question", () =>  _UnAnswered);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Highlights"),
          ),
      body: Column(
         children: <Widget>[
           Container(
             margin: const EdgeInsets.only(left: 10,right: 10),
             height: Config.yMargin(context, 30),
             width: Config.xMargin(context, 100),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                   child: Text("WAEC Exams | 2020", style: TextStyle(
                     //  fontWeight: FontWeight.w100,
                       fontSize: Config.textSize(context, 5),
                       fontFamily: 'ABeeZee'
                   ),),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 10,bottom: 10),
                   child: Text("Performance: Review", style: TextStyle(
                     //  fontWeight: FontWeight.w100,
                       fontSize: Config.textSize(context, 8),
                       fontFamily: 'ABeeZee'
                   ),),
                 ),

                 PieChart(
                   dataMap: dataMap,
                   animationDuration: Duration(milliseconds: 900),
                   chartLegendSpacing: 32.0,
                   chartRadius: MediaQuery.of(context).size.width / 2.7,
                   showChartValuesInPercentage: true,
                   showChartValues: true,
                   showChartValuesOutside: false,
                   chartValueBackgroundColor: Colors.grey[200],
                   colorList: _colors,
                   showLegends: true,
                   legendPosition: LegendPosition.right,
                   decimalPlaces: 1,
                   showChartValueLabel: true,
                   initialAngle: 0,
                   chartValueStyle: defaultChartValueStyle.copyWith(
                     color: Colors.blueGrey[900].withOpacity(0.9),
                   ),
                   chartType: ChartType.disc,
                 )
               ],
             ),
           ),

           Container(

             height: Config.yMargin(context, 33),
             child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(left: 20),
                   child: Text("Metrics", style: TextStyle(
                     //  fontWeight: FontWeight.w100,
                       fontSize: Config.textSize(context, 8),
                       fontFamily: 'ABeeZee'
                   ),),
                 ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: <Widget>[
                     Column(
                       children: <Widget>[
                         Text("INCORRECT", style: TextStyle(
                           //  fontWeight: FontWeight.w100,
                             fontSize: Config.textSize(context, 3.5),
                             fontFamily: 'ABeeZee',
                             fontStyle: FontStyle.italic
                         ),),
                         Padding(
                           padding: const EdgeInsets.only(top: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: <Widget>[
                               Icon(
                                 Icons.cancel,
                                 color: Colors.redAccent,
                                 size: Config.yMargin(context, 3),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Text("${widget._incorrect}", style: TextStyle(
                                   //  fontWeight: FontWeight.w100,
                                     fontSize: Config.textSize(context, 9),
                                     fontFamily: 'ABeeZee',
                                     fontWeight: FontWeight.w500
                                 ),),
                               )
                             ],
                           ),
                         ),
                       ],
                     ),
                     Column(
                       children: <Widget>[
                         Text("Correct",  style: TextStyle(
                        //  fontWeight: FontWeight.w100,
                        fontSize: Config.textSize(context, 3.5),
                     fontFamily: 'ABeeZee',
                     fontStyle: FontStyle.italic
                         ),),
                         Padding(
                           padding: const EdgeInsets.only(top: 10),
                           child: Row(
                             children: <Widget>[
                               Icon(
                                 Icons.check_circle_outline,
                                 color: Colors.greenAccent,
                                 size: Config.yMargin(context, 3),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Text("${widget.correct}",
                                   style: TextStyle(
                                     //  fontWeight: FontWeight.w100,
                                       fontSize: Config.textSize(context, 9),
                                       fontFamily: 'ABeeZee',
                                       fontWeight: FontWeight.w500
                                   ),),
                               )
                             ],
                           ),
                         ),
                       ],
                     ),
                     Column(
                       children: <Widget>[
                         Text("UNANSWERED",  style: TextStyle(
                           //  fontWeight: FontWeight.w100,
                             fontSize: Config.textSize(context, 3.5),
                             fontFamily: 'ABeeZee',
                             fontStyle: FontStyle.italic
                         ),),
                         Padding(
                           padding: const EdgeInsets.only(top: 10),
                           child: Row(
                             children: <Widget>[
                               Icon(
                                 Icons.arrow_forward_ios,
                                 color: Colors.greenAccent,

                               ),
                               Text("${_UnAnswered.toInt()}",  style: TextStyle(
                                 //  fontWeight: FontWeight.w100,
                                   fontSize: Config.textSize(context, 9),
                                   fontFamily: 'ABeeZee',
                                   fontWeight: FontWeight.w500
                               ),)
                             ],
                           ),
                         ),
                       ],
                     ),



                   ],
                 ),


                 Padding(
                   padding: const EdgeInsets.only(left: 10, right: 10),
                   child: Container(
                     width: Config.xMargin(context, 90),
                     height: Config.yMargin(context, 6),
                     child: FlatButton(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10),
                       ),

                       color: appThemeLight.primaryColor,
                       child: Text(
                           "VIEW SOLUTIONS",
                         style: TextStyle(
                           //  fontWeight: FontWeight.w100,
                             fontSize: Config.textSize(context, 4),
                             fontFamily: 'ABeeZee',
                           color: Colors.white
                         ),


                           ),
                       onPressed: (){
                       _viewSolutionNavigation();
                       },
                     ),
                   ),
                 ),
               ],

             ),


           ),
           Container(

             height: Config.yMargin(context, 25),

             child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,


               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: <Widget>[
                 Text("Statistics", style: TextStyle(
                   //  fontWeight: FontWeight.w100,
                     fontSize: Config.textSize(context, 8),
                     fontFamily: 'ABeeZee'
                 ),),
                 Row(
                   children: <Widget>[

                   ],
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 10, right: 10),
                   child: Container(
                     width: Config.xMargin(context, 90),
                     height: Config.yMargin(context, 6),
                     child: FlatButton(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10),
                       ),

                       color: appThemeLight.primaryColor,
                       child: Text(
                           "VIEW STATISTICS",

                                style: TextStyle(
                            //  fontWeight: FontWeight.w100,
                             fontSize: Config.textSize(context, 4.5),
                                fontFamily: 'ABeeZee',
                                  color: Colors.white
                                ),
                       ),
                       onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute(
                           builder: (_){
                             return StatisticsScreen();
                           }
                         ));
                       },
                     ),
                   ),
                 ),

               ],
             ),
           )
         ],


      )
    );
  }
}

