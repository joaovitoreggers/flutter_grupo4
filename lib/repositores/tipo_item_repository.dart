import 'dart:convert';
import 'package:flutter_projeto/models/tipo_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TipoItemRepository {
  Future<List<TipoItemModel>> buscarTiposItens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    
    var uri = 'http://erig.dev.br/api/v1/itensPorTipo/';
    var header = {'content-type': 'application.json',
                  'Authorization': 'Bearer $token'
                  };
try {
      var response = await http.get(Uri.parse(uri), headers: header).timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        throw Exception('Erro ao buscar tipos de itens itens');
      }
      final tiposList = jsonDecode(response.body);

      final List<TipoItemModel> tipositens = tiposList.map<TipoItemModel>((tiposListMap) {
        return TipoItemModel.fromMap(tiposListMap);
      }).toList();

      return tipositens;
    } catch (e) {
      throw Exception('falha ao tentar se conectar ao servidor');
    }
  }
}                  
