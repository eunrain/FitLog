import 'dart:math';
import 'package:dio/dio.dart';
import 'package:fitlog/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

class MainService {
  Future postMeal(String meal, String mealType, BuildContext context) async {
    final url = '${dotenv.env['API_URL']}/todos';

    final priority = Random().nextInt(10) + 1;

    final data = {
      "priority": priority,
      "title": mealType,
      "subTitle": "부제목",
      "content": meal,
      "checked": true
    };

    final token = Provider.of<AuthProvider>(context, listen: false).token;

    try {
      Response response = await Dio().post(
        url,
        data: data,
        options: Options(headers: {'Authorization': token}),
      );

      if (response.statusCode == 200) {
        print('식단 추가 성공');
      } else {
        print('식단 추가 실패');
      }
    } catch (e) {
      print('postMeal : $e');
    }
  }

  Future getMeal(BuildContext context) async {
    final url = '${dotenv.env['API_URL']}/todos';

    final token = Provider.of<AuthProvider>(context, listen: false).token;

    try {
      Response response = await Dio().get(
        url,
        options: Options(headers: {'Authorization': token}),
      );
      if (response.statusCode == 200) {
        final mealData = response.data as List<dynamic>;
        final meals = mealData.map((meal) {
          final title = meal['title'] as String;
          final content = meal['content'] as String;
          final mealNum = meal['priority'] as int;
          return {'title': title, 'content': content, 'mealNum': mealNum};
        }).toList();
        return meals;
      } else {
        return [];
      }
    } catch (e) {
      print('getMeal : $e');
      return [];
    }
  }

  Future patchMeal(String editMeal, int mealNum, BuildContext context) async {
    final url = '${dotenv.env['API_URL']}/todos/$mealNum';

    final token = Provider.of<AuthProvider>(context, listen: false).token;

    try {
      Response response = await Dio().patch(
        url,
        data: editMeal,
        options: Options(headers: {'Authorization': token}),
      );
      print(response.statusCode);
    } catch (e) {
      print('patchMeal : $e');
    }
  }

  Future deleteMeal(mealNum, BuildContext context) async {
    final url = '${dotenv.env['API_URL']}/todos/$mealNum';

    final token = Provider.of<AuthProvider>(context, listen: false).token;

    try {
      Response response = await Dio().delete(
        url,
        options: Options(headers: {'Authorization': token}),
      );
      print(response.statusCode);
    } catch (e) {
      print('patchMeal : $e');
    }
  }
}
