import 'package:fitlog/widgets/mealBox_widget.dart';
import 'package:flutter/material.dart';
import 'package:fitlog/provider/provider.dart';
import 'package:fitlog/widgets/calendar_widget.dart';
import 'package:fitlog/components/appbar.dart';
import 'package:fitlog/components/sidemenu.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MealProvider>(context, listen: false).getMeals(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Consumer<MealProvider>(
          builder: (context, mealProvider, _) {
            return const Column(
              children: [
                CalendarWidget(),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '오늘의 식사',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      MealBox(mealType: '아침'),
                      SizedBox(height: 20),
                      MealBox(mealType: '점심'),
                      SizedBox(height: 20),
                      MealBox(mealType: '저녁'),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
