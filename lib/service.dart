import 'dart:convert';
import 'package:http/http.dart' as http;

class ProjetService {
  final String baseUrl;

  ProjetService(this.baseUrl);

  Future<List<dynamic>> fetchProjets() async {
    final response = await http.get(Uri.parse('$baseUrl/api/projets'));

    if (response.statusCode == 200) {
      // Convertissez le corps de la réponse en une liste d'objets Dart
      List<dynamic> projets = json.decode(response.body);
      return projets;
    } else {
      // Gérez les erreurs
      throw Exception('Erreur de requête : ${response.statusCode}');
    }
  }
}

// Utilisation de la classe de service
Future<void> fetchData() async {
  final projetService = ProjetService('jdbc:mysql://localhost:3306/crowdfunding');
  
  try {
    final projets = await projetService.fetchProjets();
    // Traitez les données renvoyées par le backend
    print(projets);
  } catch (e) {
    // Gérez les erreurs
    print('Erreur: $e');
  }
}
