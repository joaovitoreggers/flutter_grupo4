import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_projeto/stores/cadastro_Tipo_store.dart';
import 'package:flutter_projeto/components/info_box.dart';
import 'package:flutter_projeto/stores/cadastro_tipo_store.dart';

class cadastroTipoPage extends StatefulWidget {

  const cadastroTipoPage({ super.key });

  @override
  State<cadastroTipoPage> createState() => _cadastroTipoPageState();
}

class _cadastroTipoPageState extends State<cadastroTipoPage> {
  final tipoItemStoreBase = TipoItemStore();

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
            title: const Text('Cadastro de tipo de item'),
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
                      child: InfoBox(message: tipoItemStoreBase.notification
),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                      child: TextField(
                        enabled: !tipoItemStoreBase.loading,
                        cursorColor:  Colors.blue,
                        maxLines: 1,
                        maxLength: 150,
                        decoration: InputDecoration(
                          labelText: 'descricao',
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
                          errorText: tipoItemStoreBase.descricaoError,
                        ),
                        onChanged: (value) {
                          tipoItemStoreBase.setPrazoDevolucao(120);
                        },
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: ElevatedButton( 
                        child: tipoItemStoreBase.loading
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
                          if (tipoItemStoreBase.isFormValid) {
                            var gravou = await tipoItemStoreBase.gravar();
                            if (gravou) {
                              Navigator.of(context).pop();
                            }
                          } else {
                            tipoItemStoreBase.mostrarInfo('Erro ao validar formulário');
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