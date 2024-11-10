import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo ao Gerenciador de Projetos de Arte',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/projects');
              },
              child: Text('Ver Projetos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/artists');
              },
              child: Text('Ver Artistas'),
            ),
          ],
        ),
      ),
    );
  }
}
