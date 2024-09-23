import 'package:flutter/material.dart';

class GruposPage extends StatelessWidget {
  final List<Map<String, dynamic>> grupos = [
    {
      'nome': 'Grupo A',
      'participantes': ['Você', 'Maria', 'Carlos', 'Ana'],
    },
    {
      'nome': 'Grupo B',
      'participantes': ['Você', 'Lucia', 'Felipe', 'Mariana'],
    },
    {
      'nome': 'Grupo C',
      'participantes': ['Você', 'Camila', 'Paulo', 'Fernanda'],
    },
    {
      'nome': 'Grupo D',
      'participantes': ['Você', 'Laura', 'André', 'Juliana'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grupos'),
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor azul
      ),
      body: ListView.builder(
        itemCount: grupos.length,
        itemBuilder: (context, index) {
          final grupo = grupos[index]; // Acessa o grupo atual
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        grupo['nome'],
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      IconButton(
                        icon: Icon(Icons.phone, color: Theme.of(context).colorScheme.primary),
                        onPressed: () {
                          // Ação ao clicar no botão de chamada
                          print('Entrando em chamada com o ${grupo['nome']}');
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  ...grupo['participantes'].map<Widget>((participante) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(participante),
                    );
                  }).toList(),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Ação ao clicar para ver mais detalhes do grupo
                    },
                    child: Text('Ver Detalhes'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
