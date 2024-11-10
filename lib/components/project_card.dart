import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback onTap;

  ProjectCard({required this.project, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(project.title),
        subtitle: Text('Status: ${project.status}'),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
