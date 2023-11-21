
import 'package:mobx/mobx.dart';
import 'package:flutter_projeto/models/locacao_model.dart';
import 'package:flutter_projeto/repositores/locacao_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'locacao_store.g.dart';

class LocacaoStore = LocacaoStoreBase with _$LocacaoStore;

abstract class LocacaoStoreBase with Store {
  @observable
  int? id;

  @action
  void setId(int value) => id = value;

  @observable
  int? idItem;

  @action
  void setIdItem(int value) => idItem = value;

  @computed
  bool get idItemValid => idItem != null && idItem != 0;

  @observable
  int? idPessoa;

  @action
  void setIdPessoa(int value) => idPessoa = value;

  @computed
  bool get idPessoaValid => idPessoa != null && idPessoa != 0;

  @observable
  String? observacao = '';

  @action
  void setObservacao(String value) => observacao = value;

  @computed
  bool get isFormValid => idItemValid && idPessoaValid;

  @observable
  String? notification;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  DateTime? dataReserva;

  @action
  Future<bool> gravar() async {
    loading = true;

    dataReserva = DateTime.now();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');

    try {
      var locacao = LocacaoModel(
        idItem: idItem,
        idPessoa: idPessoa,
        observacao: observacao,
        nomeBeneficiario: 'Disponível no cadasro',
        dataReserva: dataReserva.toString(),
        idUser: userId,
      );

      notification = 'aguarde...';
      final response = await LocacaoRepository().gravar(locacao);
      if (response) {
        notification = 'reserva efetuada com sucesso';
        await Future.delayed(Duration(seconds: 3));
        notification = null;
        loading = false;
        return true;
      } else {
        notification = 'Erro ao tentar fazer a reserva, verifique';
        await Future.delayed(Duration(seconds: 1));
        notification = null;
        loading = false;
      }
    } catch (e) {
      notification = 'Não foi possível conectar';
      await Future.delayed(Duration(seconds: 1));
      notification = null;
      loading = false;
      return false;
    }

    return false; // Adicionei este retorno para cobrir todos os casos
  }
}
