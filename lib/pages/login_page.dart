import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_projeto/stores/login_store.dart';
import 'package:flutter_projeto/components/info_box.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({ super.key });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var loginStore = LoginStore();
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Informe os dados de Acesso', 
           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
           centerTitle: true,
           ),           
           body: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(8.0),
            child: Center (child: Observer(builder: (_) {
              return Column (crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [Padding(padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
              child: InfoBox(message: loginStore.notification),),
              SizedBox(
                height: 60,
                width: 160,
                child: Image.asset('assets/images/rotary.jpg'),
              ), 
              Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TextField(enabled: !loginStore.loading,
              cursorColor: Colors.blue,
              maxLines: 1,
              maxLength: 255,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                isDense: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                filled: true,
                fillColor: Colors.white,
                errorText: loginStore.emailError,
              ),
              onChanged: (value){loginStore.setEmail(value);
              }),),
              Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TextField(enabled: !loginStore.loading,
              cursorColor: Colors.blue,
              maxLines: 1,
              maxLength: 255,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                isDense: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                filled: true,
                fillColor: Colors.white,
                errorText: loginStore.passwordError,
              ),
              onChanged: (value){loginStore.setPassword(value);
              }),),],);
            }),))
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