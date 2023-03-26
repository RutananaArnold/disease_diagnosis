import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  // Generate some dummy data for the cahrt
  // This will be used to draw the red line
  final List<FlSpot> dummyData1 = List.generate(50, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // // This will be used to draw the orange line
  // final List<FlSpot> dummyData2 = List.generate(100, (index) {
  //   return FlSpot(index.toDouble(), index * Random().nextDouble());
  // });

  // // This will be used to draw the blue line
  // final List<FlSpot> dummyData3 = List.generate(100, (index) {
  //   return FlSpot(index.toDouble(), index * Random().nextDouble());
  // });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: size.height * 0.8,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    // The red line
                    LineChartBarData(
                      spots: dummyData1,
                      barWidth: 3,
                      isCurved: true,
                      color: Colors.blue,
                    ),
                    // The orange line
                    // LineChartBarData(
                    //   spots: dummyData2,
                    //   isCurved: true,
                    //   barWidth: 3,
                    //   color: Colors.orange,
                    // ),
                    // The blue line
                    // LineChartBarData(
                    //   spots: dummyData3,
                    //   isCurved: false,
                    //   barWidth: 3,
                    //   color: Colors.blue,
                    // )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
