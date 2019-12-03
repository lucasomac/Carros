import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            _text("Login", "Digite seu login", controller: _tLogin,
                validator: (String text) {
                  if (text.isEmpty) {
                    return "Digite o login";
                  }
                  // return null;
                }),
            SizedBox(
              height: 10,
            ),
            _text("Senha", "Digite a senha",
                password: true, controller: _tSenha, validator: (String text) {
                  if (text.isEmpty) {
                    return "Digite o login";
                  }
                  // return null;
                }),
            SizedBox(
              height: 20,
            ),
            _button("Login", _onClickLogin()),
          ],
        ),
      ),
    );
  }

  _button(String text, Function onPressed) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.amberAccent,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  _text(String label,
      String hint, {
        bool password = false,
        TextEditingController controller,
        FormFieldValidator<String> validator,
      }) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      style: TextStyle(
        fontSize: 25,
        color: Colors.amber,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
          color: Colors.grey,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  _onClickLogin() {
    bool formOk = _formKey.currentState.validate();
    if (!formOk) {
      return;
    }
    String login = _tLogin.text;
    String senha = _tSenha.text;
    print("Login: $login, Senha: $senha");
  }
}
