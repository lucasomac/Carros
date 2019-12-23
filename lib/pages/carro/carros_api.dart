import 'dart:convert' as convert;

import 'package:Carros/pages/carro/carro.dart';
import 'package:http/http.dart' as http;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    var url =
        'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo';
    var response = await http.get(url);
    String json = response.body;
    print(response.statusCode);
    List list = convert.json.decode(json);
    List<Carro> carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();
    return carros;
  }
}
