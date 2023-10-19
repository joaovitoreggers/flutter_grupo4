import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({ super.key });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('login page'),),
           body: SingleChildScrollView(
            child: Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: Padding(padding: const EdgeInsets.all(8.0),
                      child: Text('acessar',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),)
                      ,),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.blue,
                     ),
                   ),
              ],),
            )
           ),
);
}
}