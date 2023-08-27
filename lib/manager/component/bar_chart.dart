import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class bar_chart extends StatefulWidget {
  const bar_chart({super.key});

  @override
  State<bar_chart> createState() => _bar_chartState();
}

class _bar_chartState extends State<bar_chart> {
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();

    // Make _isLoaded true after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: LineChart(
        mainData(),
        swapAnimationDuration: const Duration(milliseconds: 600),
        swapAnimationCurve: Curves.linear,
      ),
    );
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
        show: true,
        horizontalInterval: 1.6,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            dashArray: [3, 3],
            color: const Color(0xff37434d).withOpacity(0.2),
            strokeWidth: 2,
          );
        },
        drawVerticalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 11),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'JAN';
              case 3:
                return 'MAR';
              case 6:
                return 'JUN';
              case 9:
                return 'SEPT';
              case 12:
                return 'DEC';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 2:
                return '50k';
              case 3:
                return '1L';
              case 4:
                return '2L';
              case 5:
                return '4L';
            }
            return '';
          },
          reservedSize: 25,
          margin: 12,
        ),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: _isLoaded
              ? [
                  const FlSpot(0, 3),
                  const FlSpot(2.4, 2),
                  const FlSpot(4.4, 3),
                  const FlSpot(6.4, 3.1),
                  const FlSpot(8, 4),
                  const FlSpot(9.5, 4),
                  const FlSpot(11, 5),
                ]
              : [
                  const FlSpot(0, 0),
                  const FlSpot(2.4, 0),
                  const FlSpot(4.4, 0),
                  const FlSpot(6.4, 0),
                  const FlSpot(7.5, 0),
                  const FlSpot(9.5, 0),
                  const FlSpot(11, 0)
                ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradientFrom: const Offset(0, 0),
            gradientTo: const Offset(0, 1),
            colors: [
              const Color(0xff02d39a).withOpacity(0.4),
              const Color(0xff02d39a).withOpacity(0),
            ],
          ),
        ),
      ],
    );
  }
}
