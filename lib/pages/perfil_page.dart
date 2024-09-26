import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  final List<Map<String, String>> historicoTreinamentos = [
    {'nome': 'Treinamento A', 'data': '12/01/2024'},
    {'nome': 'Treinamento B', 'data': '15/03/2024'},
  ];

  final List<Map<String, dynamic>> treinamentosPendentes = [
    {'nome': 'Treinamento C', 'progresso': 0.5}, // 50% concluído
    {'nome': 'Treinamento D', 'progresso': 0.8}, // 80% concluído
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor azul
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  Icon(Icons.person, size: 100, color: Theme.of(context).colorScheme.primary), // Ícone na cor azul
                  Text('Nome: João da Silva'),
                  Text('Pontos: 100'),
                  Text('Treinamentos completados: 3'),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Seção de Histórico de Treinamentos
            Text(
              'Histórico de Treinamentos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: historicoTreinamentos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(historicoTreinamentos[index]['nome'] ?? ''),
                    subtitle: Text('Concluído em: ${historicoTreinamentos[index]['data']}'),
                    trailing: Icon(Icons.check_circle, color: Colors.green),
                  );
                },
              ),
            ),
            Divider(), // Divisor entre seções
            SizedBox(height: 20),

            // Seção de Treinamentos Pendentes
            Text(
              'Treinamentos Pendentes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: treinamentosPendentes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(treinamentosPendentes[index]['nome'] ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        LinearProgressIndicator(
                          value: treinamentosPendentes[index]['progresso'], // Progresso do treinamento
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary), // Cor azul
                        ),
                        SizedBox(height: 5),
                        Text('${(treinamentosPendentes[index]['progresso'] * 100).toInt()}% concluído'),
                      ],
                    ),
                    trailing: Icon(Icons.pending_actions, color: Theme.of(context).colorScheme.secondary), // Ícone de pendente
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
