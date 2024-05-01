//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(appWidget());
}

class appWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.black, // Cor de fundo aqui
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.yellow), // Cor do corpo do texto
            bodyText2: TextStyle(color: Colors.yellow), // Cor do corpo do texto (variação)
        ),
        ),
        home: Scaffold(
          body: HomePage(),
          bottomNavigationBar: creditos(),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  TextEditingController realController = TextEditingController();
  TextEditingController dollarController = TextEditingController();
  TextEditingController euroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Conversor Monetário',
              style: TextStyle(color: Colors.amber, decoration: TextDecoration.none),
            ),
            Container(
              width: 100,
              height: 100,
              child: Image.network('https://uxwing.com/wp-content/themes/uxwing/download/banking-finance/gold-coin-dollar-icon.png'),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: realController,
                    style: TextStyle(color: Colors.yellow),
                    decoration: InputDecoration(
                      labelText: 'REAIS',
                      labelStyle: TextStyle(color: Colors.yellow),
                      prefixText: 'R\$', // Texto pré-definido
                      prefixStyle: TextStyle(color: Colors.yellow)
                    ),
                    onChanged: (value) {
                      double realValue = double.tryParse(value) ?? 0.0;
                      double dollarValue = realValue / 5.20; // Supondo que 1 real = 0.192 dólares (5.20 reais = 1 dólar)
                      double euroValue = realValue / 5.55; // Supondo que 1 real = 0.180 euros (5.55 reais = 1 euro)
                      dollarController.text = dollarValue.toStringAsFixed(2);
                      euroController.text = euroValue.toStringAsFixed(2);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 40.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: dollarController,
                    style: TextStyle(color: Colors.yellow),
                    decoration: InputDecoration(
                      labelText: 'DÓLARES',
                      labelStyle: TextStyle(color: Colors.yellow),
                      prefixText: 'U\$', // Texto pré-definido
                      prefixStyle: TextStyle(color: Colors.yellow)
                    ),
                    onChanged: (value) {
                      double dollarValue = double.tryParse(value) ?? 0.0;
                      double realValue = dollarValue * 5.20; // Supondo que 1 dólar = 5.20 reais
                      double euroValue = realValue / 5.55; // Supondo que 1 dólar = 0.938 euros (5.55 reais = 1 euro)
                      realController.text = realValue.toStringAsFixed(2);
                      euroController.text = euroValue.toStringAsFixed(2);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 40.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: euroController,
                    style: TextStyle(color: Colors.yellow),
                    decoration: InputDecoration(
                      labelText: 'EUROS',
                      labelStyle: TextStyle(color: Colors.yellow),
                      prefixText: '€U', // Texto pré-definido
                      prefixStyle: TextStyle(color: Colors.yellow)
                    ),
                    onChanged: (value) {
                      double euroValue = double.tryParse(value) ?? 0.0;
                      double realValue = euroValue * 5.55; // Supondo que 1 euro = 5.55 reais
                      double dollarValue = realValue / 5.20; // Supondo que 1 euro = 1.07 dólares (5.20 reais = 1 dólar)
                      realController.text = realValue.toStringAsFixed(2);
                      dollarController.text = dollarValue.toStringAsFixed(2);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 40.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}






class creditos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Criador: \nVitor Fogaça'));
  }
}