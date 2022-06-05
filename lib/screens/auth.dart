import 'package:clinic_app/components/common/button.dart';
import 'package:clinic_app/services/auth.dart';
import 'package:flutter/material.dart';

import '../components/common/input.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void clearControllers() {
    _emailController.clear();
    _passwordController.clear();
  }

  AuthService _authService = AuthService();

  dynamic user = null;

  Future<dynamic> _signIn() async {
    user = await _authService.signInWithEmailAndPassword(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
    clearControllers();
  }

  Future<dynamic> _signUp() async {
    user = await _authService.createUserWithEmailAndPassword(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
    clearControllers();
  }

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 120, bottom: 80),
        child: Container(
          child: Align(
            child: Container(
              child: Image(
                width: 200,
                image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/8/8e/Heart-image.png',
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget _form(VoidCallback signIn, VoidCallback signUp) {
      return Container(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: Input(
                    controller: _emailController,
                    icon: Icon(Icons.email),
                    hint: 'email'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: Input(
                  controller: _passwordController,
                  icon: Icon(Icons.lock),
                  hint: 'password',
                  obscure: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 50,
                  width: 200,
                  child: Button(label: 'Войти', onPressed: signIn),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 50,
                  width: 200,
                  child: Button(label: "Регистрация", onPressed: signUp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Забыли пароль?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          _logo(),
          _form(_signIn, _signUp),
        ],
      ),
    );
  }
}
