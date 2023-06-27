import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() {
    return _LogInState();
  }
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    String url = 'http://test-api.sparta99.shop/api/members/login';

    try {
      Response response = await Dio().post(
        url,
        data: {'memberName': email, 'password': password},
      );

      if (response.statusCode == 200) {
        print('Login successful');
      } else {
        print('login failed');
      }
    } catch (e) {
      print('An error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FitLog',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            TextButton(
              child: const Text('LogIn'),
              onPressed: () {
                login();
              },
            ),
            TextButton(
              child: const Text('SignUp'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
