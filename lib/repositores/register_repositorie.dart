import 'package:flutter_projeto/models/register_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class RegisterRepository {

  Future<bool> register(RegisterModel registerModel) async{
    var uri = "https://erig.dev.br/api/register";
    var header = {'content-type': 'aplication/json'};
    var body = registerModel.toJson();
    try {
      final response = await http.post(Uri.parse(uri),
        headers: header, body: body);

      if (response.statusCode != 200) {
        //print('error);
        return false;
      }

        return true;
    }catch(e) {
      throw Exception('falha ao tentar se conectar com o servidor');
    }
  }
}