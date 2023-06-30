import 'package:fitlog/components/sidemenu.dart';
import 'package:fitlog/widgets/showDialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:fitlog/components/appbar.dart';
import 'package:fitlog/utility/validator.dart';
import 'package:fitlog/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:fitlog/provider/provider.dart';
import 'package:fitlog/screens/home_screen.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() {
    return _LogInState();
  }
}

class _LogInState extends State<LogIn> {
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future login() async {
    if (_formKey.currentState!.validate()) {
      final response = await AuthService().postLogIn(
        _idController.text,
        _passwordController.text,
      );

      if (response != null) {
        final token = response.headers['authorization']?.first ?? '';
        if (!mounted) return;
        Provider.of<AuthProvider>(context, listen: false).getToken(token);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const HomeScreen()));
        return response;
      } else {
        if (!mounted) return;
        const ShowDialog(title: '로그인 실패', content: '아이디와 비밀번호를 확인해주세요.')
            .show(context);
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(
                  labelText: 'ID',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '아이디를 입력해주세요';
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
                onPressed: login,
                child: const Text('LogIn'),
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
