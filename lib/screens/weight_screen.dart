import 'package:fitlog/components/appbar.dart';
import 'package:fitlog/components/sidemenu.dart';
import 'package:fitlog/widgets/chart_widget.dart';
import 'package:flutter/material.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() {
    return _WeightScreenState();
  }
}

class _WeightScreenState extends State<WeightScreen> {
  List<WeightData> weightDataList = [
    WeightData(DateTime(2023, 6, 1), 70),
    WeightData(DateTime(2023, 6, 2), 69.5),
    WeightData(DateTime(2023, 6, 3), 69),
    WeightData(DateTime(2023, 6, 4), 68.5),
    WeightData(DateTime(2023, 6, 5), 68),
    WeightData(DateTime(2023, 6, 6), 68.2),
    WeightData(DateTime(2023, 6, 7), 68.8),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
            width: 450,
            height: 200,
            child: ChartWidget(weightDataList: weightDataList)),
      ),
    );
  }
}
