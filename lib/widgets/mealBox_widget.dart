import 'package:fitlog/services/main_service.dart';
import 'package:flutter/material.dart';

class MealBox extends StatefulWidget {
  const MealBox({super.key, required this.date, required this.mealType});

  final DateTime date;
  final String mealType;

  @override
  State<MealBox> createState() {
    return _MealBoxState();
  }
}

class _MealBoxState extends State<MealBox> {
  List<String> meals = [];
  String meal = '';

  void _mealInput() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('식단 추가'),
          content: Column(
            children: [
              TextField(
                onChanged: (value) {
                  meal = value;
                },
                decoration: const InputDecoration(
                  hintText: '식단 입력',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                MainService().postMeal(meal, context);
                Navigator.pop(context);
              },
              child: const Text('추가'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          _mealInput();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: Colors.blue),
            const SizedBox(height: 5),
            Text(
              widget.mealType,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  return Text(meals[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
