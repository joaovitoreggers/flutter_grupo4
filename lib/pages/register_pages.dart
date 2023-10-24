import 'package:flutter/material.dart';
import 'package:flutter_projeto/components/info_box.dart';
import 'package:flutter_projeto/stores/register_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterPages extends StatefulWidget {

  const RegisterPages({ super.key });

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('novo usuário'),
           centerTitle: true,),
           body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Observer (builder: (_) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 2, 8, 20),
                        child: InfoBox(message: RegisterStore.notification), 
                      ),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: Image.asset('assets/images/rotary.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                        child: TextField(
                          enabled: !RegisterStore.loading,
                          cursorColor: Colors.blue,
                          maxLines: 1,
                          maxLength: 255,
                          decoration: InputDecoration(
                            labelText: 'nome',
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey[400]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey[400]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          errorText: RegisterStore.nameError,
                          ),
                          onChanged: (value) {RegisterStore.setName(value);
                }),
                      ),
                      Padding (
                        padding: const EdgeInsets.fromLTRB(0, 14, 0, 0), 
                        child: TextField(
                          enabled: !RegisterStore.loading,
                          cursorColor: Colors.blue,
                          maxLines: 1,
                          maxLength: 255,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey[400]!),
                               ),enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey[400]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey[400]!),
                            ),
                          
                          filled: true,
                          fillColor: Colors.white,
                          errorText: RegisterStore.emailError
                          ),
                          onChanged: (value) {
                            RegisterStore.setEmail(value);
                          }),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                        child: TextField(
                          enabled: !RegisterStore.loading,
                          cursorColor: Colors.blue,
                          maxLines: 1,
                          maxLength: 255,
                          decoration: InputDecoration(
                            labelText: 'senha',
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey[400]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey[400]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          errorText: RegisterStore.passwordError,
                          ),
                          onChanged: (value) {RegisterStore.setPassword(value);
                }),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                        child: TextField(
                          enabled: !RegisterStore.loading,
                          cursorColor: Colors.blue,
                          maxLines: 1,
                          maxLength: 255,
                          decoration: InputDecoration(
                            labelText: 'repita a sua senha',
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey[400]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey[400]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          errorText: RegisterStore.passwordError,
                          ),
                          onChanged: (value) {RegisterStore.setPassword2(value);
                }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16.0,),
                          child: const CircularProgressIndicator(
                            valueColor: 
                            AlwaysStoppedAnimation(Colors.white),
                          ),
                           ),
                           Padding(
                            padding: const EdgeInsets.only(
                              top: 16.0, bottom: 16.0),
                            ),
                            
                    ]
                  );
                      }
                ),
             
              ),
            ),
           )
       );
}
}