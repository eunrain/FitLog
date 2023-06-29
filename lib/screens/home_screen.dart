import 'package:flutter/material.dart';
import 'package:fitlog/widgets/calendar_widget.dart';
import 'package:fitlog/components/appbar.dart';
import 'package:fitlog/components/sidemenu.dart';
import 'package:fitlog/widgets/mealBox_widget.dart';
import 'package:fitlog/services/main_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  // List<String> meals = [];

  // @override
  // void initState() {
  //   super.initState();
  //   fetchMeals();
  // }

  // Future fetchMeals() async {
  //   try {
  //     final List<String> fetchedMeals = await MainService().getMeal();
  //     setState(() {
  //       meals = fetchedMeals;
  //     });
  //   } catch (e) {
  //     print('Failed to fetch meals: $e');
  //   }
  // }

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
                  MealBox(date: DateTime.now(), mealType: '아침'),
                  const SizedBox(height: 20),
                  MealBox(date: DateTime.now(), mealType: '점심'),
                  const SizedBox(height: 20),
                  MealBox(date: DateTime.now(), mealType: '저녁'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
