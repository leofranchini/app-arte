import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciador de Projetos de Arte'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Bem-vindo ao Gerenciador de Projetos de Arte!'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/artists');
              },
              child: Text('Ver Artistas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/projects');
              },
              child: Text('Ver Projetos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/projectForm');
              },
              child: Text('Adicionar Projeto'),
            ),
          ],
        ),
      ),
    );
  }
}
