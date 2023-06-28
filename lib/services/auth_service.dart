import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  Future postLogin(email, password) async {
    final url = '${dotenv.env['API_URL']}/members/login';

    try {
      Response response = await Dio().post(
        url,
        data: {
          'memberName': email,
          'password': password,
        },
      );
      print(response.headers);

      if (response.statusCode == 200) {
        print('Login successful');
      } else {
        print('Login failed');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
