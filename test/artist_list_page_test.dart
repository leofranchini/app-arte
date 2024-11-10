import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aplicativoarte/pages/artist_list_page.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:aplicativoarte/services/api_service.dart';
import 'package:aplicativoarte/models/artist.dart';
import 'dart:convert';


class MockClient extends Mock implements http.Client {}

void main() {
  group('Artist List Page Widget Test', () {
    late ApiService apiService;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      apiService = ApiService(client: mockClient);
    });

    testWidgets('Deve exibir uma lista de artistas', (WidgetTester tester) async {
      
      when(mockClient.get(Uri.parse('https://yourapiurl.com/artists')))
          .thenAnswer((_) async => http.Response(
              jsonEncode([
                {'id': '1', 'name': 'Artist 1', 'bio': 'Bio 1'},
                {'id': '2', 'name': 'Artist 2', 'bio': 'Bio 2'}
              ]),
              200));

      
      await tester.pumpWidget(
        MaterialApp(
          home: ArtistListPage(),
        ),
      );

      
      await tester.pumpAndSettle();

      
      expect(find.text('Artist 1'), findsOneWidget);
      expect(find.text('Artist 2'), findsOneWidget);
      expect(find.text('Bio 1'), findsOneWidget);
      expect(find.text('Bio 2'), findsOneWidget);
    });
  });
}
