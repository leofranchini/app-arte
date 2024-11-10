import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/artist.dart';
import '../models/project.dart';

class ApiService {
  final String baseUrl = 'http://localhost:3000';

  Future<List<Artist>> fetchArtists() async {
    final response = await http.get(Uri.parse('$baseUrl/artists'));
    if (response.statusCode == 200) {
      final List<dynamic> artistJson = json.decode(response.body);
      return artistJson.map((json) => Artist.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar artistas');
    }
  }

  Future<List<Project>> fetchProjects() async {
    final response = await http.get(Uri.parse('$baseUrl/projects'));
    if (response.statusCode == 200) {
      final List<dynamic> projectJson = json.decode(response.body);
      return projectJson.map((json) => Project.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar projetos');
    }
  }

  Future<void> createArtist(Artist artist) async {
    final response = await http.post(
      Uri.parse('$baseUrl/artists'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(artist.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Erro ao criar artista');
    }
  }

  Future<void> createProject(Project project) async {
    final response = await http.post(
      Uri.parse('$baseUrl/projects'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(project.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Erro ao criar projeto');
    }
  }
}
