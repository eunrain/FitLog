import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                String email = _emailController.text;
                String password = _passwordController.text;
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
