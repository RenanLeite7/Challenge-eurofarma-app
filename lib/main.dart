import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Importando a tela inicial

void main() {
  runApp(EurofarmaApp());
}

class EurofarmaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eurofarma Treinamentos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF00488E), // Cor azul
          secondary: Color(0xFFFFF200), // Cor amarelo
        ),
        scaffoldBackgroundColor: Colors.white, // Fundo branco
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFF200), // Cor amarelo para botões
            foregroundColor: Color(0xFF00488E), // Texto dos botões na cor azul
            textStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: HomePage(), // Tela inicial
    );
  }
}
