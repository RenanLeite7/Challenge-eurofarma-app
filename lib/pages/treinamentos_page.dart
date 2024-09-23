import 'package:flutter/material.dart';

class TreinamentosPage extends StatelessWidget {
  final List<Map<String, dynamic>> treinamentosConcluidos = [
    {'nome': 'Treinamento A', 'concluido': true},
    {'nome': 'Treinamento B', 'concluido': true},
  ];

  final List<Map<String, dynamic>> treinamentosPendentes = [
    {'nome': 'Treinamento C', 'progresso': 0.5}, // 50% concluído
    {'nome': 'Treinamento D', 'progresso': 0.8}, // 80% concluído
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treinamentos'),
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor azul
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Treinamentos Concluídos
            Text(
              'Treinamentos Concluídos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(height: 10),
            ...treinamentosConcluidos.map((treinamento) {
              return ListTile(
                title: Text(treinamento['nome']),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Ação ao clicar no botão
                  },
                  child: Text('Ver Detalhes'),
                ),
              );
            }).toList(),
            Divider(), // Divisor entre seções
            SizedBox(height: 20),

            // Treinamentos Pendentes
            Text(
              'Treinamentos Pendentes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(height: 10),
            ...treinamentosPendentes.map((treinamento) {
              return ListTile(
                title: Text(treinamento['nome']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: treinamento['progresso'], // Progresso do treinamento
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary), // Cor azul
                    ),
                    SizedBox(height: 5),
                    Text('${(treinamento['progresso'] * 100).toInt()}% concluído'),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Ação ao clicar no botão
                  },
                  child: Text('Continuar'),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
