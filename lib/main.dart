import 'package:flutter/material.dart';
import 'package:flutter_projeto/pages/home_page.dart';
import 'package:flutter_projeto/pages/login_page.dart';
import 'package:flutter_projeto/pages/register_pages.dart';
import 'package:flutter_projeto/pages/splash_page.dart';

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
        '/':(_) => const SplashPage(title: '',),
        '/login':(_) => const LoginPage(),
        '/register':(_) => const RegisterPages(),
        '/home':(_) => const HomePage(),
      
}
);
}
}