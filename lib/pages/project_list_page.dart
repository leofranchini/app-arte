import 'package:flutter/material.dart';
import '../models/project.dart';
import '../services/api_service.dart';
import 'project_form_page.dart';

class ProjectListPage extends StatefulWidget {
  @override
  _ProjectListPageState createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  final ApiService apiService = ApiService();
  List<Project> projects = [];

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    try {
      final fetchedProjects = await apiService.fetchProjects();
      setState(() {
        projects = fetchedProjects;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar projetos: $e')),
      );
    }
  }

  void _navigateToAddProject() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProjectFormPage()),
    );

    if (result == true) {
      _loadProjects(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Projetos'),
      ),
      body: projects.isEmpty
          ? Center(child: CircularProgressIndicator()) 
          : ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(projects[index].title),
                  subtitle: Text(projects[index].description),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddProject,
        child: Icon(Icons.add),
        tooltip: 'Adicionar Novo Projeto',
      ),
    );
  }
}
