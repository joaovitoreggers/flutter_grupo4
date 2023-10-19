import 'package:flutter_projeto/helpers/extensions.dart';
import 'package:flutter_projeto/models/login_model.dart';
import 'package:flutter_projeto/repositores/login_repositorie.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
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
  String? password;
  @action
  void setPassword(String value) => password = value;
  @computed
  bool get passwordValid => password!.isNotEmpty && password!.length == 6;
  String? get passwordError {
    if (password == null || passwordValid) {
      return null;
    } else if (password!.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'A Senha deve ter 6 caracteres';
    }
  }

  @computed
  bool get isFormValid  => emailValid && passwordValid;

  @observable
  String? notification;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) =>loading = value; 

  @action
  Future<bool> login() async {
    loading = true;
    try {
      var login = LoginModel(email: email, password: password);
      notification = 'Conectando...aguarde';
      final response = await LoginRepository().login(login);      
      if(response) {
        notification = 'Login efetuado com sucesso';
        await Future.delayed(Duration(seconds: 1));
        notification = null;
        loading = false; 
        return true;
      } else {
        notification = 'Login não autorizado';
        await Future.delayed(Duration(seconds: 1));
        notification = null;
        loading = false; 
        return false;
      }
    } catch (e) {
      notification = 'Erro ao tentar fazer login';
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