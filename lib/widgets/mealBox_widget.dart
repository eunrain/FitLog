import 'package:flutter/material.dart';
import 'package:fitlog/provider/provider.dart';
import 'package:fitlog/services/main_service.dart';
import 'package:provider/provider.dart';

class MealBox extends StatefulWidget {
  const MealBox({super.key, required this.mealType});

  final String mealType;

  @override
  State<MealBox> createState() {
    return _MealBoxState();
  }
}

class _MealBoxState extends State<MealBox> {
  String meal = '';

  @override
  void initState() {
    super.initState();
    Provider.of<MealProvider>(context, listen: false).getMeals(context);
  }

  void _deleteMeal(mealNum) {
    MainService().deleteMeal(mealNum, context).then((_) {
      Provider.of<MealProvider>(context, listen: false).getMeals(context);
    });
  }

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
                      .getMeals(context);
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
    return Consumer<MealProvider>(
      builder: (context, mealProvider, _) {
        final meals = mealProvider.meals;
        final filterMeals =
            meals.where((meal) => meal['title'] == widget.mealType).toList();

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
                children: filterMeals.isEmpty
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
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 25),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: filterMeals.length,
                                itemBuilder: (context, index) {
                                  final meal = filterMeals[index];
                                  final content = meal['content'];
                                  final mealNum = meal['mealNum'];
                                  return Column(
                                    children: [
                                      Text(
                                        content,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: const Text('edit'),
                                          ),
                                          const SizedBox(width: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              _deleteMeal(mealNum);
                                            },
                                            child: const Text('del'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ]),
          ),
        );
      },
    );
  }
}
