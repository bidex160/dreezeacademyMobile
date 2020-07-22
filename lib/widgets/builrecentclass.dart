import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Size_Config/Config.dart';
import '../apptheme/app_theme.dart';

class BuildCRecentClass extends StatelessWidget {
  final List<Color> colorCodes = <Color>[Colors.blue, Colors.yellow];
  final List<double> _stops = [0.4, 0.8];
  final String title;
  final IconData iconData;
  final IconData iconData1;

  BuildCRecentClass(this.title, this.iconData, this.iconData1);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
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
          Container(
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
                title: Text(title),

              )

          ),
        ],
      ),
    );
  }
}
