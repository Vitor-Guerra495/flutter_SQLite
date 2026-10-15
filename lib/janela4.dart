import 'package:flutter/material.dart';
import 'helper.dart';

class Janela4 extends StatefulWidget {
  const Janela4({super.key});

  @override
  State<Janela4> createState() => _Janela4State();
}

class _Janela4State extends State<Janela4> {
  TextEditingController controlaId = TextEditingController();

  Future<void> apagarDoBanco() async {
    int id = int.tryParse(controlaId.text) ?? 0;

    await DatabaseHelper.apagarCao(id);
    print('Pet ID $id apagado com sucesso!');

    controlaId.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controlaId,
              decoration: const InputDecoration(
                labelText: 'ID do pet',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              apagarDoBanco();
            },
            child: const Text('Apagar'),
          ),
        ],
      ),
    );
  }
}