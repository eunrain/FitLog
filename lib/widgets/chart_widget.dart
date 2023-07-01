import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatelessWidget {
  final List<WeightData> weightDataList;

  const ChartWidget({Key? key, required this.weightDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(
        minorTickLines: const MinorTickLines(size: 0), // 보조 눈금선 크기 0으로 설정
      ),
      primaryYAxis: NumericAxis(
        majorTickLines: const MajorTickLines(size: 0), // 주요 눈금선 크기 0으로 설정
        majorGridLines:
            const MajorGridLines(color: Colors.transparent), // 배경 눈금선 투명하게 설정
        labelStyle: const TextStyle(color: Colors.transparent), // 눈금선 투명하게 설정
      ),
      series: <ChartSeries>[
        LineSeries<WeightData, DateTime>(
          dataSource: weightDataList,
          xValueMapper: (WeightData weightData, _) => weightData.date,
          yValueMapper: (WeightData weightData, _) => weightData.weight,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true, // 데이터 레이블 표시
            labelAlignment: ChartDataLabelAlignment.top, // 레이블 위치 설정
          ),
          markerSettings: const MarkerSettings(
            isVisible: true,
            color: Colors.black,
          ),
          color: Colors.black,
        ),
      ],
    );
  }
}

class WeightData {
  final DateTime date;
  final double weight;

  WeightData(this.date, this.weight);
}
