import 'package:flutter/material.dart';
import 'package:flutter_projeto/components/info_box.dart';
import 'package:flutter_projeto/stores/register_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
       final RegisterStore registerStore = RegisterStore();

   @override
   Widget build(BuildContext context) {
       return Scaffold(
        appBar: AppBar(
          title: const Text('Informe os dados de acesso',
            style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
           body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Observer(builder: (_){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                        child: InfoBox(message: registerStore.notification), 
                      ),
                      SizedBox(
                        height: 80,
                        width: 180,
                        child: Image.asset('assets/images/rotary.jpg'),
                      ),
                      Padding(
                       padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                       child: TextField(
                        enabled: !registerStore.loading,
                        cursorColor: Colors.blue,
                        maxLines: 1,
                        maxLength: 255,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Nome',
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
                          errorText: registerStore.nameError,
                          ),
                          
                        onChanged: (value) {
                          registerStore.setName(value);
                        },),
                      ),
                      Padding(
                       padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                       child: TextField(
                        enabled: !registerStore.loading,
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
                          errorText: registerStore.emailError,
                          ),
                          
                        onChanged: (value) {
                          registerStore.setEmail(value);
                        },),
                      ),
                      Padding(
                       padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                       child: TextField(
                        enabled: !registerStore.loading,
                        cursorColor: Colors.blue,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        maxLines: 1,
                        maxLength: 6,
                        decoration: InputDecoration(
                          labelText: 'Senha',
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
                          errorText: registerStore.passwordError,
                          ),
                          
                        onChanged: (value) {
                          registerStore.setPassword(value);
                        },),
                      ),
                      Padding(
                       padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                       child: TextField(
                        enabled: !registerStore.loading,
                        cursorColor: Colors.blue,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        maxLines: 1,
                        maxLength: 6,
                        decoration: InputDecoration(
                          labelText: 'Senha',
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
                          errorText: registerStore.password2Error,
                          ),
                          
                        onChanged: (value) {
                          registerStore.setPassword2(value);
                        },),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: ElevatedButton(
                            child: registerStore.loading
                            ? Padding(
                              padding: const EdgeInsets.only(
                                top: 16.0, bottom: 16.0),
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(Colors.white),
                                ),
                              )
                              :  Padding(
                                padding: const EdgeInsets.only(
                                  top: 16.0, bottom: 16.0),
                                  child: const Text(
                                    'Cadastrar',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.blue,
                            ),
                              onPressed: () async {
                                if(registerStore.isFormValid){
                                  var register = await registerStore.register();
                                    if(register) {
                                      Navigator.of(context).pushNamed('/login');
                              }
                            } else {
                            registerStore.mostrarInfo('Erro ao validar formulário');
                          }
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3, top: 30),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              'Já possui uma conta?',
                              style: TextStyle(
                                fontSize: 16,
                                color:  Colors.grey[800],
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                            )
                          ],
                        ),
                        ),
                    ],
                  );
                }),
              ),
            ),
           ),
      );
   }
  }
