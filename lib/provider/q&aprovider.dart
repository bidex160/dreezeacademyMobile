
import 'package:dreezeacademy/provider/q&amodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class QAProvider with ChangeNotifier{
    List<PracticeProvider> list;
    List<PracticeProvider> practicequestions = [];


    Future<void> testurl() async {
      print('Number of books about http: ');
      var url = 'https://www.dreezeacademy.com/QandA.php';

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as List;
        print('Number of books about questionsxxxxxxxxx: ${jsonResponse.length}');
        practicequestions.clear();
        for(int i=0; i<jsonResponse.length; i++){

          practicequestions.add(
              PracticeProvider(
                  jsonResponse[i]['question'],
                  jsonResponse[i]['chA'],
                  jsonResponse[i]['chB'],
                  jsonResponse[i]['chC'],
                  jsonResponse[i]['chD'],
                  jsonResponse[i]['choice'],
              )
          );
          print(jsonResponse[i]['question']);
          print(practicequestions.length);
          notifyListeners();
        }
        print('Number of books about http: ${jsonResponse.toString()}');
        print("....................rrrrrrrrrrrrrrrrrrrrrrrr.............................");
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }


    }

    List<PracticeProvider> get loadedquestions{
      return [...practicequestions];

    }



}