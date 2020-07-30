

import 'dart:async';

import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/model/SolutionModel.dart';
import 'package:dreezeacademy/model/Sqlite.dart';
import 'package:dreezeacademy/model/testmodel.dart';
import 'package:dreezeacademy/provider/testprovider.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/screen/highlightscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class TestScreeen extends StatefulWidget {
  static const routeName = '/PracticeScreen';
  @override
  _TestScreeenState createState() => _TestScreeenState();
}

//option list model
class optionList{
  String name;
  int index;
  optionList(this.name, this.index);
}
class _TestScreeenState extends State<TestScreeen> with TickerProviderStateMixin{

  Animation<Offset> _slide;
  Animation<Offset> _slideB;

  AnimationController _controllerA;
  AnimationController _controllerB;
  Animation<double> _animation;
  Animation<double> _animationB;

  @override
  void initState() {

    _controllerA = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _controllerB = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerA,
        curve: Curves.fastOutSlowIn
      )
    );
    _animationB = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controllerB,
            curve: Curves.fastOutSlowIn
        )
    );
    _slideB = Tween<Offset>(begin: Offset(0.0, -0.15), end: Offset(0.0,0)

    ).animate(
        CurvedAnimation(
            parent: _controllerB,
            curve:Curves.fastOutSlowIn
        )
    );
