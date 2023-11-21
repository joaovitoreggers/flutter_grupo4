
import 'dart:convert';

import 'package:flutter_projeto/models/locacao_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LocacaoRepository {
  Future<bool> gravar(LocacaoModel locacaoModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var uri = "http://erig.dev.br/api/v1/locacao";
    var header = {'Content-Type': 'application/json',
                  'Authorization': 'Bearer $token' 
                 };
    var body = locacaoModel.toJson();
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

  Future<List<LocacaoModel>> buscarLocacoes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final userId = prefs.getInt('userId');
    var uri = 'http://erig.dev.br/api/v1/locacoes/$userId';
    var header = {'Content-Type': 'application/json',
                  'Authorization': 'Bearer $token'
                 };
    try {
      var response = await http.get(Uri.parse(uri), headers: header);
 
      if (response.statusCode != 200){
        throw Exception('Erro ao buscar locações');
      } 
      final locacoesList = jsonDecode(response.body);
      

      final List<LocacaoModel> locacoes = locacoesList.map<LocacaoModel>((locacoesListMap) {
        return LocacaoModel.fromMap(locacoesListMap);
      }).toList();
      
      return locacoes;

    } catch (e) {
       throw Exception('Falha ao tentar conectar ao servidor');
    }
  }
}