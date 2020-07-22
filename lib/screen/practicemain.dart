import 'package:dreezeacademy/Size_Config/Config.dart';
import 'package:dreezeacademy/provider/q&aprovider.dart';
import 'package:dreezeacademy/screen/practicequestionscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class PracticeMain extends StatefulWidget {
  @override
  _PracticeMainState createState() => _PracticeMainState();
}

class _PracticeMainState extends State<PracticeMain> {
  var _init = true;
  var _isloading = false;
  var _loadingbotton = false;
  var _startbt = true;
  @override
  void didChangeDependencies() {
    if(_init){
      print(".........................isLoading>>>>>>>>>>>>>>>>>>>>>");
      setState(() {
        _isloading = true;
      });
//      Provider.of<QAProvider>(context).testurl().then((_) {
//        Navigator.of(context).push(MaterialPageRoute(
//            builder: (_){
//              return PracticeScreeen();
//            }
//        ));
//        print("......................Finished.....................");
//
//        setState(() {
//          _isloading = false;
//        });
//      });
    }
    _init = false;
    super.didChangeDependencies();
  }
  void _checkprogress() async{

    setState(() {
      _startbt = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _startbt ? Center(

         child: FlatButton(
           child: Text("Start Test"),

           onPressed: (){
             print("presssssssssssssssssssssssssssssssssssss.");
            _checkprogress();
           },
         ),
      ) :  Container(
          height:Config.yMargin(context, 100),
          width: Config.xMargin(context, 100),
          child: Center(child: CircularProgressIndicator()),)

    );
  }
}
