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
            _text("Login", "Insira seu login",
                controller: _tLogin,
                validator: _validateLogin,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusPassword),
            SizedBox(
              height: 16,
            ),
            _text(
              "Password",
              "Insira seu password",
              controller: _tPassword,
              obscureText: true,
              validator: _validatePassword,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              focusNode: _focusPassword,
            ),
            _button("Login", _onClickLogin),
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

  _text(String label,
      String hint, {
        bool obscureText = false,
        TextEditingController controller,
        FormFieldValidator<String> validator,
        TextInputType keyboardType,
        TextInputAction textInputAction,
        FocusNode focusNode,
        FocusNode nextFocus,
      }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(_focusPassword);
        }
      },
      style: TextStyle(color: Colors.black54),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 25, color: Colors.black),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 15, color: Colors.black12),
      ),
    );
  }

  _button(String text, Function onPressed) {
    return Container(
      height: 46,
      margin: EdgeInsets.only(top: 8),
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        color: Colors.pinkAccent,
        onPressed: onPressed,
      ),
    );
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
