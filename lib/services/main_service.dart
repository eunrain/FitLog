import 'package:dio/dio.dart';
import 'package:fitlog/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

class MainService {
  Future postMeal(String meal, String mealType, BuildContext context) async {
    final url = '${dotenv.env['API_URL']}/todos';

    final data = {
      "priority": 1,
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
          return {'title': title, 'content': content};
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
}
