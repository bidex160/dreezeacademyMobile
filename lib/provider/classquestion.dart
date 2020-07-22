

import 'package:dreezeacademy/provider/classProvider.dart';
import 'package:flutter/cupertino.dart';

class ClassQuestion with ChangeNotifier{
  final String question;
  final List<String> answers;
  final String CorrrectAnswer;
  int like ;
  int unlike;
  final String text;
  final String Videourl;

  ClassQuestion(this.question, this.answers, this.CorrrectAnswer, this.like , this.unlike, this.text,  this.Videourl);


  void addlike(){
    like = like + 1;
    print(like);
    notifyListeners();

  }
  void addunlike(){
    unlike = like+1;
    notifyListeners();
  }




}