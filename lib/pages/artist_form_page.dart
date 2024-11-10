import 'package:flutter/material.dart';
import '../models/artist.dart';
import '../services/api_service.dart';

class ArtistFormPage extends StatefulWidget {
  @override
  _ArtistFormPageState createState() => _ArtistFormPageState();
}

class _ArtistFormPageState extends State<ArtistFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final ApiService apiService = ApiService();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {

      final artist = Artist(
        id: '', 
        name: _nameController.text,
        bio: _bioController.text,
      );

      try {
        
        await apiService.createArtist(artist);
        
        Navigator.pop(context, true);
      } catch (e) {
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar artista: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Artista'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bioController,
                decoration: InputDecoration(labelText: 'Biografia'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma biografia';
                  }
                  return null;
                },
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
