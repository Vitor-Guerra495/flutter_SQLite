import 'package:flutter/material.dart';
import 'helper.dart';

class Janela2 extends StatefulWidget {
  const Janela2({super.key});

  @override
  State<Janela2> createState() => _Janela2State();
}

class _Janela2State extends State<Janela2> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DatabaseHelper.buscarTodos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Erro ao carregar dados: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Nenhum pet cadastrado.'),
          );
        }

        final listaPets = snapshot.data!;

        return SingleChildScrollView(
          child: Column(
            children: listaPets.map((pet) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('ID: ${pet['id']}'),
                    Text('Pet: ${pet['nome']}'),
                    Text('Idade: ${pet['idade']}'),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}