import 'dart:async';

import 'package:Carros/pages/api_response.dart';
import 'package:Carros/pages/login/login_api.dart';
import 'package:Carros/pages/login/usuario.dart';
import 'package:Carros/utils/alert.dart';
import 'package:Carros/utils/nav.dart';
import 'package:Carros/widgets/AppButton.dart';
import 'package:Carros/widgets/AppText.dart';
import 'package:flutter/material.dart';

import '../carro/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _streamController = StreamController<bool>();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
    Future<Usuario> future = Usuario.get();
    future.then((Usuario user) {
      if (user != null) {
        setState(() {
          push(context, HomePage(), replace: true);
//          _tLogin.text = user.login;
        });
      }
    });
  }

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
            AppText("Login", "Digite o login",
                controller: _tLogin,
                validator: _validateLogin,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusSenha),
            SizedBox(height: 10),
            AppText("Senha", "Digite a senha",
                controller: _tSenha,
                obscureText: true,
                validator: _validateSenha,
                keyboardType: TextInputType.number,
                focusNode: _focusSenha),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<bool>(
                stream: _streamController.stream,
                initialData: false,
                builder: (context, snapshot) {
                  return AppButon(
                    "Login",
                    onPressed: _onClickLogin,
                    showProgress: snapshot.data,
                  );
                }),
          ],
        ),
      ),
    );
  }

  void _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");

    _streamController.add(true);
    ApiResponse response = await LoginApi.login(login, senha);
    if (response.ok) {
      Usuario user = response.result;
      print("$user");
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
    _streamController.add(false);
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }
    if (text.length < 3) {
      return "A senha precisa ter pelo menos 3 números";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }
}
