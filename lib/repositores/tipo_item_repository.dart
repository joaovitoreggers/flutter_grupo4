import 'dart:convert';

import 'package:flutter_projeto/models/tipo_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TipoItemRepository {
  Future<List<TipoItemModel>> buscarTiposItens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
   
    var uri = 'http://erig.dev.br/api/v1/tipoItem/';
    var header = {'Content-Type': 'application/json',
                  'Authorization': 'Bearer $token'
                 };
    try {
      var response = await http.get(Uri.parse(uri), headers: header);
 
      if (response.statusCode != 200){
        throw Exception('Erro ao buscar tipos de Itens');
      } 
      final tiposList = jsonDecode(response.body);
      

      final List<TipoItemModel> tiposItens = tiposList.map<TipoItemModel>((tiposListMap) {
        return TipoItemModel.fromMap(tiposListMap);
      }).toList();
      
      return tiposItens;

    } catch (e) {
       throw Exception('Falha ao tentar conectar ao servidor');
    }
  }

  Future<bool> gravar(TipoItemModel tipoItemModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    
    var uri = "http://erig.dev.br/api/v1/tipoItem";
    var header = {'Content-Type': 'application/json',
                  'Authorization': 'Bearer $token' 
                 };
    var body = tipoItemModel.toJson();
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
}