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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Ação ao clicar para ver mais detalhes do grupo
                        },
                        child: Text('Ver Detalhes'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Ação para acessar o chat do grupo
                          _abrirChatDeGrupo(context, grupo['nome']);
                        },
                        child: Text('Abrir Chat'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // Botão flutuante para criar novo grupo
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _criarGrupoCustomizado(context); // Função para criar um novo grupo
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor azul
      ),
    );
  }

  // Função para abrir o chat do grupo
  void _abrirChatDeGrupo(BuildContext context, String nomeGrupo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(nomeGrupo: nomeGrupo),
      ),
    );
  }

  // Função para criar um grupo customizado
  void _criarGrupoCustomizado(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String novoGrupo = '';
        return AlertDialog(
          title: Text('Criar Grupo Customizado'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Nome do Grupo'),
            onChanged: (value) {
              novoGrupo = value; // Captura o nome do grupo inserido
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (novoGrupo.isNotEmpty) {
                  // Implementar a lógica de criação de grupo customizado aqui
                  // Exemplo: adicionar o novo grupo à lista de grupos
                  grupos.add({
                    'nome': novoGrupo,
                    'participantes': ['Você'], // Adiciona o criador ao grupo
                  });
                }
                Navigator.of(context).pop(); // Fechar o diálogo
              },
              child: Text('Criar'),
            ),
          ],
        );
      },
    );
  }
}

// Página do Chat de Grupo
class ChatPage extends StatelessWidget {
  final String nomeGrupo;

  ChatPage({required this.nomeGrupo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat - $nomeGrupo'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Text('Chat do $nomeGrupo em construção...'),
      ),
    );
  }
}
