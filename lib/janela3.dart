import 'package:flutter/material.dart';
import 'helper.dart';

class Janela3 extends StatefulWidget {
  const Janela3({super.key});

  @override
  State<Janela3> createState() => _Janela3State();
}

class _Janela3State extends State<Janela3> {
  TextEditingController controlaId = TextEditingController();
  TextEditingController controlaNome = TextEditingController();
  TextEditingController controlaIdade = TextEditingController();

  Future<void> atualizarNoBanco() async {
    int id = int.tryParse(controlaId.text) ?? 0;

    Map<String, dynamic> dadosAtualizados = {
      'nome': controlaNome.text,
      'idade': int.tryParse(controlaIdade.text) ?? 0,
    };

    await DatabaseHelper.atualizarCao(id, dadosAtualizados);
    print('Pet ID $id atualizado com sucesso!');

    controlaId.clear();
    controlaNome.clear();
    controlaIdade.clear();
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controlaNome,
              decoration: const InputDecoration(
                labelText: 'Novo nome do pet',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controlaIdade,
              decoration: const InputDecoration(
                labelText: 'Nova idade do pet',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              atualizarNoBanco();
            },
            child: const Text('Atualizar'),
          ),
        ],
      ),
    );
  }
}