import 'package:flutter/material.dart';
import 'package:flutter_projeto/components/info_box.dart';
import 'package:flutter_projeto/stores/register_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var registerStore = RegisterStore();

  @override
  void dispose() {
    dispose(); // Limpar recursos ao descartar a página
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Usuário'),
        centerTitle: true,
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
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 20),
                    child: InfoBox(message: registerStore.notification),
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: Image.asset('assets/images/rotary.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                    child: TextField(
                      enabled: !registerStore.loading,
                      cursorColor: Colors.blue,
                      maxLines: 1,
                      maxLength: 255,
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
                      },
                    ),
                  ),
                  // Adicione outros campos TextField conforme necessário...
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0, bottom: 16.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Adicione a lógica para confirmar o registro aqui
                      },
                      child: registerStore.loading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.white),
                              ),
                            )
                          : const Text('Registrar'),
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
