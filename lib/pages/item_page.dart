import 'package:flutter_projeto/models/item_model.dart';
import 'package:flutter_projeto/models/tipo_item_model.dart';
import 'package:flutter_projeto/repositores/item_repository.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget{
  const ItemPage({super.key});
  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage>{
  var tipoSelecionado = TipoItemModel();

  List<ItemModel> itens = [];

  Future<List<ItemModel>> buscarItens() async {
    itens = [];
    return itens = await ItemRepository().buscarItens(tipoSelecionado.id!);
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final param = ModalRoute.of(context)?.settings.arguments as TipoItemModel;
      setState(() {
        tipoSelecionado = TipoItemModel(id: param.id, descricao: param.descricao, prazoDevolucao: param.prazoDevolucao);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: buscarItens(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && itens.isNotEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Escolha um item'),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: itens.length,
              itemBuilder: ((context, index) {
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
                              Text('${itens[index].id.toString()} - ',
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),), 
                              Expanded(
                                child: Text('${itens[index].descricao}',
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text('Condição: ${itens[index].itemCondicao}',
                                style: TextStyle(fontSize: 16.0),),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text('Descrição de Uso: ${itens[index].descUso}',
                                style: TextStyle(fontSize: 16.0),),
                              )
                            ],
                          )
                        ],
                      )
                    )
                  ),
                  onLongPress: () {},
                  onTap: () async {
                    await Navigator.of(context).pushNamed('/reserva', arguments: itens[index]);
                  },
                );
              }
            ),
          ),
        );
      } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasError) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_off, color: Colors.blue, size: 100),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('Erro ao obeter dados',
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Tente novamente', 
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
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
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          ),
        );
      }
    }),
  );
}
}