import 'package:flutter/material.dart';
import 'package:fitlog/widgets/calendar_widget.dart';
import 'package:fitlog/components/appbar.dart';
import 'package:fitlog/components/sidemenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<DateTime, List<String>> _mealPlan = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CalendarWidget(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '오늘의 식사',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _mealBox(DateTime.now(), '아침'),
                  const SizedBox(height: 20),
                  _mealBox(DateTime.now(), '점심'),
                  const SizedBox(height: 20),
                  _mealBox(DateTime.now(), '저녁'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mealBox(DateTime date, String mealType) {
    final meals = _mealPlan[date] ?? [];

    return Container(
      width: 1000,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          _mealInput(date, mealType);
        },
        child: meals.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check, color: Colors.green),
                  const SizedBox(height: 4),
                  Text(
                    mealType,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            : const Icon(Icons.add, color: Colors.blue),
      ),
    );
  }

  void _mealInput(DateTime date, String mealType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String meal = '';

        return AlertDialog(
          title: const Text('식단 추가'),
          content: TextField(
            onChanged: (value) {
              meal = value;
            },
            decoration: const InputDecoration(
              hintText: '식단 입력',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('추가'),
            ),
          ],
        );
      },
    );
  }
}
