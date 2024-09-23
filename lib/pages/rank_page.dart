import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  final List<Map<String, String>> ranking = [
    {'nome': 'João', 'pontos': '100'},
    {'nome': 'Maria', 'pontos': '90'},
    {'nome': 'Carlos', 'pontos': '85'},
    {'nome': 'Ana', 'pontos': '80'},
    {'nome': 'Pedro', 'pontos': '78'},
    {'nome': 'Lucia', 'pontos': '75'},
    {'nome': 'Felipe', 'pontos': '70'},
    {'nome': 'Mariana', 'pontos': '68'},
    {'nome': 'Tiago', 'pontos': '65'},
    {'nome': 'Camila', 'pontos': '62'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking'),
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor azul
      ),
      body: ListView.builder(
        itemCount: ranking.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                '${index + 1}', // Número da posição no ranking
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary, // Cor azul
            ),
            title: Text('${ranking[index]['nome']}'),
            subtitle: Text('${ranking[index]['pontos']} pontos'),
          );
        },
      ),
    );
  }
}
