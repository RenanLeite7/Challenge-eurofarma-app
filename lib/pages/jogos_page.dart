import 'package:flutter/material.dart';

class JogosPage extends StatelessWidget {
  final List<Map<String, String>> jogos = [
    {'nome': 'Quiz', 'descricao': 'Responda perguntas e teste seus conhecimentos.'},
    {'nome': 'Memória', 'descricao': 'Jogo de memória para fixar o conteúdo dos treinamentos.'},
    {'nome': 'Palavras Cruzadas', 'descricao': 'Resolva palavras cruzadas com termos dos treinamentos.'},
    {'nome': 'Caça-Palavras', 'descricao': 'Encontre termos-chave nos caça-palavras.'},
    {'nome': 'Jogo da Forca', 'descricao': 'Adivinhe palavras relacionadas ao treinamento.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogos'),
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor azul
      ),
      body: ListView.builder(
        itemCount: jogos.length,
        itemBuilder: (context, index) {
          final jogo = jogos[index]; // Acessa corretamente o mapa
          return ListTile(
            title: Text(jogo['nome'] ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(jogo['descricao'] ?? ''),
            trailing: ElevatedButton(
              onPressed: () {
                // Ação ao clicar no botão para iniciar o jogo
              },
              child: Text('Jogar'),
            ),
          );
        },
      ),
    );
  }
}
