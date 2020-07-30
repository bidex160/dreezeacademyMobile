
import 'package:dreezeacademy/model/testmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class TestProvider with ChangeNotifier{
    List<TestModel> list;
    List<TestModel> practicequestions = [];


    Future<void> testurl() async {
      print('Number of books about http: ');
      var url = 'https://www.dreezeacademy.com/QandA.php';

      var response = await http.get(url);

      if (response.statusCode == 200) {
        _clearAll();

        var jsonResponse = convert.jsonDecode(response.body) as List;

        for(int i=0; i<jsonResponse.length; i++){

          practicequestions.add(
              TestModel(
                  jsonResponse[i]['question'],
                  jsonResponse[i]['chA'],
                  jsonResponse[i]['chB'],
                  jsonResponse[i]['chC'],
                  jsonResponse[i]['chD'],
                  jsonResponse[i]['choice'],
              )
          );

          notifyListeners();
        }
        print('Number of books about http: ${jsonResponse.toString()}');
        print("....................rrrrrrrrrrrrrrrrrrrrrrrr.............................");
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }


    }

    List<TestModel> get loadedquestions{
      return [...practicequestions];

    }

    void _clearAll(){
      practicequestions.clear();
      notifyListeners();

    }



}