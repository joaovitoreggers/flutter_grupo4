import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({ super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('home page'),),
           body: SingleChildScrollView(
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
                    ],
                   ),
                 ),
       ),
   );
}
}
