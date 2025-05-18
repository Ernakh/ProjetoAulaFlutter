import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verificador de Maioridade',
      home: const VerificaMaioridadeScreen(),
    );
  }
}

class VerificaMaioridadeScreen extends StatefulWidget {
  const VerificaMaioridadeScreen({super.key});

  @override
  _VerificaMaioridadeScreenState createState() => _VerificaMaioridadeScreenState();
}

class _VerificaMaioridadeScreenState extends State<VerificaMaioridadeScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  String resultado = '';

  void verificarMaioridade() {
    final String nome = nomeController.text.trim();
    final int? idade = int.tryParse(idadeController.text.trim());

    if (nome.isEmpty || idade == null) {
      setState(() {
        resultado = 'Por favor, insira nome e idade válidos.';
      });
      return;
    }

    setState(() {
      if (idade >= 18) {
        resultado = 'Olá $nome, você é maior de idade.';
      } else {
        resultado = 'Olá $nome, você é menor de idade.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maioridade')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: idadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Idade'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: verificarMaioridade,
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 20),
            Text(
              resultado,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
