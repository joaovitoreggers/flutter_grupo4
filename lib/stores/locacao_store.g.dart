// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocacaoStore on LocacaoStoreBase, Store {
  Computed<bool>? _$idItemValidComputed;

  @override
  bool get idItemValid =>
      (_$idItemValidComputed ??= Computed<bool>(() => super.idItemValid,
              name: 'LocacaoStoreBase.idItemValid'))
          .value;
  Computed<bool>? _$idPessoaValidComputed;

  @override
  bool get idPessoaValid =>
      (_$idPessoaValidComputed ??= Computed<bool>(() => super.idPessoaValid,
              name: 'LocacaoStoreBase.idPessoaValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'LocacaoStoreBase.isFormValid'))
          .value;

  late final _$idAtom = Atom(name: 'LocacaoStoreBase.id', context: context);

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

  late final _$idItemAtom =
      Atom(name: 'LocacaoStoreBase.idItem', context: context);

  @override
  int? get idItem {
    _$idItemAtom.reportRead();
    return super.idItem;
  }

  @override
  set idItem(int? value) {
    _$idItemAtom.reportWrite(value, super.idItem, () {
      super.idItem = value;
    });
  }

  late final _$idPessoaAtom =
      Atom(name: 'LocacaoStoreBase.idPessoa', context: context);

  @override
  int? get idPessoa {
    _$idPessoaAtom.reportRead();
    return super.idPessoa;
  }

  @override
  set idPessoa(int? value) {
    _$idPessoaAtom.reportWrite(value, super.idPessoa, () {
      super.idPessoa = value;
    });
  }

  late final _$observacaoAtom =
      Atom(name: 'LocacaoStoreBase.observacao', context: context);

  @override
  String? get observacao {
    _$observacaoAtom.reportRead();
    return super.observacao;
  }

  @override
  set observacao(String? value) {
    _$observacaoAtom.reportWrite(value, super.observacao, () {
      super.observacao = value;
    });
  }

  late final _$notificationAtom =
      Atom(name: 'LocacaoStoreBase.notification', context: context);

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
      Atom(name: 'LocacaoStoreBase.loading', context: context);

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

  late final _$dataReservaAtom =
      Atom(name: 'LocacaoStoreBase.dataReserva', context: context);

  @override
  DateTime? get dataReserva {
    _$dataReservaAtom.reportRead();
    return super.dataReserva;
  }

  @override
  set dataReserva(DateTime? value) {
    _$dataReservaAtom.reportWrite(value, super.dataReserva, () {
      super.dataReserva = value;
    });
  }

  late final _$gravarAsyncAction =
      AsyncAction('LocacaoStoreBase.gravar', context: context);

  @override
  Future<bool> gravar() {
    return _$gravarAsyncAction.run(() => super.gravar());
  }

  late final _$LocacaoStoreBaseActionController =
      ActionController(name: 'LocacaoStoreBase', context: context);

  @override
  void setId(int value) {
    final _$actionInfo = _$LocacaoStoreBaseActionController.startAction(
        name: 'LocacaoStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$LocacaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdItem(int value) {
    final _$actionInfo = _$LocacaoStoreBaseActionController.startAction(
        name: 'LocacaoStoreBase.setIdItem');
    try {
      return super.setIdItem(value);
    } finally {
      _$LocacaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdPessoa(int value) {
    final _$actionInfo = _$LocacaoStoreBaseActionController.startAction(
        name: 'LocacaoStoreBase.setIdPessoa');
    try {
      return super.setIdPessoa(value);
    } finally {
      _$LocacaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservacao(String value) {
    final _$actionInfo = _$LocacaoStoreBaseActionController.startAction(
        name: 'LocacaoStoreBase.setObservacao');
    try {
      return super.setObservacao(value);
    } finally {
      _$LocacaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$LocacaoStoreBaseActionController.startAction(
        name: 'LocacaoStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$LocacaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
idItem: ${idItem},
idPessoa: ${idPessoa},
observacao: ${observacao},
notification: ${notification},
loading: ${loading},
dataReserva: ${dataReserva},
idItemValid: ${idItemValid},
idPessoaValid: ${idPessoaValid},
isFormValid: ${isFormValid}
    ''';
  }
}
