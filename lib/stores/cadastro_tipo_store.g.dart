// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_tipo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TipoItemStore on TipoItemStoreBase, Store {
  Computed<bool>? _$descricaoValidComputed;

  @override
  bool get descricaoValid =>
      (_$descricaoValidComputed ??= Computed<bool>(() => super.descricaoValid,
              name: 'TipoItemStoreBase.descricaoValid'))
          .value;
  Computed<bool>? _$prazoDevolucaoValidComputed;

  @override
  bool get prazoDevolucaoValid => (_$prazoDevolucaoValidComputed ??=
          Computed<bool>(() => super.prazoDevolucaoValid,
              name: 'TipoItemStoreBase.prazoDevolucaoValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'TipoItemStoreBase.isFormValid'))
          .value;

  late final _$idAtom = Atom(name: 'TipoItemStoreBase.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$descricaoAtom =
      Atom(name: 'TipoItemStoreBase.descricao', context: context);

  @override
  String? get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String? value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  late final _$prazoDevolucaoAtom =
      Atom(name: 'TipoItemStoreBase.prazoDevolucao', context: context);

  @override
  int get prazoDevolucao {
    _$prazoDevolucaoAtom.reportRead();
    return super.prazoDevolucao;
  }

  @override
  set prazoDevolucao(int value) {
    _$prazoDevolucaoAtom.reportWrite(value, super.prazoDevolucao, () {
      super.prazoDevolucao = value;
    });
  }

  late final _$notificationAtom =
      Atom(name: 'TipoItemStoreBase.notification', context: context);

  @override
  String? get notification {
    _$notificationAtom.reportRead();
    return super.notification;
  }

  @override
  set notification(String? value) {
    _$notificationAtom.reportWrite(value, super.notification, () {
      super.notification = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'TipoItemStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$gravarAsyncAction =
      AsyncAction('TipoItemStoreBase.gravar', context: context);

  @override
  Future<bool> gravar() {
    return _$gravarAsyncAction.run(() => super.gravar());
  }

  late final _$TipoItemStoreBaseActionController =
      ActionController(name: 'TipoItemStoreBase', context: context);

  @override
  void setId(int value) {
    final _$actionInfo = _$TipoItemStoreBaseActionController.startAction(
        name: 'TipoItemStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$TipoItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricao(String value) {
    final _$actionInfo = _$TipoItemStoreBaseActionController.startAction(
        name: 'TipoItemStoreBase.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$TipoItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrazoDevolucao(int value) {
    final _$actionInfo = _$TipoItemStoreBaseActionController.startAction(
        name: 'TipoItemStoreBase.setPrazoDevolucao');
    try {
      return super.setPrazoDevolucao(value);
    } finally {
      _$TipoItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$TipoItemStoreBaseActionController.startAction(
        name: 'TipoItemStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$TipoItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
descricao: ${descricao},
prazoDevolucao: ${prazoDevolucao},
notification: ${notification},
loading: ${loading},
descricaoValid: ${descricaoValid},
prazoDevolucaoValid: ${prazoDevolucaoValid},
isFormValid: ${isFormValid}
    ''';
  }
}
