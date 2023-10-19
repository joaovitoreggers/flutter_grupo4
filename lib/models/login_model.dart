import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginModel {
  String? email;
  String? password;

  LoginModel({
    this.email,
    this.password
  });
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['userEmail'] != null ? map['userEmail'] as String : '',
      password: map['password'] != null ? map['password'] as String : ''
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginModel(email: $email, password: $password)';
}
}