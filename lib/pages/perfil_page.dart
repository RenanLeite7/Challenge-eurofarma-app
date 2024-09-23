import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor azul
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.person, size: 100, color: Theme.of(context).colorScheme.primary), // Ícone na cor azul
            Text('Nome: João da Silva'),
            Text('Pontos: 100'),
            Text('Treinamentos completados: 3'),
          ],
        ),
      ),
    );
  }
}
