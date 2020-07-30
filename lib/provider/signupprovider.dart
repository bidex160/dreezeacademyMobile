import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class SignUpProvider{

  static const String _link = 'https://www.dreezeacademy.com/signup.php';

  static const String _login1 = 'https://www.dreezeacademy.com/login.php';

  static const String _login = 'https://www.dreezeacademy.com/php_parsers/login_parser.php';

  static Future<String> signupmethod(String u, String s, String e, String p) async{

    try{
      var map = Map<String, dynamic>();
      map['u'] = u;
      map['e'] = e;
      map['p'] = p;
      map['s'] = 'p';

      var response = await http.post(_link, body: map);
      if(response.statusCode == 200){
        print(".......respnse body .......");
        return response.body;
      }else{
        print(".......not responding........");
        return "not responding";
      }



    }catch(e){
      return e;

    }

  }

  static Future<String> CompleteSetup(String u, String e, String p,String s,
      String f, String l, String ph, String c, String g, DateTime  d) async{

    try{
      var map = Map<String, dynamic>();


      map['f'] = f;
      map['l'] = l;
      map['g'] = g;
      map['ph'] = ph;
      map['b'] = DateFormat.yMd().format(d);
      map['c'] = c;
      map['user'] = u;
      map['email'] = e;
      map['p'] = p;
      map['s'] = 'p';

      var completeresponse = await http.post(_link, body: map);

      if(completeresponse.statusCode == 200){
      //  print(".....................yes...............");
        return completeresponse.body;
      }else{
        print(".....................no...............");
        return "nnn";
      }


    }catch(e){
      return e.toString();
    }

  }

   static Future<String> Login(String u, String p) async {
      try{
        var map = Map<String, dynamic>();
        map['email'] = u;
        map['password'] = p;
        var response = await http.post(_login1, body: map);

        if(response.statusCode == 200){
          print(response.body);
          print("..........comunicating.............");
          return response.body;
        }else{
          return 'No network';
        }


      }catch(e){
        return e;
      }
    }
}