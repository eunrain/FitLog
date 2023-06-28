import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _token = '';
  String get token => _token;
  // getter 메서드, 클래스의 속성 값을 가져올 때 사용.
  // 클래스의 속성을 외부에서 직접 접근하는 것을 방지하고, 캡슐화를 유지함

  void getToken(token) {
    _token = token;
    notifyListeners();
  }
}
