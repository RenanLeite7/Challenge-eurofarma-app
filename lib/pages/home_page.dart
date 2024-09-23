import 'package:flutter/material.dart';
import 'perfil_page.dart';
import 'treinamentos_page.dart';
import 'rank_page.dart';
import 'jogos_page.dart';
import 'grupos_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eurofarma - Treinamentos'),
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor azul
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MenuButton('Perfil', Icons.person, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PerfilPage()));
            }),
            SizedBox(height: 20),
            MenuButton('Treinamentos', Icons.school, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TreinamentosPage()));
            }),
            SizedBox(height: 20), // Espaçamento entre botões
            MenuButton('Jogos', Icons.games, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => JogosPage()));
            }),
            SizedBox(height: 20), // Espaçamento entre botões
            MenuButton('Ranking', Icons.leaderboard, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RankingPage()));
            }),
            SizedBox(height: 20),
            MenuButton('Grupos', Icons.group, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GruposPage()));
            }),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  MenuButton(this.label, this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Theme.of(context).colorScheme.primary), // Ícone na cor azul
      label: Text(label, style: TextStyle(color: Theme.of(context).colorScheme.primary)), // Texto na cor azul
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 50),
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
    );
  }
}
