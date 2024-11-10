import 'package:flutter/material.dart';
import '../models/project.dart';
import '../services/api_service.dart';

class ProjectFormPage extends StatefulWidget {
  @override
  _ProjectFormPageState createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final ApiService apiService = ApiService();
  String _status = 'Em andamento';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final newProject = Project(
        title: _titleController.text,
        description: _descriptionController.text,
        status: _status,
        id: '',
      );

      try {
        await apiService.createProject(newProject);
        Navigator.pop(context, true); 
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar projeto: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Projeto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um título';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _status,
                onChanged: (value) {
                  setState(() {
                    _status = value!;
                  });
                },
                items: ['Em andamento', 'Concluído', 'Pendente']
                    .map((status) => DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
