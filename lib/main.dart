import 'package:fitlog/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlog/screens/login_screen.dart';
import 'package:fitlog/screens/signup_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fitlog/provider/provider.dart';

void main() async {
  await dotenv.load();
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'FitLog App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LogIn(),
        routes: {
          '/logIn': (context) => const LogIn(),
          '/signUp': (context) => const SignUp(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
