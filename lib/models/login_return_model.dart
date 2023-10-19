import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginReturnModel {
  int? userId;
  String? userName;
  String? userEmail;
  String? token;

  LoginReturnModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.token,
  });
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'token': token,
    };
  }

  factory LoginReturnModel.fromMap(Map<String, dynamic> map) {
    return LoginReturnModel(
      userId: map['userId'] != null ? map['userId'] as int : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      userEmail: map['userEmail'] != null ? map['userEmail'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginReturnModel.fromJson(String source) => LoginReturnModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginReturnModel(userId: $userId, userName: $userName, userEmail: $userEmail, token: $token)';
}
}