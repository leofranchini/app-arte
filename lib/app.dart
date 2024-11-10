import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';
import 'pages/project_list_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Projetos de Arte',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardPage(),
        '/projects': (context) => ProjectListPage(),
        // 
      },
    );
  }
}
