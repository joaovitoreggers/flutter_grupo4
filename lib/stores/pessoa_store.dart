import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:flutter_projeto/helpers/extensions.dart';
import 'package:flutter_projeto/models/pessoa_model.dart';
import 'package:flutter_projeto/repositores/pessoa_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'pessoa_store.g.dart';

class PessoaStore = PessoaStoreBase with _$PessoaStore;

abstract class PessoaStoreBase with Store {

  @observable
  String? id;

  @action
  void setId(String value) => id = value;

  @observable
  String? nome;

  @action
  void setNome(String value) => nome = value;

  @computed
  bool get nomeValid => nome!= null && nome!.isNotEmpty && nome!.length >= 6;

  String? get nomeError {
    if (nome == null || nomeValid) {
      return null;
    } else if (nome == null || nome!.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Nome inválido';
    }
  }

  @observable
  String? doc;

  @action
  void setDoc(String value) => doc = value;

  @computed
  bool get docValid => doc!= null && doc!.isNotEmpty && doc!.length >= 6;

  String? get docError {
    if (doc == null || docValid) {
      return null;
    } else if (doc == null || doc!.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Documento inválido';
    }
  }

  @observable
  String? fone1;

  @action
  void setFone1(String value) => fone1 = value;

  @computed
  bool get fone1Valid => fone1 != null && fone1!.isNotEmpty && fone1!.length > 14;
  String? get fone1Error {
    if (fone1 == null || fone1Valid) {
      return null;
    } else if (fone1!.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Celular inválido';
    }
  }

  @observable
  String? fone2;

  @action
  void setFone2(String value) => fone2 = value;

  @observable
  String? endereco;

  @action
  void setEndereco(String value) => endereco = value;

  @computed
  bool get enderecoValid => endereco !=null && endereco!.isNotEmpty && endereco!.length > 4;
  String? get enderecoError {
    if (endereco == null || enderecoValid) {
      return null;
    } else if (endereco!.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Endereço inválido';
    }
  }

  @observable
  String? uf;

  @action
  void setUf(String value) => uf = value;

  @computed
  bool get ufValid => uf != null && uf!.isNotEmpty && uf!.length == 2;
  String? get ufError {
    if (uf == null || ufValid) {
      return null;
    } else if (uf!.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'UF inválida';
    }
  }

  @observable
  String? municipio;

  @action
  void setMunicipio(String value) => municipio = value;

   @computed
  bool get municipioValid => municipio != null && municipio!.isNotEmpty && municipio!.length > 2;
  String? get municipioError {
    if (municipio == null || municipioValid) {
      return null;
    } else if (municipio!.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Municipio inválido';
    }
  }

  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  String? get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email!.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  @observable
  String? localTrabalho;

  @action
  void setLocalTrabalho(String value) => localTrabalho = value;

  @computed
  bool get localTrabalhoValid => localTrabalho != null && localTrabalho!.isNotEmpty && localTrabalho!.length >= 4;
  String? get localTrabalhoError {
    if (localTrabalho == null || localTrabalhoValid) {
      return null;
    } else if (localTrabalho!.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Local trabalho inválido';
    }
  }

  @computed
  bool get isFormValid  => nomeValid && 
                           docValid &&
                           enderecoValid &&
                           fone1Valid &&
                           municipioValid && 
                           ufValid && 
                           localTrabalhoValid && 
                           emailValid;

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
    final userId = prefs.getInt('userId');
    try {
      var pessoa = PessoaModel(nome: nome, 
                               doc: doc, 
                               endereco: endereco, 
                               fone1: fone1, 
                               fone2: fone2, 
                               municipio: municipio, 
                               uf: uf, 
                               email: email, 
                               localTrabalho: localTrabalho, 
                               beneficiario: 1, 
                               idUser: userId);
      notification = 'Aguarde...';
      final response = await PessoaRepository().gravar(pessoa);      
      if(response) {
        notification = 'Pessoa cadastrada com sucesso';
        await Future.delayed(Duration(seconds: 3));
        notification = null;
        loading = false; 
        return true;
      } else {
        notification = 'Erro ao tentar cadastrar pessoa, verifique';
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

  @observable
  List<PessoaModel> pessoas = [];

  @action
  Future<void> buscarPessoas() async {
    pessoas = [];
    pessoas = await PessoaRepository().buscarPessoas();
  }

  Future<void> mostrarInfo(String info) async {
    loading = true;
    notification = info;
    await Future.delayed(Duration(seconds: 2));
    notification = null;
    loading = false; 
  }
}
