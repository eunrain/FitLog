import 'package:fitlog/provider/provider.dart';
import 'package:fitlog/services/main_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealBox extends StatefulWidget {
  const MealBox({
    Key? key,
    required this.date,
    required this.mealType,
    required this.meals,
  }) : super(key: key);

  final DateTime date;
  final String mealType;
  final List<String> meals;

  @override
  State<MealBox> createState() {
    return _MealBoxState();
  }
}

class _MealBoxState extends State<MealBox> {
  String meal = '';

  void _mealInput() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('식단 추가'),
          content: SizedBox(
            height: 50,
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      meal = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: '식단 입력',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                MainService()
                    .postMeal(meal, widget.mealType, context)
                    .then((_) {
                  Provider.of<MealProvider>(context, listen: false)
                      .getMeals(context); // 데이터가 추가되면 getMeals 호출하여 상태 업데이트
                });
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
          children: widget.meals.isEmpty
              ? [
                  const Icon(Icons.add, color: Colors.blue),
                  const SizedBox(height: 5),
                  Text(
                    widget.mealType,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ]
              : [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.meals.length,
                    itemBuilder: (context, index) {
                      return Text(widget.meals[index]);
                    },
                  ),
                ],
        ),
      ),
    );
  }
}
