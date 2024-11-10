import 'package:flutter/material.dart';
import '../models/artist.dart';
import '../services/api_service.dart';
import 'artist_form_page.dart';

class ArtistListPage extends StatefulWidget {
  @override
  _ArtistListPageState createState() => _ArtistListPageState();
}

class _ArtistListPageState extends State<ArtistListPage> {
  final ApiService apiService = ApiService();
  List<Artist> artists = [];

  @override
  void initState() {
    super.initState();
    _loadArtists();
  }


  Future<void> _loadArtists() async {
    try {
      final fetchedArtists = await apiService.fetchArtists();
      setState(() {
        artists = fetchedArtists;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar artistas: $e')),
      );
    }
  }


  void _navigateToAddArtist() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ArtistFormPage()),
    );

    if (result == true) {
      _loadArtists(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Artistas'),
      ),
      body: artists.isEmpty
          ? Center(child: CircularProgressIndicator()) 
          : ListView.builder(
              itemCount: artists.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(artists[index].name),
                  subtitle: Text(artists[index].bio),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddArtist,
        child: Icon(Icons.add),
        tooltip: 'Adicionar Novo Artista',
      ),
    );
  }
}
