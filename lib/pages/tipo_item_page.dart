import 'package:flutter_projeto/models/tipo_item_model.dart';
import 'package:flutter_projeto/repositores/tipo_item_repository.dart';
import 'package:flutter/material.dart';


class TipoItemPage extends StatefulWidget{ 
  const TipoItemPage({super.key});

  @override
  State<TipoItemPage> createState() => _TipoItemPageState();
}

class _TipoItemPageState extends State< TipoItemPage> {
  List <TipoItemModel> tiposItens = [];

  @override
  void initState() {
    super.initState();
  }
  Future<List<TipoItemModel>> buscarTiposItens() async {
    tiposItens = [];
    return tiposItens = await TipoItemRepository().buscarTiposItens();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: buscarTiposItens(), builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done && tiposItens.isNotEmpty){
        return Scaffold(
          appBar:  AppBar(
            title: const Text('O que deseja locar hoje?'),
            centerTitle: true,
          ),
          body:ListView.builder(itemCount: tiposItens.length, itemBuilder: (context,index) {
            return GestureDetector(
              child: Card(
                elevation: 2,
                shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children:[
                      Row(
                        children: [
                          Text('${tiposItens[index].id.toString()} - ',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w700),),
                            Expanded(
                              child: Text('${tiposItens[index].descricao}',
                              style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w700),),
                            ),
                        ],
                    ),
                    Text('Prazo de Devolução: ${tiposItens[index].prazoDevolucao} dias',
                    style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w700),),
                  ],
                ),
              ),
            ),
            onLongPress: () {},
            onTap: () async {
              await Navigator.of(context).pushNamed('/item', arguments: tiposItens[index]);
            },
          );
        },
      ),
    );
  } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasError){
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cloud_off,
              color: Colors.blue,
              size:100),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Ops. Erro ao obter dados',
                style: TextStyle(
                  fontSize: 14.0, fontWeight: FontWeight.w700),),
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
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      );
    }
  }),
);
}
}