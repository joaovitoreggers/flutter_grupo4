import 'dart:convert';

class RegisterModel {
  String? name;
  String? email;
  String? password;

  RegisterModel({
    this.name,
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      name: map['name'] as String?,
      email: map['email'] as String?,
      password: map['password'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegisterModel(name: $name, email: $email, password: $password)';
}
