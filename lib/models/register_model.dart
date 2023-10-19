import 'package:flutter/material.dart';

class RegisterModel {
  String? name;
  String? email;
  String? password;

  RegisterModel({
    this.name,
    this.email,
    this.password
  });

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };

    factory RegisterModel.fromMap(Map<String, dynamic> map){
      return RegisterModel(
        name: map['name'] != null ? map['name'] as String : null,
        email: map['email'] != null ? map['email'] as String : null,
        password: map['password'] != null ? map['password'] as String : null);

    }
  }
}