//    _slide = Tween<Offset>(begin: Offset(0.0, -0.15), end: Offset(0.0,0)
//
//    ).animate(
//        CurvedAnimation(
//            parent: _controllerA,
//            curve:Curves.fastOutSlowIn
//        )
//    );
    super.initState();
  }
  //variablr to dispose timer
  bool _disposed = false;

  //loading question circular progress bar
  bool _init=true;

  //timer check
  bool _timeUp = false;

  //start bt visibility/invisible
  bool starttest = true;

  //circular visibility
  var _isloading = false;

  //selected otion
  int _selectOption = -1;
  int _questioncounter = 1;
  int _correctAnswer = 0;
  int _incorrectAnswer =0;
  String _currentSelected;
  List<String> _optionNumber = ['A', 'B', 'C', 'D'];
  List<solutionModel> answerModel = [];
   List<TestModel> listQuest;
  TestModel _currentquestion;
  List<TestModel> _answeredQuestion = [];

  final interval = const Duration(seconds: 1);
  Timer _timer;

  final int timerMaxSeconds = 50;

  int currentSeconds = 0;

  List<GroupModel> _optionsList = [];

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
  startTimeout([int milliseconds]) {
    var duration = interval;
    _timer = Timer.periodic(duration, (timer) {
      if(!_disposed){
        setState(() {
          // print(timer.tick);
          currentSeconds = timer.tick;
          if (timer.tick >= timerMaxSeconds || _timeUp ==true) {
            // _timer.cancel();
            timer.cancel();
            _controllerA.dispose();
            _controllerB.dispose();
//            Navigator.of(context).pushReplacement(MaterialPageRoute(
//                builder: (_){
//                  return HighlightScreen(_correctAnswer, listQuest, _incorrectAnswer, answerModel);
//                }
//            ));
          }
        });
      }

    });
  }
  @override
  void dispose() {
   _disposed = true;
    super.dispose();
  }


  void _Nextquestion() async{


    print(_selectOption);

    setState(() {

      if(_currentSelected == _currentquestion.answer){
          _correctAnswer = _correctAnswer+ 1;
      }else{
        if(_selectOption != -1){

          print(".........Incorect.............");
          _incorrectAnswer = _incorrectAnswer + 1;
          print(_incorrectAnswer);
          print(".........Incorect.............");
        }


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
      _selectOption = -1;


    });




    if(_controllerA.isCompleted && _controllerB.isCompleted){
      _controllerA.reset();
      _controllerB.reset();
      print(".........Completred............");
     // _controllerA.forward();

      Future.delayed(Duration(milliseconds: 300),(){
        print(".........delayed...........");
         _controllerA.forward();
       // _controllerB.forward();
      });

      Future.delayed(Duration(milliseconds: 500),(){
        print(".........delayed...........");
      // _controllerA.forward();
        _controllerB.forward();
      });

    }
  }
  void _FinishQuestion(){
    _timeUp = true;
    _controllerB.dispose();
    _controllerA.dispose();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_){
        return HighlightScreen(_correctAnswer, listQuest, _incorrectAnswer, answerModel);
      }
    ));
    print(_correctAnswer);

  }

  void _selectedOptionMethod(int index) async{
    int i = await DataBaseOpener.instance.insert({
      DataBaseOpener.columequestion : 'what is your Name',
      DataBaseOpener.columechA:'A',
      DataBaseOpener.columechB:'B',
      DataBaseOpener.columechC:'C',
      DataBaseOpener.columechD:'D',
      DataBaseOpener.columeAnswer:'A',
      DataBaseOpener.columeSelected:'B',

    }

    );
    print(".....eeeeeeeeeeeee..........");
    print(i);
    print(".....eeeeeeeeeeeee..........");

    _answeredQuestion.add(_currentquestion);
    print("............My Index...................");
    print(index);
    print("............My Index...................");

    if(_selectOption != -1){
      answerModel.add(solutionModel(_currentquestion, _optionNumber[_selectOption]));
      setState(() {
        _currentSelected = _optionNumber[index];
      });

    }else{

      answerModel.add(solutionModel(_currentquestion, "N"));
      print("..................Unasnwered.............");

      print("....................unanwered.....................");

    }


  }


  @override
  void didChangeDependencies() async {

    if(_init){
      setState(() {
        _isloading = true;
        print(_isloading);
      });
      answerModel.clear();

      Provider.of<TestProvider>(context).testurl().then((_) {

        print(">>>>>>>>>>>>>>>>>LOading>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
       setState(() {
         _isloading = false;
         if(listQuest.length < 1){
           print("...................itssssss nullll...............");
         }else{
           startTimeout();
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
           _controllerA.forward();
           _controllerB.forward();
          print(_optionsList.length);
         }


       });
     });


    }
    _init = false;   
    super.didChangeDependencies();
  }



  void _startbutton() {

    setState(() {
      starttest = !starttest;
    });
  }

  Widget _OptionsWidget(int x){

//    if(x ==1){
//      Future.delayed(Duration(milliseconds: 2000), (){
//        return InkWell(
//
//          onTap: (){
//            _selectedOptionMethod(x);
//            setState(() {
//
//              _selectOption = x;
//              print(x);
//
//
//            });
//
//          },
//          child: FadeTransition(
//
//            opacity: _animation ,
//            child: SlideTransition(
//              position: _slideB,
//              child: Container(
//
//                decoration: BoxDecoration(
//                    color: _selectOption == x ? Colors.lightBlue : Colors.white
//                ),
//
//                child: Card(
//
//                  elevation:5,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Text("${_optionNumber[x]} . ${_optionsList[x].text}"),
//                  ),
//                ),
//                width: Config.xMargin(context, 90),
//                height: Config.yMargin(context, 10),
//
//              ),
//            ),
//          ),
//        );
//      });
//    }
//    if(x==2){
//      Future.delayed(Duration(milliseconds: 3000), (){
//        return InkWell(
//
//          onTap: (){
//            _selectedOptionMethod(x);
//            setState(() {
//
//              _selectOption = x;
//              print(x);
//
//
//            });
//
//          },
//          child: FadeTransition(
//
//            opacity: _animation ,
//            child: SlideTransition(
//              position: _slide,
//              child: Container(
//
//                decoration: BoxDecoration(
//                    color: _selectOption == x ? Colors.lightBlue : Colors.white
//                ),
//
//                child: Card(
//
//                  elevation:5,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Text("${_optionNumber[x]} . ${_optionsList[x].text}"),
//                  ),
//                ),
//                width: Config.xMargin(context, 85),
//                height: Config.yMargin(context, 10),
//
//              ),
//            ),
//          ),
//        );
//      });
//    }
    if(x==0){
      print("..........1.............");
      return InkWell(

        onTap: () {
          _selectedOptionMethod(x);
          setState(() {
            _selectOption = x;
            print(x);
          });
        },
        child: FadeTransition(

          opacity: _animation,
          child: SlideTransition(
            position: _slideB,
            child: Container(

              decoration: BoxDecoration(
                  color: _selectOption == x ? Colors.lightBlue : Colors.white
              ),

              child: Card(

                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${_optionNumber[x]} . ${_optionsList[x].text}"),
                ),
              ),
              width: Config.xMargin(context, 85),
              height: Config.yMargin(context, 10),

            ),
          ),
        ),
      );
    }
    if(x==1){
      print("..........2..............");
      return InkWell(

        onTap: () {
          _selectedOptionMethod(x);
          setState(() {
            _selectOption = x;
            print(x);
          });
        },
        child: FadeTransition(

          opacity: _animationB,
          child: SlideTransition(
            position: _slideB,
            child: Container(

              decoration: BoxDecoration(
                  color: _selectOption == x ? Colors.lightBlue : Colors.white
              ),

              child: Card(

                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${_optionNumber[x]} . ${_optionsList[x].text}"),
                ),
              ),
              width: Config.xMargin(context, 85),
              height: Config.yMargin(context, 10),

            ),
          ),
        ),
      );
    }
    if(x==2){
      print("..........2..............");
      return InkWell(

        onTap: () {
          _selectedOptionMethod(x);
          setState(() {
            _selectOption = x;
            print(x);
          });
        },
        child: FadeTransition(

          opacity: _animationB,
          child: SlideTransition(
            position: _slideB,
            child: Container(

              decoration: BoxDecoration(
                  color: _selectOption == x ? Colors.lightBlue : Colors.white
              ),

              child: Card(

                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${_optionNumber[x]} . ${_optionsList[x].text}"),
                ),
              ),
              width: Config.xMargin(context, 85),
              height: Config.yMargin(context, 10),

            ),
          ),
        ),
      );
    }
    if(x==3){
      print("..........2..............");
      return InkWell(

        onTap: () {
          _selectedOptionMethod(x);
          setState(() {
            _selectOption = x;
            print(x);
          });
        },
        child: FadeTransition(

          opacity: _animationB,
          child: SlideTransition(
            position: _slideB,
            child: Container(

              decoration: BoxDecoration(
                  color: _selectOption == x ? Colors.lightBlue : Colors.white
              ),

              child: Card(

                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${_optionNumber[x]} . ${_optionsList[x].text}"),
                ),
              ),
              width: Config.xMargin(context, 85),
              height: Config.yMargin(context, 10),

            ),
          ),
        ),
      );
    }
