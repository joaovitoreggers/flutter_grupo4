import 'dart:async';
import 'package:flutter_projeto/models/login_model.dart';
import 'package:flutter_projeto/models/login_return_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

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
      var userReturn = LoginReturnModel.fromJson(response.body);
      
      var dataLogin = DateFormat("yyyy-MM-dd hh:mm:ss").parse(DateTime.now().toString());

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('userId', userReturn.userId!);
      prefs.setString('userName', userReturn.userName!);
      prefs.setString('userEmail', userReturn.userEmail!);
      prefs.setString('token', userReturn.token!);
      prefs.setString('dataLogin', dataLogin.toString());

      return true;
    } catch (e) {
       throw Exception('Falha ao tentar conectar ao servidor');
}
}
}