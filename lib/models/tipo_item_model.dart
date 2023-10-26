// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TipoItemModel {
  int? id;
  String? descricao;
  int? prazoDevolucao;

  TipoItemModel({
    this.id,
    this.descricao,
    this.prazoDevolucao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'descricao': descricao,
      'prazoDevolucao': prazoDevolucao,
    };
  }

  factory TipoItemModel.fromMap(Map<String, dynamic> map) {
    return TipoItemModel(
      id: map['id'] != null ? map['id'] as int : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      prazoDevolucao: map['prazoDevolucao'] != null ? map['prazoDevolucao'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TipoItemModel.fromJson(String source) => TipoItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TipoItemModel(id: $id, descricao: $descricao, prazoDevolucao: $prazoDevolucao)';

}
