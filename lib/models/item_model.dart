// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
      'itemCondicao': itemCondicao,
      'descUso': descUso,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] != null ? map['id'] as int : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      itemCondicao: map['itemCondicao'] != null ? map['itemCondicao'] as String : null,
      descUso: map['descUso'] != null ? map['descUso'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(id: $id, descricao: $descricao, itemCondicao: $itemCondicao, descUso: $descUso)';
  }

}
