import 'package:flutter_projeto/components/info_box.dart';
import 'package:flutter_projeto/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe os Dados de Acesso',
          style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Observer(builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                    child: InfoBox(message: loginStore.notification),
                  ),
                  SizedBox(
                       height: 60,
                       width: 160,
                       child: Image.asset('assets/images/rotary.png'),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextField(
                        enabled: !loginStore.loading,
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
                              errorText: loginStore.emailError,
                            ),
                        onChanged: (value) {
                          loginStore.setEmail(value);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: TextField(
                        enabled: !loginStore.loading,
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
                              errorText: loginStore.passwordError,
                            ),
                        onChanged: (value) {
                          loginStore.setPassword(value);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                        child: loginStore.loading
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, bottom: 16.0),
                                child: const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, bottom: 16.0),
                                child: const Text(
                                  'Entrar',
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
                          if(loginStore.isFormValid) {
                            var login = await loginStore.login();
                            if (login) {
                              Navigator.of(context).pushNamed('/home');
                            } 
                          } else {
                            loginStore.mostrarInfo('Erro ao validar formulário');
                          }
                        }),
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.only(left: 3, top: 30),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          'Não tem uma conta? ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            'Cadastre-se',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                        ),
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