import 'package:flutter/material.dart';
import '../components/show_message.dart';

class EfetuarCalculos extends StatelessWidget {
  String calculo;
  EfetuarCalculos(this.calculo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(calculo),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 32, right: 32),
            child: CampoDeTexto(calculo),
          ),
        ),
      ),
    );
  }
}

class CampoDeTexto extends StatelessWidget {
  String tipoCalculo;
  CampoDeTexto(this.tipoCalculo, {Key? key}) : super(key: key);

  final controllerValor01 = TextEditingController(text: '');
  final controllerValor02 = TextEditingController(text: '');
  final _form = GlobalKey<FormState>();

  num? numero1;
  num? numero2;

  bool manterValor = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Valor 01',
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (double.tryParse(value!) == null) {
                return 'Erro digite um valor válido';
              }
            },
            keyboardType: TextInputType.number,
            controller: controllerValor01,
            onSaved: (value) => numero1 = double.tryParse(value!),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Valor 02',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (double.tryParse(value!) == null) {
                return 'Erro digite um valor válido';
              }
            },
            keyboardType: TextInputType.number,
            controller: controllerValor02,
            onSaved: (value) => numero2 = double.tryParse(value!),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: ElevatedButton(
              onPressed: () {
                final isValid = _form.currentState?.validate();
                if (isValid!) {
                  _form.currentState?.save();
                  if (tipoCalculo == 'Somar') {
                    var resultado = calcsoma(numero1, numero2);
                    var title = 'Resultado:';
                    var message =
                        'O resultado da soma é: ' + resultado.toString();
                    ShowMessage(context, message.toString(), title.toString())
                        .then((value) => value!
                            ? Navigator.pop(context)
                            : manterValor = false);
                  }
                  if (tipoCalculo == 'Subtrair') {
                    var resultado = calcsub(numero1, numero2);
                    var title = 'Resultado:';
                    var message =
                        'O resultado da subtração é: ' + resultado.toString();
                    ShowMessage(context, message.toString(), title.toString())
                        .then((value) => value!
                            ? Navigator.pop(context)
                            : manterValor = false);
                  }
                  if (tipoCalculo == 'Multiplicar') {
                    var resultado = calcmult(numero1, numero2);
                    var title = 'Resultado:';
                    var message = 'O resultado da multiplicação é: ' +
                        resultado.toString();
                    ShowMessage(context, message.toString(), title.toString())
                        .then((value) => value!
                            ? Navigator.pop(context)
                            : manterValor = false);
                  }
                  if (tipoCalculo == 'Dividir') {
                    var resultado = calcdiv(numero1, numero2);
                    var title = 'Resultado:';
                    if (resultado == 'Não é possível dividir por zero') {
                      var message = resultado.toString();
                      ShowMessage(context, message.toString(), title.toString())
                          .then((value) => value!
                              ? Navigator.pop(context)
                              : manterValor = false);
                    } else {
                      var message =
                          'O resultado da divisão é: ' + resultado.toString();
                      ShowMessage(context, message.toString(), title.toString())
                          .then((value) => value!
                              ? Navigator.pop(context)
                              : manterValor = false);
                    }
                  }
                }
              },
              child: const Padding(
                padding:
                    EdgeInsets.only(top: 20.0, bottom: 20, left: 80, right: 80),
                child: Text('Calcular'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

calcsoma(n1, n2) {
  return n1 + n2;
}

calcsub(n1, n2) {
  return n1 - n2;
}

calcmult(n1, n2) {
  return n1 * n2;
}

calcdiv(n1, n2) {
  var n3 = n1 / n2;
  if (n3 == double.infinity || n3.isNaN) {
    return 'Não é possível dividir por zero';
  } else {
    return n3;
  }
}
