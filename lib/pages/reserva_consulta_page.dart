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

  Future<List<LocacaoModel>> buscarLocacoes() async {
    return locacoes = await LocacaoRepository().buscarlocacoes();
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
                DateTime? dataReserva;

                return GestureDetector(
                  child: Card(
                    elevation: 2,
                    color: (locacoes[index].dataLocacao != null &&
                            locacoes[index].dataLocacao!.isNotEmpty)
                        ? Colors.green[50]
                        : Colors.red[50],
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Beneficiario ',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${locacoes[index].nome}',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'Item Nº ',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Expanded(
                                child: Text(
                                  '${locacoes[index].idItem}',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${locacoes[index].descricao}',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'Data Reserva: ',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Expanded(
                                child: locacoes[index].dataReserva != null
                                    ? Text(
                                        DateFormat("dd/MM/yyyy")
                                            .format(dataReserva = DateTime.parse(
                                                locacoes[index].dataReserva!)),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    : Text(
                                        "_//_",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Status: ',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Expanded(
                                child: (locacoes[index].dataLocacao != null &&
                                        locacoes[index].dataLocacao!.isNotEmpty)
                                    ? Text(
                                        'Aprovado',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    : Text(
                                        'Aguardando aprovação',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  onLongPress: () {},
                  onTap: () async {},
                );
              },
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_off,
                      color: Colors.blue,
                      size: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ops... erro ao obter dados',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'Tente novamente',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            locacoes.isEmpty) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.do_disturb_alt_sharp,
                      color: Colors.blue,
                      size: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Locações não encontradas',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'Voltar',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
        }
      },
    );
  }
}
