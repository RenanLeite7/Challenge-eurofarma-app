import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  final List<Map<String, dynamic>> ranking = [
    {'nome': 'João', 'pontos': 100},
    {'nome': 'Maria', 'pontos': 90},
    {'nome': 'Carlos', 'pontos': 85},
    {'nome': 'Ana', 'pontos': 80},
    {'nome': 'Pedro', 'pontos': 78},
    {'nome': 'Lucia', 'pontos': 75},
    {'nome': 'Felipe', 'pontos': 70},
    {'nome': 'Mariana', 'pontos': 68},
    {'nome': 'Tiago', 'pontos': 65},
    {'nome': 'Camila', 'pontos': 62},
  ];

  final String currentUser = 'João'; // Usuário logado
  final int currentUserPoints = 100; // Pontuação do usuário logado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking'),
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor azul
      ),
      body: Column(
        children: [
          // Exibir pontuação do usuário atual e posição
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sua Posição no Ranking',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Nome: $currentUser',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Pontos: $currentUserPoints',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Posição: ${ranking.indexWhere((element) => element['nome'] == currentUser) + 1}º',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: ranking.length,
              itemBuilder: (context, index) {
                final isCurrentUser = ranking[index]['nome'] == currentUser;
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '${index + 1}', // Número da posição no ranking
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: isCurrentUser
                        ? Colors.green
                        : Theme.of(context).colorScheme.primary, // Verde para o usuário atual
                  ),
                  title: Text('${ranking[index]['nome']}'),
                  subtitle: Text('${ranking[index]['pontos']} pontos'),
                  trailing: isCurrentUser
                      ? Text('Você', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
