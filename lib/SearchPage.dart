import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
Future<void> _searchCagnottes(String searchTerm) async {
  final response = await http.post(
    Uri.parse('http://localhost:8081/search'), // Replace this URL with your server URL
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'searchTerm': searchTerm}),
  );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      // TODO: Mettez à jour votre interface utilisateur pour afficher les résultats de la recherche
      // _afficherResultatsRecherche(data);
    } else {
      // TODO: Gérez les erreurs
      print('Erreur lors de la recherche de cagnottes : ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rechercher des cagnottes'),
        backgroundColor: Color.fromARGB(255, 226, 113, 7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      // TODO: Effacez également les résultats de la recherche
                    },
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _searchCagnottes(_searchController.text);
                },
                child: Text('Rechercher des Cagnottes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchPage(),
  ));
}
