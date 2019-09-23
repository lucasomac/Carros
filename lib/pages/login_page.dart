import 'package:Carros/widgets/app_button.dart';
import 'package:Carros/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tPassword = TextEditingController();

  final _focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText("Login", "Insira seu login",
                controller: _tLogin,
                validator: _validateLogin,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusPassword),
            SizedBox(
              height: 16,
            ),
            AppText(
              "Password",
              "Insira seu password",
              controller: _tPassword,
              obscureText: true,
              validator: _validatePassword,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              focusNode: _focusPassword,
            ),
            AppButon("Login", onPressed: _onClickLogin),
          ],
        ),
      ),
    );
  }

  String _validatePassword(String text) {
    if (text.isEmpty || text.length < 3) {
      return "Password can't blank and length can't minor 3!";
    } else {
      return null;
    }
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Login can't blank";
    } else {
      return null;
    }
  }

  _onClickLogin() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    String login = _tLogin.text;
    String password = _tPassword.text;
    print("Login: $login, Password: $password");
  }
}
