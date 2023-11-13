import 'package:mobx/mobx.dart';
import 'package:flutter_projeto/helpers/extensions.dart';
import 'package:flutter_projeto/models/register_model.dart';
import 'package:flutter_projeto/repositores/register_repositorie.dart';
part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  @observable
  String? name;

  @action
  void setName(String value) => name = value;
  
  @computed
  bool get nameValid => name!= null && name!.isNotEmpty && name!.length >= 6;


  String? get nameError {
    if (name == null || nameValid) {
      return null;
    } else if(name == null || name!.isEmpty){
        return 'Campo Obrigatório';
    } else{
        return 'Nome Inválido';
    }
  }
  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;
  
  @computed
  bool get emailValid => email!= null && email!.isEmailValid();


  String? get emailError {
    if (email == null || emailValid) {
      return null;
    } else if(email == null || email!.isEmpty){
        return 'Campo Obrigatório';
    } else{
        return 'E-mail Inválido';
    }
  }
   @observable
  String? password;

  @action
  void setPassword(String value) => password = value;
  
  @computed
  bool get passwordValid => password!.isNotEmpty && password!.length == 6;

  String? get passwordError {
    if (password == null || passwordValid) {
      return null;
    } else if(password!.isEmpty){
        return 'Campo Obrigatório';
    } else{
        return 'A senha deve ter 6 caracteres';
    }
  }
   @observable
  String? password2;

  @action
  void setPassword2(String value) => password2 = value;
  
  @computed
  bool get password2Valid => password2!.isNotEmpty && password2! == password!;

  String? get password2Error {
    if (password2 == null || password2Valid) {
      return null;
    } else{
        return 'Senhas não coincidem';
    }
  }
  @computed
  bool get isFormValid => nameValid && emailValid && passwordValid && password2Valid;

  @observable
  String? notification;

  @observable
  bool loading = false;

  @action
  Future<bool> register() async{
    loading = true;
    try {
      var register = RegisterModel(name: name, email: email, password: password);
      notification = 'Aguarde...';
      final response = await RegisterRepository().register(register);
      if (response) {
         notification = 'Usuário cadastrado com sucesso';
         await Future.delayed(Duration(seconds: 1));
         notification = null;
         loading = false;
         return true;
      } else{
         notification = 'Erro ao tentar cadastrar usuário, verifique';
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
  }
}

