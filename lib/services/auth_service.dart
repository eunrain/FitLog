import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  Future postLogIn(email, password) async {
    final url = '${dotenv.env['API_URL']}/members/login';

    try {
      Response response = await Dio().post(
        url,
        data: {
          'memberName': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        print('success');
      }
      return response;
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future postSignUp(name, email, password) async {
    final url = '${dotenv.env['API_URL']}/members/signup';

    try {
      Response response = await Dio().post(
        url,
        data: {
          "memberName": name,
          "nickName": name,
          "password": password,
          "email": email,
          "birthday": "2023-06-27"
        },
      );
      print(response.statusCode);
      return response;
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
