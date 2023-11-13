import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_projeto/components/info_box.dart';
import 'package:flutter_projeto/stores/pessoa_store.dart';
import 'package:mobx/mobx.dart';

class PessoaPage extends StatefulWidget {
  const PessoaPage({Key? key}) : super(key: key);

  @override
  State<PessoaPage> createState() => _PessoaPageState();
}

class _PessoaPageState extends State<PessoaPage> {
  final PessoaStore pessoaStore = PessoaStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de beneficiário'),
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
                    child: InfoBox(message: pessoaStore.notification),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                    child: TextField(
                      enabled: !pessoaStore.loading,
                      cursorColor: Colors.blue,
                      maxLines: 1,
                      maxLength: 50,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 53, 24, 24),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey[400]!),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        errorText: pessoaStore.nomeError,
                      ),
                      onChanged: (value) {
                        pessoaStore.setNome(value);
                      },
                    ),
                  ),
                  // Outros campos de TextField...

                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (pessoaStore.isFormValid) {
                        var gravou = await pessoaStore.gravar();
                        if (gravou) {
                          Navigator.of(context).pop();
                        }
                      } else {
                        pessoaStore.mostrarInfo('Erro ao validar formulário');
                      }
                    },
                    child: pessoaStore.loading
                        ? Padding(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                              bottom: 16.0,
                            ),
                            child: const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                              bottom: 16.0,
                            ),
                            child: const Text(
                              'Gravar',
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
