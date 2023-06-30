import 'package:fitlog/services/main_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // 클래스를 직접 상속, 단일 상속만 가능
  String _token = '';
  String get token => _token;
  // getter 메서드, 클래스의 속성 값을 가져올 때 사용.
  // 클래스의 속성을 외부에서 직접 접근하는 것을 방지하고, 캡슐화를 유지함

  void getToken(String token) {
    _token = token;
    notifyListeners();
  }
}

class MealProvider with ChangeNotifier {
  List<Map<String, String>> meals = [];

  Future<void> getMeals(BuildContext context) async {
    try {
      final fetchMeals = await MainService().getMeal(context);
      meals = fetchMeals.map<Map<String, String>>((meal) {
        final title = meal['title'] as String;
        final content = meal['content'] as String;
        return {'title': title, 'content': content};
      }).toList();
      notifyListeners();
    } catch (e) {
      print('MealProvider error: $e');
    }
  }
}
