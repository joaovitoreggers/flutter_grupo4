import 'dart:convert';

class LocacaoModel {
  int? id;
  int? idItem;
  int? idPessoa;
  int? idUser;
  String? nome;
  String? descricao;
  String? dataReserva;
  String? dataLocacao;
  String? dataRetorno;
  String? observacao;
  String? nomeBeneficiario;

  LocacaoModel({
    this.id,
    this.idItem,
    this.idPessoa,
    this.idUser,
    this.nome,
    this.descricao,
    this.dataReserva,
    this.dataLocacao,
    this.dataRetorno,
    this.observacao,
    this.nomeBeneficiario,
  });

  Map<String, dynamic> toMap() {
    return<String, dynamic>{
      'id': id,
      'id_item': idItem,
      'id_pessoa': idPessoa,
      'id_user': idUser,
      'nome': nome,
      'descricao': descricao,
      'data_reserva': dataReserva,
      'data_locacao': dataLocacao,
      'data_retorno': dataRetorno,
      'observacao': observacao,
      'nome_beneficiario': nomeBeneficiario,
    };
  }

  factory LocacaoModel.fromMap(Map<String, dynamic> map) {
    return LocacaoModel(
      id: map['id'] ?? 0,
      idItem: map['id_item'] ?? 0,
      idPessoa: map['id_pessoa'] ?? 0,
      idUser: map['id_user'] ?? 0,
      nome: map['nome'] ?? '',
      descricao: map['descricao'] ?? '',
      dataReserva: map['data_reserva'] ?? '',
      dataRetorno: map['data_retorno'] ?? '',
      dataLocacao: map['data_locacao'] ?? '',
      observacao: map['observacao'] ?? '',
      nomeBeneficiario: map['nome_beneficiario'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LocacaoModel.fromJson(String source) => LocacaoModel.fromMap(json.decode(source) as Map<String, dynamic>);



  @override
  String toString() {
    return 'LocacoaModel(id: $id, idItem: $idItem, idPessoa: $idPessoa, id_user: $idUser, nome: $nome, descricao: $descricao, dataReserva: $dataReserva, dataRetorno: $dataRetorno, dataLocacao: $dataLocacao, observacao: $observacao, nomeBeneficiario: $nomeBeneficiario)';
  }
}