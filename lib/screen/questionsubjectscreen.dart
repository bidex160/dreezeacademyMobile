import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/apptheme/app_theme.dart';
import 'package:dreezeacademy/screen/question&answer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class QuestionSubjectScreen extends StatefulWidget {
  String title;
  QuestionSubjectScreen(this.title);
  @override
  _QuestionSubjectScreenState createState() => _QuestionSubjectScreenState();
}

class _QuestionSubjectScreenState extends State<QuestionSubjectScreen> {
  bool _mathematics= false;
  bool _english=false;
  bool _physics=false;
  bool _chemistry=false;
  bool _biology = false;
  bool _civic=false;
  bool _history = false;
  bool _agric = false;
  bool _geography = false;
  bool _computer = false;
      bool _economics= false;
      bool _lit= false;
      bool _governmnt = false;
          bool _commerce = false;
          String paperTitle;
    Widget papers(String title){
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: Config.yMargin(context, 29),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            InkWell(
              child: Text("Paper 1",style: appThemeLight.textTheme.subtitle),
              onTap: (){
                navgiatormethod(title, "Paper 1");
                print("$title Paper1");

              },
            ),
            Divider(),
            InkWell(
              child: Text("Paper 2", style: appThemeLight.textTheme.subtitle),

              onTap: (){
                navgiatormethod(title, "Paper 2");
              },
            ),
            Divider(),
            InkWell(
              child: Text("Paper 3",style: appThemeLight.textTheme.subtitle),
              onTap: (){
                navgiatormethod(title, "Paper 3");
              },
            ),
            Divider(),
            InkWell(
              child: Text("Paper 4", style: appThemeLight.textTheme.subtitle),
              onTap: (){
                navgiatormethod(title, "Paper 4");
              },
            ),
            Divider(),
            InkWell(
              child: Text("Paper 5", style: appThemeLight.textTheme.subtitle),
              onTap: (){
                navgiatormethod(title, "Paper 5");
              },
            ),
            Divider(),
          ],
        ),
      );

    }
    void navgiatormethod(String title, String paper){
           print("on tapped");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_){
          return QuizScreen(title, paper);
        }
      ));

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text("${widget.title} Questions and Answers", style: appThemeLight.appBarTheme.textTheme.title,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Text("SELECT SUBJECT", style: appThemeLight.textTheme.title,),
            ),
            
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Mathematics",style: appThemeLight.textTheme.subhead),
                    Icon(
                      Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  _mathematics = !_mathematics;
                  _economics =_physics =_chemistry = _history = _lit = _commerce = _geography = _agric = _english = _governmnt= _computer = _civic = _biology = false;
                });
              print(_physics);
              },
            ),
            if(_mathematics)
             papers("Mathematics"),

            InkWell(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("English", style: appThemeLight.textTheme.subhead),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  _english = !_english;
                  _economics =_mathematics= _physics =_chemistry = _history = _lit = _commerce = _geography = _agric = _governmnt= _computer = _civic = _biology = false;
                });
              },
            ),
            if(_english)
              papers("English"),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Physics",style: appThemeLight.textTheme.subhead),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  _physics = !_physics;
                 _economics =_english = _mathematics =_chemistry = _history = _lit = _commerce = _geography = _agric = _governmnt= _computer = _civic = _biology = false;

                });
              },
            ),
            if(_physics)
              papers("Physics"),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Chemistry", style: appThemeLight.textTheme.subhead),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  _chemistry  = !_chemistry;
                  _economics = _english =_mathematics= _physics  = _history = _lit = _commerce = _geography = _agric = _governmnt= _computer = _civic = _biology = false;

                });

              },
            ),
            if(_chemistry)
              papers("Chemistry"),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Biology", style: appThemeLight.textTheme.subhead),

                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
             onTap: (){
                setState(() {
                  _biology = !_biology;
                 _economics = _english =_mathematics= _physics =_chemistry = _history = _lit = _commerce = _geography = _agric = _governmnt= _computer = _civic = false;
                });
             }
            ),
            if(_biology)
              papers("Biology"),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Civic Education", style: appThemeLight.textTheme.subhead),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  _economics =_mathematics = _physics =_chemistry = _history = _lit = _commerce = _geography = _agric = _english = _computer  = _biology = false;
                  _civic = !_civic;
                });
              },
            ),
            if(_civic)
              papers("Civic Education"),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Agricultural Education",style: appThemeLight.textTheme.subhead),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  _economics =_mathematics = _physics =_chemistry = _history = _lit = _commerce = _geography= _english = _computer = _civic = _biology = false;
                  _agric = !_agric;
                });
              },
            ),
            if(_agric)
              papers("Agricultural Education"),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Geography",style: appThemeLight.textTheme.subhead),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  _economics =_mathematics = _physics =_chemistry = _history = _lit = _commerce  = _agric = _english = _computer = _civic = _biology = false;
                  _geography = !_geography;
                });
              },
            ),
            if(_geography)
              papers("Geography"),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Computer Science",style: appThemeLight.textTheme.subhead),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  _economics =_mathematics = _physics =_chemistry = _history = _lit = _commerce = _geography = _agric = _english = _civic = _biology = false;
                  _computer = !_computer;
                });
              },
            ),
            if(_computer)
              papers("Computer"),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Economics",style: appThemeLight.textTheme.subhead),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
               setState(() {
                 _mathematics = _physics =_chemistry = _history = _lit = _commerce = _geography = _agric = _english = _governmnt= _computer = _civic = _biology = false;
                 _economics = !_economics;
               });
              },
            ),
            if(_economics)
              papers("Economics"),

            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Commerce", style: appThemeLight.textTheme.subhead),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  _economics =_mathematics = _physics =_chemistry = _history = _lit =  _geography = _agric = _english = _governmnt= _computer = _civic = _biology = false;
                  _commerce = !_commerce;
                });
              },
            ),
            if(_commerce)
              papers("Commerce"),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Literature", style: appThemeLight.textTheme.subhead),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                _economics =  _mathematics = _physics =_chemistry = _history = _commerce = _geography = _agric = _english = _governmnt= _computer = _civic = _biology = false;
                  _lit = !_lit;
                });
              },
            ),
            if(_lit)
              papers("Literature"),

            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Government",  style: appThemeLight.textTheme.subhead),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                setState(() {

                  _governmnt = !_governmnt;
                  _economics =_mathematics = _physics =_chemistry = _history = _lit = _commerce = _geography = _agric = _english = _computer = _civic = _biology = false;
                });
              },
            ),
            if(_governmnt)
              papers("Government"),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 25 , top: 10, bottom: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("History", style: appThemeLight.textTheme.subhead),
                    Icon(
                        Icons.keyboard_arrow_down
                    )
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  _history = !_history;
                _economics = _mathematics = _physics =_chemistry =  _lit = _commerce = _geography = _agric = _english = _governmnt= _computer = _civic = _biology = false;
                });

              },
            ),
            if(_history)
              papers("History"),





          ],
        ),
      ),
    );
  }
}
