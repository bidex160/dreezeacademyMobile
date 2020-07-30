import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
class StatisticsScreen extends StatefulWidget {

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {

  Map<String, double> data = new Map();
  bool _loadChart = false;
  List<Color> _colors = [
    Colors.teal,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.redAccent
  ];

  @override
  void initState() {
    data.addAll({
      'Flutter': 37136,
      'React Native': 69687,
      'Xamarin': 40609,
      'Ionic': 42544
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: 0.8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),


          PieChart(

            dataMap: data,
            colorList:
             _colors, // if not declared, random colors will be chosen
            animationDuration: Duration(milliseconds: 1500),
            chartLegendSpacing: 32.0,
            chartRadius: MediaQuery.of(context).size.width /
                2.7, //determines the size of the chart
            showChartValuesInPercentage: true,
            showChartValues: true,
            showChartValuesOutside: false,
            chartValueBackgroundColor: Colors.grey[200],
            showLegends: true,
            legendPosition:
            LegendPosition.right, //can be changed to top, left, bottom
            decimalPlaces: 1,
            showChartValueLabel: true,
            initialAngle: 0,
            chartValueStyle: defaultChartValueStyle.copyWith(
              color: Colors.blueGrey[900].withOpacity(0.9),
            ),
            chartType: ChartType.disc, //can be changed to ChartType.ring
          )
        ],
      ),
    );
  }
}
