import 'package:flutter/material.dart';

class RegisterPages extends StatefulWidget {

  const RegisterPages({ super.key });

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('register page'),),
           body: SingleChildScrollView(
            child: Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('/home');
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