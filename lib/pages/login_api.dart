import 'dart:convert';

import 'package:Carros/pages/usuario.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';
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
      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);
        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse["error"]);
    } catch (error, exception) {
      print("Erro no login - $error > $exception");
      return ApiResponse.error("Não foi possivel fazer o login!!");
    }
  }
}
