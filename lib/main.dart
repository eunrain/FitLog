import 'package:flutter/material.dart';
import 'package:fitlog/screens/login.dart';

void main() => runApp(const FitLogApp());

class FitLogApp extends StatelessWidget {
  const FitLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitLog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogIn(),
    );
  }
}
