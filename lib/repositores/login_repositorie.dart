import 'dart:async';
import 'package:flutter_projeto/models/login_model.dart';
import 'package:flutter_projeto/models/login_return_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {

  Future<bool> login(LoginModel loginModel) async {
    var uri = "https://erig.dev.br/api/login";
    var header = {'Content-Type': 'application/json'};
    var body = loginModel.toJson();
    try {
      var response = await http.post(Uri.parse(uri),
        headers: header, body: body);
      if (response.statusCode != 200){
          return false;
      } 
      var userReturn =  LoginReturnModel.fromJson(response.body);

      SharedPreferences prefs = await SharedPreferences.getInstance();
    
      prefs.setInt('userId', userReturn.userId!);
      prefs.setString('userName', userReturn.userName!);
      prefs.setString('userEmail', userReturn.userEmail!);
      prefs.setString('token', userReturn.token!);

      return true;
    } catch (e) {
       throw Exception('Falha ao tentar conectar ao servidor');
    }
  }
 
  // Future<bool> register(LoginModel LoginModel) async {
  //   final response = await post(Uri.parse('http://192.168.1.18:8080/LoginModels/'), 
  //     body: LoginModel.toJson(),
  //     headers: {'content-type':'application/json'}
  //   ); 
  //   if (response.statusCode != 200) {
  //     return false;
  //   }
  //   return true;
// }

}