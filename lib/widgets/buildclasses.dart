import 'package:dreezeacademy/screen/ClassRoom.dart';
import 'package:dreezeacademy/screen/ClassRoom.dart';
import 'package:dreezeacademy/screen/biologyscreen.dart';
import 'package:dreezeacademy/screen/mathematicsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Size_Config/Config.dart';
import '../apptheme/app_theme.dart';

class BuildClass extends StatelessWidget {
  final List<Color> colorCodes = <Color>[Colors.blue, Colors.yellow];
  final List<double> _stops = [0.4, 0.8];
  final String title;
  final String title1;
  IconData iconData;
  IconData iconData1;
  void classNavigation(BuildContext context, String subject){

  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (_){
      return MathsScreen();
    }
  ));
//   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
//     return mathsscreen();
//   }));
  }

  BuildClass(this.title,this.title1, this.iconData, this.iconData1);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Container(
                height: Config.yMargin(context, 13),
                width: Config.xMargin(context, 40),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: _stops,
                    colors: colorCodes,

                  ),
                  shape: BoxShape.rectangle,
                  border: Border.all(color: appThemeLight.primaryColor),

                ),
                child:GridTileBar(
                  leading: Icon(
                    iconData
                  ),
                  title: Text(title),

                )

            ),
            onTap: (){
              classNavigation(context, MathsScreen.routeName);
              //classNavigation(context);


            },
          ),
         InkWell(
         child: Container(
              height: Config.yMargin(context, 13),
              width: Config.xMargin(context, 43),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: _stops,
                  colors: colorCodes,

                ),
                shape: BoxShape.rectangle,
                border: Border.all(color: appThemeLight.primaryColor),

              ),
              child:GridTileBar(
                leading: Icon(
                    iconData
                ),
                title: Text(title1),

              )

          ),
           onTap: (){
            classNavigation(context, BiologyScreen.routeName);
             print(title1);
             //function();
           },
    ),
        ],
      ),
    );
  }
}
