import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_projeto/stores/pessoa_store.dart';
import 'package:flutter_projeto/components/info_box.dart';

class PessoaPage extends StatefulWidget {

  const PessoaPage({ super.key });

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
            child:  Padding(
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
                        cursorColor:  Colors.blue,
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
                          focusedBorder: OutlineInputBorder(
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                      child: TextField(
                        enabled: !pessoaStore.loading,
                        cursorColor:  Colors.blue,
                        maxLines: 1,
                        maxLength: 50,
                        decoration: InputDecoration(
                          labelText: 'Telefone1*',
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
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          errorText: pessoaStore.fone1Error,
                        ),
                        onChanged: (value) {
                          pessoaStore.setFone1(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                      child: TextField(
                        enabled: !pessoaStore.loading,
                        cursorColor:  Colors.blue,
                        maxLines: 1,
                        maxLength: 50,
                        decoration: InputDecoration(
                          labelText: 'Telefone 2',
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
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) {
                          pessoaStore.setFone2(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                      child: TextField(
                        enabled: !pessoaStore.loading,
                        cursorColor:  Colors.blue,
                        maxLines: 1,
                        maxLength: 50,
                        decoration: InputDecoration(
                          labelText: 'Municipio',
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
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          errorText: pessoaStore.municipioError
                        ),
                        onChanged: (value) {
                          pessoaStore.setMunicipio(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                      child: TextField(
                        enabled: !pessoaStore.loading,
                        cursorColor:  Colors.blue,
                        maxLines: 1,
                        maxLength: 50,
                        decoration: InputDecoration(
                          labelText: 'UF',
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
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          errorText: pessoaStore.ufError
                        ),
                        onChanged: (value) {
                          pessoaStore.setUf(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                      child: TextField(
                        enabled: !pessoaStore.loading,
                        cursorColor:  Colors.blue,
                        maxLines: 1,
                        maxLength: 50,
                        decoration: InputDecoration(
                          labelText: 'Endereço',
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
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          errorText: pessoaStore.enderecoError,
                        ),
                        onChanged: (value) {
                          pessoaStore.setEndereco(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                      child: TextField(
                        enabled: !pessoaStore.loading,
                        cursorColor:  Colors.blue,
                        maxLines: 1,
                        maxLength: 50,
                        decoration: InputDecoration(
                          labelText: 'Documento',
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
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          errorText: pessoaStore.docError,
                        ),
                        onChanged: (value) {
                          pessoaStore.setDoc(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                      child: TextField(
                        enabled: !pessoaStore.loading,
                        cursorColor:  Colors.blue,
                        maxLines: 1,
                        maxLength: 50,
                        decoration: InputDecoration(
                          labelText: 'Local de trabalho',
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
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          errorText: pessoaStore.localTrabalhoError,
                        ),
                        onChanged: (value) {
                          pessoaStore.setLocalTrabalho(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                      child: TextField(
                        enabled: !pessoaStore.loading,
                        cursorColor:  Colors.blue,
                        maxLines: 1,
                        maxLength: 50,
                        decoration: InputDecoration(
                          labelText: 'Email',
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
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          errorText: pessoaStore.emailError,
                        ),
                        onChanged: (value) {
                          pessoaStore.setEmail(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: ElevatedButton( 
                        child: pessoaStore.loading
                        ? Padding(
                          padding: const EdgeInsets.only(
                            top: 16.10, bottom: 16.0),
                            child: const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                        )
                        : Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0),
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
                        ),
                    )
                   ], 
                  );
                }),
              ),
            ),
           ),
       );
  }
}