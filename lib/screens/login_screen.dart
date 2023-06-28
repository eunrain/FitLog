import 'package:flutter/material.dart';
import 'package:fitlog/components/appbar.dart';
import 'package:fitlog/utility/validator.dart';
import 'package:fitlog/services/auth_service.dart';

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || !Validator.isValidEmail(value)) {
                    return '유효한 이메일 형식이 아닙니다';
                  }
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return '비밀번호는 6자 이상입니다';
                  }
                },
                obscureText: true,
              ),
              const SizedBox(height: 25.0),
              TextButton(
                child: const Text('LogIn'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AuthService().postLogin(
                      _emailController.text,
                      _passwordController.text,
                    );
                  }
                },
              ),
              TextButton(
                child: const Text('SignUp'),
                onPressed: () {
                  Navigator.pushNamed(context, '/signUp');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
