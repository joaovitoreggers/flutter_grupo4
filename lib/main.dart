import 'package:flutter/material.dart';
import 'package:flutter_projeto/pages/home_page.dart';
import 'package:flutter_projeto/pages/item_page.dart';
import 'package:flutter_projeto/pages/login_page.dart';
import 'package:flutter_projeto/pages/pessoa_page.dart';
import 'package:flutter_projeto/pages/register_pages.dart';
import 'package:flutter_projeto/pages/reseerva_page.dart';
import 'package:flutter_projeto/pages/reserva_consulta_page.dart';
import 'package:flutter_projeto/pages/splash_page.dart';
import 'package:flutter_projeto/pages/tipo_item_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(_) => const SplashPage(),
        '/login':(_) => const LoginPage(),
        '/register':(_) => const RegisterPage(),
        '/home':(_) => const HomePage(),
        '/pessoa':(_) => const PessoaPage(),
        '/tipo':(_) => const TipoItemPage(),
        '/item':(_) => const ItemPage(),
        '/consulta':(_) => const ReservaConsultaPage(),
        '/reserva':(_) => const ReservaPage(),
      
      
}
);
}
}