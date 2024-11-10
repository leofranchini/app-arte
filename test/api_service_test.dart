//import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:aplicativoarte/services/api_service.dart';
import 'package:mockito/mockito.dart';
import 'package:aplicativoarte/models/artist.dart';
import 'package:aplicativoarte/models/project.dart';


class MockClient extends Mock implements http.Client {}

void main() {
  group('ApiService', () {
    late ApiService apiService;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      apiService = ApiService(client: mockClient);
    });

    test('Deve carregar a lista de artistas com sucesso', () async {
      
      final artistJson = '[{"id": 1, "name": "Artist 1", "bio": "Bio 1"}]';
      when(mockClient.get(Uri.parse('assets/data.json/artists')))
          .thenAnswer((_) async => http.Response(artistJson, 200));

      
      final artists = await apiService.fetchArtists();

      
      expect(artists, isA<List<Artist>>());
      expect(artists.length, 1);
      expect(artists[0].name, 'Artist 1');
    });

    test('Deve retornar erro ao carregar artistas', () async {

      when(mockClient.get(Uri.parse('assets/data.json/artists')))
          .thenAnswer((_) async => http.Response('Erro', 500));

      
      final call = apiService.fetchArtists();

      
      expect(() => call, throwsException);
    });

    test('Deve carregar a lista de projetos com sucesso', () async {
    
      final projectJson = '[{"id": 1, "title": "Project 1", "description": "Description 1", "status": "active"}]';
      when(mockClient.get(Uri.parse('assets/data.json/projects')))
          .thenAnswer((_) async => http.Response(projectJson, 200));

    
      final projects = await apiService.fetchProjects();

      
      expect(projects, isA<List<Project>>());
      expect(projects.length, 1);
      expect(projects[0].title, 'Project 1');
    });

    test('Deve retornar erro ao carregar projetos', () async {
    
      when(mockClient.get(Uri.parse('assets/data.json/projects')))
          .thenAnswer((_) async => http.Response('Erro', 500));

    
      final call = apiService.fetchProjects();

      
      expect(() => call, throwsException);
    });
  });
}
