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
  List<String> meals = [];

  Future getMeals(BuildContext context) async {
    try {
      final fetchMeals = await MainService().getMeal(context);
      meals = fetchMeals ?? []; // 가져온 식단 데이터로 상태 업데이트
      notifyListeners(); // 상태 변경을 감지하고 리스너에 알림
    } catch (e) {
      print('Failed to fetch meal: $e');
    }
  }
}
