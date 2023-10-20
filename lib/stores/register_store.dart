import 'package:mobx/mobx.dart';
import 'package:flutter_projeto/models/register_model.dart';
import 'package:flutter_projeto/helpers/extensions.dart';
import 'package:flutter_projeto/models/login_model.dart';
import 'package:flutter_projeto/repositores/login_repositorie.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  @observable
  String? name;

  @action
  String setName(String value) => name = value;

  @computed
  bool get nameValid => name!= null && name!.isNotEmpty && name!.length >= 6;

  String? get nameError{
    if (name == null || name!.isEmpty) {
      return null;
    } else if (name == null || name!.isEmpty) {
      return 'campo obrigatório';
    } else {
      return 'nome inválido';
    }
  }
}