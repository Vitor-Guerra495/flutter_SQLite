import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'helper.dart';
import 'janela2.dart';
import 'janela3.dart';
import 'janela4.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controlaNome = TextEditingController();
  TextEditingController controlaIdade = TextEditingController();

  Future<void> salvarNoBanco() async {
    Map<String, dynamic> novoCao = {
      'nome': controlaNome.text,
      'idade': int.tryParse(controlaIdade.text) ?? 0,
    };

    await DatabaseHelper.inserirCao(novoCao);
    print('${controlaNome.text} salvo com sucesso!');

    controlaNome.clear();
    controlaIdade.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Pets'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Salvar'),
                Tab(text: 'Listar'),
                Tab(text: 'Atualizar'),
                Tab(text: 'Apagar'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // ABA 1: SALVAR
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controlaNome,
                        decoration: const InputDecoration(
                          labelText: 'Nome do pet',
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
                          labelText: 'Idade do pet',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        salvarNoBanco();
                      },
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              ),

              // ABA 2: LISTAR
              const Janela2(),

              // ABA 3: ATUALIZAR
              const Janela3(),

              // ABA 4: APAGAR
              const Janela4(),
            ],
          ),
        ),
      ),
    );
  }
}