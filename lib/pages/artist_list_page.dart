// lib/pages/artist_list_page.dart

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
  late Future<List<Artist>> _artistsFuture;

  @override
  void initState() {
    super.initState();
    _artistsFuture = apiService.fetchArtists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artistas'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Artist>>(
                future: _artistsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro ao carregar artistas.'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Nenhum artista encontrado.'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final artist = snapshot.data![index];
                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(
                              artist.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(artist.bio ?? 'Sem biografia'),
                            contentPadding: EdgeInsets.all(15),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArtistFormPage()),
                ).then((_) => setState(() {
                      _artistsFuture = apiService.fetchArtists();
                    }));
              },
              child: Text('Adicionar Artista'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), backgroundColor: Colors.purpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
