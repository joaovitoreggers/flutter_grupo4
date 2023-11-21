import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PessoaModel {
  int? id; 
  String? nome;
  String? doc;
  String? fone1;
  String? fone2;
  String? endereco;
  String? uf;
  String? municipio;
  String? email;
  String? localTrabalho;
  int? beneficiario;
  int? idUser;

  PessoaModel({
    this.id,
    this.nome,
    this.doc,
    this.fone1,
    this.fone2,
    this.endereco,
    this.uf,
    this.municipio,
    this.email,
    this.localTrabalho,
    this.beneficiario,
    this.idUser,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'doc': doc,
      'fone1': fone1,
      'fone2': fone2,
      'endereco': endereco,
      'uf': uf,
      'municipio': municipio,
      'email': email,
      'local_trabalho': localTrabalho,
      'beneficiario': beneficiario,
      'id_user': idUser,
    };
  }

  factory PessoaModel.fromMap(Map<String, dynamic> map) {
    return PessoaModel(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      doc: map['doc'] ?? '',
      fone1: map['fone1'] ?? '',
      fone2: map['fone2'] ?? '',
      endereco: map['endereco'] ?? '',
      uf: map['uf'] ?? '',
      municipio: map['municipio'] ?? '',
      email: map['email'] ?? '',
      localTrabalho: map['local_trabalho'] ?? '',
      beneficiario: map['beneficiario'] ?? '',
      idUser: map['id_user'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PessoaModel.fromJson(String source) => PessoaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PessoaModel(id: $id, nome: $nome, doc: $doc, fone1: $fone1, fone2: $fone2, endereco: $endereco, uf: $uf, municipio: $municipio, email: $email, localTrabalho: $localTrabalho, beneficiario: $beneficiario, idUser: $idUser)';
  }
}