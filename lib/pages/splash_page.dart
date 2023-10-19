import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({ super.key, required String title });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('splash page'),),
           body:  SingleChildScrollView(
            child: Center(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 60,
                width: 200,
                child: Image.asset('assets/images/rotary.jpg'),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 60,
                width: 200,
                child: Image.asset('assets/images/aca.jpg'),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 60,
                width: 200,
                child: Image.asset('assets/images/isepe1.jpg'),
              ),
              const SizedBox(height: 5,),
              SizedBox(
                height: 60,
                width: 200,
                child: Image.asset('assets/images/ads.jpg'),
                     ),
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
                  ],
                 ),
                ),
               ),
              );
             }
}
