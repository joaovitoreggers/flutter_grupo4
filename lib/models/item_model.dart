import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ItemModel {
  int? id;
  String? descricao;
  String? itemCondicao;
  String? descUso;
  
  ItemModel({
    this.id,
    this.descricao,
    this.itemCondicao,
    this.descUso,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'descricao': descricao,
      'item_condicao': itemCondicao,
      'desc_uso': descUso,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] ?? 0,
      descricao: map['descricao'] ?? '',
      itemCondicao: map['item_condicao'] ?? '',
      descUso: map['desc_uso'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(id: $id, descricao: $descricao, itemCondicao: $itemCondicao, descUso: $descUso)';
  }
}