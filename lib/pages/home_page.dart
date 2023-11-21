import 'dart:io';

import 'package:flutter_projeto/repositores/login_repositorie.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seja bem vindo(a)'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app_outlined),
            color: Colors.white,
            onPressed: () async {
              exit(0);
            },
          ),
        ],
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.only(top: 26),
            children: <Widget>[
              //drawer header (login)
              ListTile(
                leading: Icon(Icons.home, color: Colors.blue, size: 40),
                title: Text(
                  'Tela Inicial',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
                onTap: () {
                  // TODO: Add your logic here
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.person_outline, color: Colors.blue, size: 40),
                title: Text(
                  'Beneficiário',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/pessoa');
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.wheelchair_pickup, color: Colors.blue, size: 40),
                title: Text(
                  'Reserva',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/tipo');
                },
              ),
               ListTile(
                leading: Icon(Icons.search, color: Colors.blue, size: 40),
                title: Text(
                  'cadastro tipo de itens',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('cadas_tipo_page');
                },
              ),
              ListTile(
                leading: Icon(Icons.search, color: Colors.blue, size: 40),
                title: Text(
                  'Consulta',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/consulta');
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.logout_outlined, color: Colors.blue, size: 40),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
                onTap: () async {
                   exit(0);
                  
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/pessoa');
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Icon(Icons.person_outline, color: Colors.blue, size: 120.0),
                    ),
                    Text(
                      'Cadastrar Beneficiário(a)',
                      style: TextStyle(fontSize: 16.0, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/tipo');
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Icon(Icons.wheelchair_pickup, color: Colors.blue, size: 120.0),
                    ),
                    Text(
                      'Reservar Item',
                      style: TextStyle(fontSize: 16.0, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/consulta');
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Icon(Icons.search, color: Colors.blue, size: 120.0),
                    ),
                    Text(
                      'Minhas Reservas',
                      style: TextStyle(fontSize: 16.0, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                 height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset('assets/images/rotary.jpg'),
                ),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset('assets/images/aca.jpg'),
                ),
                SizedBox(
                  height: 90,
                  width: 90,
                  child: Image.asset('assets/images/isepe.jpg'),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/images/ads.jpg'),
                ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}