

import 'dart:convert';

import 'package:dreezeacademy/provider/q&amodel.dart';
import 'package:dreezeacademy/provider/classquestion.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ClassProvider with ChangeNotifier{
  List<PracticeProvider> goverment = [];
  List<ClassQuestion> _classquestion = [
    ClassQuestion("What is ur name 1",
        ["Yes","No","dont know"], "Yes",3, 2, "text",
    "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/rio_from_above_compressed.mp4?raw=true"),

    ClassQuestion("What is ur name 2",
        ["Yes","No","dont know"], "No",4, 2, "text",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),

    ClassQuestion("What is ur name 3",
        ["Yes","No","dont know"], "Yes",5, 2, "text",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),

    ClassQuestion("What is ur name 4",
        ["Yes","No","dont know"], "dont know",6, 2, "dont know",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),

    ClassQuestion("What is ur name 5",
        ["Yes","No","dont know"], "dont know",7, 2, "text",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),


  ];

  List<ClassQuestion> get items{
    return [..._classquestion];
  }



  Future<void> testurl() async {
    print('Number of books about http: ');
 //  var url = 'https://jsonplaceholder.typicode.com/posts/1';
   var url = 'https://www.dreezeacademy.com/QandA.php';

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List;
    } else {

    }


  }

  
  
}