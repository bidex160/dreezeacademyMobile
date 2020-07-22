

import 'dart:async';

import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/provider/q&amodel.dart';
import 'package:dreezeacademy/provider/q&aprovider.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/screen/highlightscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class PracticeScreeen extends StatefulWidget {
  static const routeName = '/PracticeScreen';
  @override
  _PracticeScreeenState createState() => _PracticeScreeenState();
}
class optionList{
  String name;
  int index;
  optionList(this.name, this.index);
}
class _PracticeScreeenState extends State<PracticeScreeen> {
  bool _init=true;
  bool _timeUp = false;
  bool starttest = true;
  var _isloading = false;
  int _selectOption = -1;
  int _questioncounter = 1;
  int _correctAnswer = 0;
  String _currentSelected;
  List<String> _optionNumber = ['A', 'B', 'C', 'D'];
   List<PracticeProvider> listQuest;
  PracticeProvider _currentquestion;
  List<PracticeProvider> _answeredQuestion = [];

  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 70;

  int currentSeconds = 0;

  List<GroupModel> _optionsList = [];

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_){
              return HighlightScreen(_correctAnswer, listQuest);
            }
          ));
        }
      });
    });
  }


  void _Nextquestion(){

    setState(() {

      if(_currentSelected == _currentquestion.answer){
          _correctAnswer = _correctAnswer+ 1;
      }

      _questioncounter = _questioncounter +1;

      _currentquestion = listQuest[_questioncounter-1];
      _optionsList.clear();

      _optionsList.add(
          GroupModel(
            text: _currentquestion.chA,
            index: 1,
          )
      );
      _optionsList.add(
          GroupModel(
            text: _currentquestion.chB,
            index: 2,
          )
      );
      _optionsList.add(
          GroupModel(
            text: _currentquestion.chC,
            index: 3,
          )
      );
      _optionsList.add(
          GroupModel(
            text: _currentquestion.chD,
            index: 4,
          )
      );
    });
  }
  void _FinishQuestion(){

    Navigator.of(context).push(MaterialPageRoute(
      builder: (_){
        return HighlightScreen(_correctAnswer, listQuest);
      }
    ));
    print(_correctAnswer);

  }


  @override
  void didChangeDependencies() async {

    if(_init){
      setState(() {
        _isloading = true;
        print(_isloading);
      });

      Provider.of<QAProvider>(context).testurl().then((_) {

        print(">>>>>>>>>>>>>>>>>LOading>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
       setState(() {
         _isloading = false;
         if(listQuest.toString() == null){
           print("...................itssssss nullll...............");
         }else{
           print(">>>>>>>>>>>>>>>>>finished>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
          _currentquestion = listQuest[0];


          _optionsList.add(
            GroupModel(
              text: _currentquestion.chA,
              index: 1,
            )
          );
          _optionsList.add(
              GroupModel(
                text: _currentquestion.chB,
                index: 2,
              )
          );
          _optionsList.add(
              GroupModel(
                text: _currentquestion.chC,
                index: 3,
              )
          );
          _optionsList.add(
              GroupModel(
                text: _currentquestion.chD,
                index: 4,
              )
          );

          print(_optionsList.length);
         }


       });
     });


    }
    _init = false;   
    super.didChangeDependencies();
  }



  void _startbutton(){
    startTimeout();
    setState(() {
      starttest = !starttest;
    });
  }
  @override
  Widget build(BuildContext context) {
    final question = Provider.of<QAProvider>(context, listen: false);
     listQuest = question.practicequestions;

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Practice Questions"),
          bottom: TabBar(
            indicator: BoxDecoration(
               color: Colors.transparent
            ),

            isScrollable: false,

            tabs: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Container(
              width: Config.xMargin(context, 40),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Tab(
                    child: Text("Question: $_questioncounter", style: TextStyle(
              //  fontWeight: FontWeight.w100,
              fontSize: Config.textSize(context, 5),
            fontFamily: 'ABeeZee',
            fontStyle: FontStyle.italic
        ),),
                  ),

                  Tab(
                    child: Text("${listQuest.length}", style: TextStyle(
                    //  fontWeight: FontWeight.w100,
                    fontSize: Config.textSize(context, 8),
                      fontFamily: 'ABeeZee',
                      fontStyle: FontStyle.italic
                  ),),
                  ),
                ],
              ),
            ),

            Tab(
              child: Text("$timerText",  style: TextStyle(
                //  fontWeight: FontWeight.w100,
                  fontSize: Config.textSize(context, 8),
                  fontFamily: 'ABeeZee',
                fontStyle: FontStyle.italic
              ),),
            ),

          ],
        )



            ],

          ),
        ),


        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[



              starttest ? Container(
                height: Config.yMargin(context, 100),
                width: Config.xMargin(context, 100),
                child: Center (
                  child: Container(
                    width: Config.xMargin(context, 60),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      color: Colors.blue,
                      child: Text("Start"),
                      onPressed: (){
                        _startbutton();
                        print("start");

                      },
                    ),
                  ),
                ),
              )
                  : _isloading ? Container(
                height: Config.yMargin(context, 100),
                    child: Center(
                child: CircularProgressIndicator(),
              ),
                  ) :   Column(

                      children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(top: 10),
                           child: Text("Question $_questioncounter of ${listQuest.length } ", style: TextStyle(
                              //  fontWeight: FontWeight.w100,
                                fontSize: Config.textSize(context, 8),
                                fontFamily: 'ABeeZee'
                            ),),
                         ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 5, right: 5),
                          child: Text("${_currentquestion.question} ", style: TextStyle(
                            //  fontWeight: FontWeight.w100,
                              fontSize: Config.textSize(context, 7),
                              fontFamily: 'ABeeZee'
                          ),),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Container(
                            height: Config.yMargin(context, 40),
                            child: ListView.builder(

                              itemCount: 4,

                              itemBuilder: (_, index){
                                return InkWell(

                                  onTap: (){
                                    setState(() {
                                      print("eeeeeeeeeeeeeeeeeeeeewwwwwwwwwwwwww");
                                      print(index);
                                      _selectOption = index;
                                      _currentSelected = _optionNumber[index];
                                      print(_currentSelected);
                                    });

                                  },
                                  child: Container(

                                    decoration: BoxDecoration(
                                        color: _selectOption == index ? Colors.lightBlue : Colors.white
                                    ),

                                    child: Card(

                                      elevation:5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("${_optionNumber[index]} . ${_optionsList[index].text}"),
                                      ),
                                    ),
                                    width: Config.xMargin(context, 85),
                                    height: Config.yMargin(context, 10),

                                  ),
                                );




                              },
                            ),
                          ),
                        ),
                        _questioncounter != listQuest.length ?
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            width: Config.xMargin(context, 70),

                           decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.blue
                           ),

                            child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                ),

                              child: Text("Next"),
                              onPressed: (){
                                  _answeredQuestion.add(_currentquestion);
                                  _selectOption = -1;
                                  _Nextquestion();
                                  for(int i=0; i<listQuest.length; i++){
                                    print(listQuest[i].answer);
                                  }




                              },
                            ),
                          ),
                        ) :
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            width: Config.xMargin(context, 70),

                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue
                            ),

                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),

                              child: Text("Finish", ),

                              onPressed: (){
                                _FinishQuestion();
                                print(listQuest.length);
                              },
                            ),
                          ),
                        ),



                      ],





                ),





            ],

          ),
        ),


      ),
    );
  }
}


class GroupModel {
  String text;
  int index;
  GroupModel({this.text, this.index});
}