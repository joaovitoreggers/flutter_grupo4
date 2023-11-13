import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_projeto/components/info_box.dart';
import 'package:flutter_projeto/models/item_model.dart';
import 'package:flutter_projeto/models/pessoa_model.dart';
import 'package:flutter_projeto/stores/locacao_store.dart';
import 'package:flutter_projeto/stores/pessoa_store.dart';

class ReservaPage extends StatefulWidget {
  const ReservaPage({Key? key}) : super(key: key);

  @override
  State<ReservaPage> createState() => _ReservaPageState();
}

class _ReservaPageState extends State<ReservaPage> {
  var locacaoStore = LocacaoStore();

  late ItemModel ItemSelecionado;

  var pessoaStore = PessoaStore();
  PessoaModel? pessoaSelected;

  Future<void> loadPessoas() async {
    await pessoaStore.buscarPessoas();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      final param =
          ModalRoute.of(context)?.settings.arguments as ItemModel;
      setState(() {
        ItemSelecionado = ItemModel(id: param.id, descricao: param.descricao);
      });
      await loadPessoas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reserva de Item',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Observer(builder: (_) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 20),
                  child: InfoBox(message: locacaoStore.notification),
                ),
                Column(
                  children: [
                    Text(
                      'Código: ${ItemSelecionado.id}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              '${ItemSelecionado.descricao}',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField(
                  hint: const Text('Selecione o beneficiário'),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(15.0),
                  value: pessoaSelected,
                  items: pessoaStore.pessoas
                      .map((e) => DropdownMenuItem(
                          child: Text(e.nome!), value: e))
                      .toList(),
                  onChanged: (value) {
                    pessoaSelected = value;
                    locacaoStore.setIdPessoa(pessoaSelected!.id!);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: TextField(
                    enabled: !locacaoStore.loading,
                    cursorColor: Colors.blue,
                    maxLines: 1,
                    maxLength: 150,
                    decoration: InputDecoration(
                      labelText: 'Observação',
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
                    ),
                    onChanged: (value) {
                      locacaoStore.setObservacao(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: ElevatedButton(
                    child: locacaoStore.loading
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
                              'Confirmar',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () async {
                      locacaoStore.idItem = ItemSelecionado.id;
                      if (locacaoStore.isFormValid) {
                        var gravou = await locacaoStore.gravar();
                        if (gravou) {
                          Navigator.of(context).pop();
                        }
                      } else {
                        InfoBox(message: 'Erro ao validar formulário');
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
