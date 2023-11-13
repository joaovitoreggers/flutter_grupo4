import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_projeto/models/locacao_model.dart';
import 'package:flutter_projeto/repositores/locacao_repository.dart';

class ReservaConsultaPage extends StatefulWidget {
  const ReservaConsultaPage({Key? key}) : super(key: key);

  @override
  State<ReservaConsultaPage> createState() => _ReservaConsultaPageState();
}

class _ReservaConsultaPageState extends State<ReservaConsultaPage> {
  List<LocacaoModel> locacoes = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> buscarLocacoes() async {
    locacoes = await LocacaoRepository().buscarlocacoes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: buscarLocacoes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            locacoes.isNotEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Minhas Reservas'),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: locacoes.length,
              itemBuilder: (context, index) {
                // ... Restante do código ...
              },
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasError) {
          return Scaffold(
            // ... Código de tratamento de erro ...
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            locacoes.isEmpty) {
          return Scaffold(
            // ... Código para lidar com a lista vazia ...
          );
        } else {
          return Scaffold(
            // ... Código para exibir enquanto aguarda...
          );
        }
      },
    );
  }
}
