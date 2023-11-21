import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

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
      'prazo_devolucao': prazoDevolucao,
    };
  }

  factory TipoItemModel.fromMap(Map<String, dynamic> map) {
    return TipoItemModel(
      id: map['id'] ?? 0,
      descricao: map['descricao'] ?? '',
      prazoDevolucao: map['prazo_devolucao'] ?? 0
    );
  }

  String toJson() => json.encode(toMap());

  factory TipoItemModel.fromJson(String source) => TipoItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TipoItemModel(id: $id, descricao: $descricao, prazoDevolucao: $prazoDevolucao)';
}