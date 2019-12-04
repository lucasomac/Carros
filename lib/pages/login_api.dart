import 'dart:convert';

import 'package:Carros/pages/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<Usuario> login(String login, String senha) async {
    var url = 'http://carros-springboot.herokuapp.com/api/v2/login';
//    var url = 'http://livrowebservices.com.br/rest/login';

    Map<String, String> headers = {"Content-Type": "aplication/json"};
    Map params = {
      "username": login,
      "password": senha,
    };
    String s = json.encode(params);
    print("> $s");
    var response = await http.post(url, body: s, headers: headers);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);
    final user = Usuario.fromJson(mapResponse);
    return user;
  }
}
