// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocacaoModel {
  int? id;
  int?idItem;
  int? idPessoa;
  String? nome;
  String? descricao;
  String?dataReserva;
  String? dataLocacao;
  String? dataRetorno;
  String? observacao;
  String? nomeBanaficiaro;
  int? idUser;
  LocacaoModel({
    this.id,
    this.idPessoa,
    this.nome,
    this.descricao,
    this.dataLocacao,
    this.dataRetorno,
    this.observacao,
    this.nomeBanaficiaro,
    this.idUser, required String dataReserva, int? idItem,
  });

  LocacaoModel copyWith({
    int? id,
    int? idPessoa,
    String? nome,
    String? descricao,
    String? dataLocacao,
    String? dataRetorno,
    String? observacao,
    String? nomeBanaficiaro,
    int? idUser,
  }) {
    return LocacaoModel(
      id: id ?? this.id,
      idPessoa: idPessoa ?? this.idPessoa,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      dataLocacao: dataLocacao ?? this.dataLocacao,
      dataRetorno: dataRetorno ?? this.dataRetorno,
      observacao: observacao ?? this.observacao,
      nomeBanaficiaro: nomeBanaficiaro ?? this.nomeBanaficiaro,
      idUser: idUser ?? this.idUser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idPessoa': idPessoa,
      'nome': nome,
      'descricao': descricao,
      'dataLocacao': dataLocacao,
      'dataRetorno': dataRetorno,
      'observacao': observacao,
      'nomeBanaficiaro': nomeBanaficiaro,
      'idUser': idUser,
    };
  }

  factory LocacaoModel.fromMap(Map<String, dynamic> map) {
    return LocacaoModel(
      id: map['id'] != null ? map['id'] as int : null,
      idPessoa: map['idPessoa'] != null ? map['idPessoa'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      dataLocacao: map['dataLocacao'] != null ? map['dataLocacao'] as String : null,
      dataRetorno: map['dataRetorno'] != null ? map['dataRetorno'] as String : null,
      observacao: map['observacao'] != null ? map['observacao'] as String : null,
      nomeBanaficiaro: map['nomeBanaficiaro'] != null ? map['nomeBanaficiaro'] as String : null,
      idUser: map['idUser'] != null ? map['idUser'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocacaoModel.fromJson(String source) => LocacaoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocacaoModel(id: $id, idPessoa: $idPessoa, nome: $nome, descricao: $descricao, dataLocacao: $dataLocacao, dataRetorno: $dataRetorno, observacao: $observacao, nomeBanaficiaro: $nomeBanaficiaro, idUser: $idUser)';
  }

  @override
  bool operator ==(covariant LocacaoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idPessoa == idPessoa &&
      other.nome == nome &&
      other.descricao == descricao &&
      other.dataLocacao == dataLocacao &&
      other.dataRetorno == dataRetorno &&
      other.observacao == observacao &&
      other.nomeBanaficiaro == nomeBanaficiaro &&
      other.idUser == idUser;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idPessoa.hashCode ^
      nome.hashCode ^
      descricao.hashCode ^
      dataLocacao.hashCode ^
      dataRetorno.hashCode ^
      observacao.hashCode ^
      nomeBanaficiaro.hashCode ^
      idUser.hashCode;
  }
  }
