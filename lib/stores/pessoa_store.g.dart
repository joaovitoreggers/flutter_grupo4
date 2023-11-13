// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PessoaStore on PessoaStoreBase, Store {
  Computed<bool>? _$nomeValidComputed;

  @override
  bool get nomeValid =>
      (_$nomeValidComputed ??= Computed<bool>(() => super.nomeValid,
              name: 'PessoaStoreBase.nomeValid'))
          .value;
  Computed<bool>? _$docValidComputed;

  @override
  bool get docValid =>
      (_$docValidComputed ??= Computed<bool>(() => super.docValid,
              name: 'PessoaStoreBase.docValid'))
          .value;
  Computed<bool>? _$fone1ValidComputed;

  @override
  bool get fone1Valid =>
      (_$fone1ValidComputed ??= Computed<bool>(() => super.fone1Valid,
              name: 'PessoaStoreBase.fone1Valid'))
          .value;
  Computed<bool>? _$enderecoValidComputed;

  @override
  bool get enderecoValid =>
      (_$enderecoValidComputed ??= Computed<bool>(() => super.enderecoValid,
              name: 'PessoaStoreBase.enderecoValid'))
          .value;
  Computed<bool>? _$ufValidComputed;

  @override
  bool get ufValid => (_$ufValidComputed ??=
          Computed<bool>(() => super.ufValid, name: 'PessoaStoreBase.ufValid'))
      .value;
  Computed<bool>? _$municipioValidComputed;

  @override
  bool get municipioValid =>
      (_$municipioValidComputed ??= Computed<bool>(() => super.municipioValid,
              name: 'PessoaStoreBase.municipioValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: 'PessoaStoreBase.emailValid'))
          .value;
  Computed<bool>? _$localTrabalhoValidComputed;

  @override
  bool get localTrabalhoValid => (_$localTrabalhoValidComputed ??=
          Computed<bool>(() => super.localTrabalhoValid,
              name: 'PessoaStoreBase.localTrabalhoValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'PessoaStoreBase.isFormValid'))
          .value;

  late final _$idAtom = Atom(name: 'PessoaStoreBase.id', context: context);

  @override
  String? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nomeAtom = Atom(name: 'PessoaStoreBase.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$docAtom = Atom(name: 'PessoaStoreBase.doc', context: context);

  @override
  String? get doc {
    _$docAtom.reportRead();
    return super.doc;
  }

  @override
  set doc(String? value) {
    _$docAtom.reportWrite(value, super.doc, () {
      super.doc = value;
    });
  }

  late final _$fone1Atom =
      Atom(name: 'PessoaStoreBase.fone1', context: context);

  @override
  String? get fone1 {
    _$fone1Atom.reportRead();
    return super.fone1;
  }

  @override
  set fone1(String? value) {
    _$fone1Atom.reportWrite(value, super.fone1, () {
      super.fone1 = value;
    });
  }

  late final _$fone2Atom =
      Atom(name: 'PessoaStoreBase.fone2', context: context);

  @override
  String? get fone2 {
    _$fone2Atom.reportRead();
    return super.fone2;
  }

  @override
  set fone2(String? value) {
    _$fone2Atom.reportWrite(value, super.fone2, () {
      super.fone2 = value;
    });
  }

  late final _$enderecoAtom =
      Atom(name: 'PessoaStoreBase.endereco', context: context);

  @override
  String? get endereco {
    _$enderecoAtom.reportRead();
    return super.endereco;
  }

  @override
  set endereco(String? value) {
    _$enderecoAtom.reportWrite(value, super.endereco, () {
      super.endereco = value;
    });
  }

  late final _$ufAtom = Atom(name: 'PessoaStoreBase.uf', context: context);

  @override
  String? get uf {
    _$ufAtom.reportRead();
    return super.uf;
  }

  @override
  set uf(String? value) {
    _$ufAtom.reportWrite(value, super.uf, () {
      super.uf = value;
    });
  }

  late final _$municipioAtom =
      Atom(name: 'PessoaStoreBase.municipio', context: context);

  @override
  String? get municipio {
    _$municipioAtom.reportRead();
    return super.municipio;
  }

  @override
  set municipio(String? value) {
    _$municipioAtom.reportWrite(value, super.municipio, () {
      super.municipio = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'PessoaStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$localTrabalhoAtom =
      Atom(name: 'PessoaStoreBase.localTrabalho', context: context);

  @override
  String? get localTrabalho {
    _$localTrabalhoAtom.reportRead();
    return super.localTrabalho;
  }

  @override
  set localTrabalho(String? value) {
    _$localTrabalhoAtom.reportWrite(value, super.localTrabalho, () {
      super.localTrabalho = value;
    });
  }

  late final _$notificationAtom =
      Atom(name: 'PessoaStoreBase.notification', context: context);

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
      Atom(name: 'PessoaStoreBase.loading', context: context);

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

  late final _$pessoasAtom =
      Atom(name: 'PessoaStoreBase.pessoas', context: context);

  @override
  List<PessoaModel> get pessoas {
    _$pessoasAtom.reportRead();
    return super.pessoas;
  }

  @override
  set pessoas(List<PessoaModel> value) {
    _$pessoasAtom.reportWrite(value, super.pessoas, () {
      super.pessoas = value;
    });
  }

  late final _$gravarAsyncAction =
      AsyncAction('PessoaStoreBase.gravar', context: context);

  @override
  Future<bool> gravar() {
    return _$gravarAsyncAction.run(() => super.gravar());
  }

  late final _$buscarPessoasAsyncAction =
      AsyncAction('PessoaStoreBase.buscarPessoas', context: context);

  @override
  Future<void> buscarPessoas() {
    return _$buscarPessoasAsyncAction.run(() => super.buscarPessoas());
  }

  late final _$PessoaStoreBaseActionController =
      ActionController(name: 'PessoaStoreBase', context: context);

  @override
  void setId(String value) {
    final _$actionInfo = _$PessoaStoreBaseActionController.startAction(
        name: 'PessoaStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$PessoaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String value) {
    final _$actionInfo = _$PessoaStoreBaseActionController.startAction(
        name: 'PessoaStoreBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$PessoaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDoc(String value) {
    final _$actionInfo = _$PessoaStoreBaseActionController.startAction(
        name: 'PessoaStoreBase.setDoc');
    try {
      return super.setDoc(value);
    } finally {
      _$PessoaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFone1(String value) {
    final _$actionInfo = _$PessoaStoreBaseActionController.startAction(
        name: 'PessoaStoreBase.setFone1');
    try {
      return super.setFone1(value);
    } finally {
      _$PessoaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFone2(String value) {
    final _$actionInfo = _$PessoaStoreBaseActionController.startAction(
        name: 'PessoaStoreBase.setFone2');
    try {
      return super.setFone2(value);
    } finally {
      _$PessoaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndereco(String value) {
    final _$actionInfo = _$PessoaStoreBaseActionController.startAction(
        name: 'PessoaStoreBase.setEndereco');
    try {
      return super.setEndereco(value);
    } finally {
      _$PessoaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUf(String value) {
    final _$actionInfo = _$PessoaStoreBaseActionController.startAction(
        name: 'PessoaStoreBase.setUf');
    try {
      return super.setUf(value);
    } finally {
      _$PessoaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMunicipio(String value) {
    final _$actionInfo = _$PessoaStoreBaseActionController.startAction(
        name: 'PessoaStoreBase.setMunicipio');
    try {
      return super.setMunicipio(value);
    } finally {
      _$PessoaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$PessoaStoreBaseActionController.startAction(
        name: 'PessoaStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$PessoaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLocalTrabalho(String value) {
    final _$actionInfo = _$PessoaStoreBaseActionController.startAction(
        name: 'PessoaStoreBase.setLocalTrabalho');
    try {
      return super.setLocalTrabalho(value);
    } finally {
      _$PessoaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$PessoaStoreBaseActionController.startAction(
        name: 'PessoaStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$PessoaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
nome: ${nome},
doc: ${doc},
fone1: ${fone1},
fone2: ${fone2},
endereco: ${endereco},
uf: ${uf},
municipio: ${municipio},
email: ${email},
localTrabalho: ${localTrabalho},
notification: ${notification},
loading: ${loading},
pessoas: ${pessoas},
nomeValid: ${nomeValid},
docValid: ${docValid},
fone1Valid: ${fone1Valid},
enderecoValid: ${enderecoValid},
ufValid: ${ufValid},
municipioValid: ${municipioValid},
emailValid: ${emailValid},
localTrabalhoValid: ${localTrabalhoValid},
isFormValid: ${isFormValid}
    ''';
  }
}
