// backend.dart
import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

Response _handleSearchRequest(Request request) {
  final Map<String, dynamic> requestBody = jsonDecode(utf8.decode(request.read() as List<int>));
  final String searchTerm = requestBody['searchTerm'] ?? '';

  // Simuler une recherche
  final List<Map<String, dynamic>> searchResults = [
    {'name': 'Cagnotte 1', 'amount': 100.0},
    {'name': 'Cagnotte 2', 'amount': 50.0},
    // Ajoutez d'autres résultats de recherche simulés ici...
  ];

  return Response.ok(jsonEncode(searchResults), headers: {'Content-Type': 'application/json'});
}

void main() {
  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler((Request request) {
        switch (request.method) {
          case 'POST':
            if (request.url.pathSegments.isNotEmpty && request.url.pathSegments.first == 'search') {
              return _handleSearchRequest(request);
            }
            break;
        }
        return Response.notFound('Not Found');
      });

  io.serve(handler, InternetAddress.anyIPv4, 8081).then((server) {
    print('Backend listening on http://${server.address.host}:${server.port}');
  });
}
