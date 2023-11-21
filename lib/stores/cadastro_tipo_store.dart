import 'package:flutter_projeto/models/tipo_item_model.dart';
import 'package:flutter_projeto/repositores/tipo_item_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'cadastro_tipo_store.g.dart';

class TipoItemStore = TipoItemStoreBase with _$TipoItemStore;

abstract class TipoItemStoreBase with Store {

@observable
  int? id;

  @action
  void setId(int value) => id = value;

  @observable
  String? descricao;

  @action
  void setDescricao(String value) => descricao = value;

  @computed
  bool get descricaoValid => descricao!= null && descricao!.isNotEmpty && descricao!.length >= 5;

  String? get descricaoError {
    if (descricao == null || descricaoValid) {
      return null;
    } else if (descricao == null || descricao!.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Descrição inválida';
    }
  }

  @observable
  int prazoDevolucao = 0;
  @computed
  bool get prazoDevolucaoValid => prazoDevolucao >= 120;

  String? get prazoDevolucaoError {
    if (prazoDevolucaoValid) {
      return null;
    } else if (prazoDevolucao == 0) {
      return 'Campo Obrigatório';  
    } else {
      return 'Valor inválido';
    }
  }

  @computed
  bool get isFormValid  => descricaoValid && 
                           prazoDevolucaoValid;

  @action
  void setPrazoDevolucao(int value) => prazoDevolucao = value;

@observable
  String? notification;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) =>loading = value; 

  @action
  Future<bool> gravar() async {
    loading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var tipo = TipoItemModel(descricao: descricao, prazoDevolucao: prazoDevolucao);
      notification = 'Aguarde...';
      final response = await TipoItemRepository().gravar(tipo);      
      if(response) {
        notification = 'Tipo Item cadastrado com sucesso';
        await Future.delayed(Duration(seconds: 3));
        notification = null;
        loading = false; 
        return true;
      } else {
        notification = 'Erro ao tentar tipo de Item, verifique';
        await Future.delayed(Duration(seconds: 1));
        notification = null;
        loading = false; 
        return false;
      }
    } catch (e) {
      notification = 'Não foi possível conectar';
      await Future.delayed(Duration(seconds: 1));
      notification = null;
      loading = false; 
      return false;
    }    
  }

  Future<void> mostrarInfo(String info) async {
    loading = true;
    notification = info;
    await Future.delayed(Duration(seconds: 2));
    notification = null;
    loading = false;
}

}