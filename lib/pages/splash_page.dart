import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navegacao();
  }

  _navegacao() async {
    var minValid = await minValidate();
    await Future.delayed(Duration(milliseconds: 3000), () {});

    if (minValid) {
      Navigator.of(context).pushNamed('/home');
    } else {
      Navigator.of(context).pushNamed('/login');
    }
  }

  Future<bool> minValidate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataLogin = prefs.getString('dataLogin');
    int? minLogin;
    if (dataLogin != null) {
      minLogin = DateFormat("yyyy-MM-dd hh:mm:ss")
          .parse(DateTime.now().toString())
          .difference(
              DateFormat("yyyy-MM-dd hh:mm:ss").parse(dataLogin.toString()))
          .inMinutes;
      if (minLogin <= 120) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Banco Ortopédico',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 80,
                  width: 180,
                  child: Image.asset('assets/images/rotary.jpg'),
                ),
                SizedBox(
                  height: 120,
                  width: 150,
                  child: Image.asset('assets/images/aca.jpg'),
                ),
                SizedBox(
                  height: 150,
                  width: 200,
                  child: Image.asset('assets/images/isepe.jpg'),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/ads.jpg'),
                ),
              ],
            ),
          ),
        ),
     ),
);
}
}