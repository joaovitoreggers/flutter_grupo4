import 'dart:convert';
import 'package:flutter_projeto/models/pessoa_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PessoaRepository {
  Future<bool> gravar(PessoaModel pessoaModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    
    var uri = "http://erig.dev.br/api/v1/pessoa";
    var header = {'Content-Type': 'application/json',
                  'Authorization': 'Bearer $token' 
                 };
    var body = pessoaModel.toJson();
    try {
      final response = await http.post(Uri.parse(uri), 
        headers: header, body: body); 

    if (response.statusCode != 201) {
      return false;
    }

    return true;

    } catch (e) {
        throw Exception('Falha ao tentar conectar ao servidor');
    }
  }

  Future<List<PessoaModel>> buscarPessoas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
   
    var uri = 'http://erig.dev.br/api/v1/beneficiarios';
    var header = {'Content-Type': 'application/json',
                  'Authorization': 'Bearer $token'
                 };
    try {
      var response = await http.get(Uri.parse(uri), headers: header);
 
      if (response.statusCode != 200){
        throw Exception('Erro ao buscar beneficiários');
      } 
      final pessoasList = jsonDecode(response.body);
      

      final List<PessoaModel> pessoas = pessoasList.map<PessoaModel>((pessoasListMap) {
        return PessoaModel.fromMap(pessoasListMap);
      }).toList();
      
      return pessoas;

    } catch (e) {
       throw Exception('Falha ao tentar conectar ao servidor');
}
}
}