import 'package:flutter/material.dart';
import './calculo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora 1.0'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Botoes('Somar'),
            Botoes('Subtrair'),
            Botoes('Multiplicar'),
            Botoes('Dividir')
          ],
        ),
      ),
    );
  }
}

class Botoes extends StatelessWidget {
  String title;
  Botoes(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(fixedSize: const Size(280, 55)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EfetuarCalculos(title);
            }));
          },
          child: Text(title),
        ),
      ),
    );
  }
}
