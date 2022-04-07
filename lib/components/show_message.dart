import 'package:flutter/material.dart';

Future<bool?> ShowMessage(
    BuildContext context, String message, String title) async {
  bool? result = false;
  await showDialog<bool>(
      context: context,
      builder: (contex) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Tela inicial')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Continuar a somar')),
            ],
          )).then((value) => result = value);
  return result;
}
