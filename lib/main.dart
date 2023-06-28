import 'package:flutter/material.dart';
import 'package:fitlog/screens/login_screen.dart';
import 'package:fitlog/screens/signup_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitLog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogIn(),
      routes: {
        '/logIn': (context) => const LogIn(),
        '/signUp': (context) => const SignUp(),
      },
    );
  }
}
