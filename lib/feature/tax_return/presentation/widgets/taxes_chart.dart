import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TaxesChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gradientColors = [
      Color(0xFF636363),
      Color(0xFFFFFFFF),
    ];
    return LineChart(
      LineChartData(
          minX: 0,
          maxX: 11,
          maxY: 6,
          minY: 0,
          titlesData: LineTitiles.getTittleDate(),
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              colors: [Color(0xFFCCCCCC)],
              belowBarData: BarAreaData(
                  gradientTo: Offset.fromDirection(20.65),
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.56))
                      .toList()),
              barWidth: 3,
              spots: [
                FlSpot(0, 5),
                FlSpot(1, 5),
                FlSpot(1.3, 4),
                FlSpot(2.3, 5),
                FlSpot(3, 4),
                FlSpot(6, 2),
                FlSpot(9, 3),
                FlSpot(9, 2),
                FlSpot(11, 1),
              ],
            ),
          ],
          borderData: FlBorderData(
              show: true,
              border: Border.all(color: Color(0xFFFFFFFF), width: 1))),
    );
  }
}

class LineTitiles {
  static getTittleDate() => FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xFF4B4B4B),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'MAR';
            case 5:
              return 'JUN';
            case 8:
              return 'SEP';
          }
          return '';
        },
        margin: -30,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        reservedSize: 38,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xFF4B4B4B),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '₦100K';
            case 3:
              return '₦300K';
            case 5:
              return '₦600K';
          }
          return '';
        },
        margin: 4,
      ));
}