//    else {
//      print("............else.........");
//      return InkWell(
//
//        onTap: () {
//          _selectedOptionMethod(x);
//          setState(() {
//            _selectOption = x;
//            print(x);
//          });
//        },
//        child: FadeTransition(
//
//          opacity: _animation,
//          child: SlideTransition(
//            position: _slide,
//            child: Container(
//
//              decoration: BoxDecoration(
//                  color: _selectOption == x ? Colors.lightBlue : Colors.white
//              ),
//
//              child: Card(
//
//                elevation: 5,
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Text("${_optionNumber[x]} . ${_optionsList[x].text}"),
//                ),
//              ),
//              width: Config.xMargin(context, 85),
//              height: Config.yMargin(context, 10),
//
//            ),
//          ),
//        ),
//      );
//    }


  }
  @override
  Widget build(BuildContext context) {
    final question = Provider.of<TestProvider>(context, listen: false);
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
                      child: Text("Start", style: TextStyle(

                      ),),
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
                child: CircularProgressIndicator(
                ),
              ),
                  ) :   Column(
                       crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 10, right: 10, bottom: 10),
                          child: Text("${_currentquestion.question} ", style: TextStyle(
                            //  fontWeight: FontWeight.w100,
                              fontSize: Config.textSize(context, 7),
                              fontFamily: 'ABeeZee'
                          ),),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 30),
                          child: Container(
                            height: Config.yMargin(context, 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                _OptionsWidget(0),
                                _OptionsWidget(1),
                                _OptionsWidget(2),
                                _OptionsWidget(3),
                              ],
                            ),
                          ),
                        ),


                        _questioncounter != listQuest.length ?
                        Padding(
                          padding: const EdgeInsets.only(top: 20 ,left: 10, right: 10),
                          child: Container(
                            width: Config.xMargin(context, 70),

                           decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.blue
                           ),

                            child: FlatButton (
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                ),

                              child: Text("Next"),
                              onPressed: (){

                                  _selectedOptionMethod(_selectOption);



                                  _Nextquestion();




                              },
                            ),
                          ),
                        ) :
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 10, right: 10),
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