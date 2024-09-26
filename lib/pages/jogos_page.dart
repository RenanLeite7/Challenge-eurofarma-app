import 'package:flutter/material.dart';

class JogosPage extends StatelessWidget {
  final List<Map<String, String>> jogos = [
    {'nome': 'Quiz', 'descricao': 'Responda perguntas e teste seus conhecimentos.'},
    {'nome': 'Memória', 'descricao': 'Jogo de memória para fixar o conteúdo dos treinamentos.'},
    {'nome': 'Palavras Cruzadas', 'descricao': 'Resolva palavras cruzadas com termos dos treinamentos.'},
    {'nome': 'Caça-Palavras', 'descricao': 'Encontre termos-chave nos caça-palavras.'},
    {'nome': 'Jogo da Forca', 'descricao': 'Adivinhe palavras relacionadas ao treinamento.'},
  ];

  final int totalTreinamentosCompletados = 3; // Quantidade de treinamentos completados
  final int pontosJogos = 100; // Pontos acumulados nos jogos

  @override
  Widget build(BuildContext context) {
    // Definir nível do usuário baseado em treinamentos concluídos ou pontos
    String nivelUsuario() {
      if (totalTreinamentosCompletados >= 10 || pontosJogos >= 500) {
        return 'Avançado';
      } else if (totalTreinamentosCompletados >= 5 || pontosJogos >= 200) {
        return 'Intermediário';
      } else {
        return 'Iniciante';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Jogos'),
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor azul
      ),
      body: Column(
        children: [
          // Exibição do nível do usuário
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nível: ${nivelUsuario()}', // Exibe o nível do usuário
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Treinamentos: $totalTreinamentosCompletados'),
                    Text('Pontos nos Jogos: $pontosJogos'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
