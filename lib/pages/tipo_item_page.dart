import 'package:flutter/material.dart';
import 'package:flutter_projeto/models/tipo_item_model.dart';
import 'package:flutter_projeto/repositores/tipo_item_repository.dart';

class TipoItemPage extends StatefulWidget {
  const TipoItemPage({Key? key}) : super(key: key);

  @override
  State<TipoItemPage> createState() => _TipoItemPageState();
}

class _TipoItemPageState extends State<TipoItemPage> {
  List<TipoItemModel> tiposItens = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<TipoItemModel>> buscarTiposItens() async {
    tiposItens = [];
    return await TipoItemRepository().buscarTiposItens();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TipoItemModel>>(
      future: buscarTiposItens(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('O que deseja locar hoje?'),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: tiposItens.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${tiposItens[index].id.toString()} -',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${tiposItens[index].descricao} ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Prazo de devolução: ${tiposItens[index].prazoDevolucao} dias',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return CircularProgressIndicator(); // Adicione um indicador de carregamento enquanto os dados estão sendo buscados.
        }
      },
    );
  }
}
