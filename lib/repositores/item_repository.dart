import 'dart:convert';

import 'package:flutter_projeto/models/item_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ItemRepository {
  Future<List<ItemModel>> buscarItens(int idTipo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var uri = 'http://erig.dev.br/api/v1/itensPorTipo/$idTipo';
    var header = {'content-type': 'application.json',
                  'Authorization': 'Bearer $token'
                  };

    try {
      var response = await http.get(Uri.parse(uri), headers: header).timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        throw Exception('Erro ao buscar itens');
      }
      final itensList = jsonDecode(response.body);

      final List<ItemModel> itens = itensList.map<ItemModel>((itensListMap) {
        return ItemModel.fromMap(itensListMap);
      }).toList();

      return itens;
    } catch (e) {
      throw Exception('falha ao tentar se conectar ao servidor');
    }
  }
}