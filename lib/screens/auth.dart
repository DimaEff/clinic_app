import 'package:clinic_app/components/common/button.dart';
import 'package:clinic_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/common/input.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _snilsController = TextEditingController();
  TextEditingController _passportController = TextEditingController();

  bool _registerMode = false;

  void _switchMode() {
    setState(() {
      _registerMode = !_registerMode;
    });
  }

  void clearControllers() {
    _emailController.clear();
    _nameController.clear();
    _passwordController.clear();
    _snilsController.clear();
    _passportController.clear();
  }

  void _checkSignInFields() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Заполнены не все поля',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      throw Error();
    }
  }

  void _checkSignUpFields() {
    _checkSignInFields();
    if (_nameController.text.isEmpty ||
        _snilsController.text.isEmpty ||
        _passportController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Заполнены не все поля',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      throw Error();
    }
  }

  Future<void> _forgotPassword() async {
    await _authService.forgotPassword(_emailController.text.trim());
    clearControllers();
  }

  void _forgotPasswordShowDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Восстановить пароль'),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: Input(
                    controller: _emailController,
                    icon: Icon(Icons.email),
                    hint: 'email'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 50,
                  width: _registerMode ? 250 : 200,
                  child: Button(
                    label: 'Отправить код восстановления',
                    onPressed: _forgotPassword,
                  ),
                ),
              ),
            ],
          );
        });
  }

  AuthService _authService = AuthService();
  dynamic user;

  Future<void> _signIn() async {
    if (!_registerMode) {
      _checkSignInFields();
      user = await _authService.signInWithEmailAndPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      clearControllers();
    } else {
      _switchMode();
    }
  }

  Future<void> _signUp() async {
    if (_registerMode) {
      _checkSignUpFields();
      user = await _authService.createUserWithEmailAndPassword(
        _emailController.text.trim(),
        _nameController.text.trim(),
        _passwordController.text.trim(),
        _snilsController.text.trim(),
        _passportController.text.trim(),
      );
      clearControllers();
    } else {
      _switchMode();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return !_registerMode
          ? Padding(
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
            )
          : SizedBox(height: 100);
    }

    List<Widget> _loginInputs = [
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
    ];

    List<Widget> _registerInputs = [
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
          controller: _nameController,
          icon: Icon(Icons.account_circle),
          hint: 'name',
        ),
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
        padding: EdgeInsets.only(bottom: 20, top: 10),
        child: Input(
          controller: _snilsController,
          icon: Icon(Icons.margin_rounded),
          hint: 'snils',
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 20, top: 10),
        child: Input(
          controller: _passportController,
          icon: Icon(Icons.perm_contact_cal_rounded),
          hint: 'passport',
        ),
      ),
    ];

    List<Widget> fields = _registerMode ? _registerInputs : _loginInputs;

    Widget _form(VoidCallback signIn, VoidCallback signUp) {
      return Container(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              ...fields,
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 50,
                  width: 200,
                  child: Button(
                      label: _registerMode ? 'Вход' : 'Войти',
                      onPressed: signIn),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 50,
                  width: _registerMode ? 250 : 200,
                  child: Button(
                      label:
                          _registerMode ? 'Зарегестрироваться' : 'Регистрация',
                      onPressed: signUp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: GestureDetector(
                    onTap: _forgotPasswordShowDialog,
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
