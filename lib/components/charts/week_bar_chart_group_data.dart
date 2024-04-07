import 'package:fl_chart/fl_chart.dart';
import 'package:task_manager/constants.dart';

BarChartGroupData weekBarChartGroupData({
  required int index,
  required double height,
  double backgroundHeight = 0.0
  }) {

  return BarChartGroupData(
    x: index, 
    barRods: [
      BarChartRodData(
        fromY: height,
        color: cPrimaryColor,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          fromY: backgroundHeight,
          color: cChartBackgroundColor,
        ), toY: 12
      ),
    ]
  );
}