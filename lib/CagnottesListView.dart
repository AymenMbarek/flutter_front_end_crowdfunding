import 'package:flutter/material.dart';
import 'ApiService.dart';

class CagnottesListView extends StatefulWidget {
  @override
  _CagnottesListViewState createState() => _CagnottesListViewState();
}

class _CagnottesListViewState extends State<CagnottesListView> {
  final ApiService _apiService = ApiService("http://localhost:3000/api/cagnotte");

  Future<List<Map<String, dynamic>>> _fetchCagnottes() async {
    final response = await _apiService.fetchData(""); // Laisse l'endpoint vide pour récupérer toutes les cagnottes

    if (response != null && response is List) {
      List<Map<String, dynamic>> listOfMaps = List<Map<String, dynamic>>.from(response as Iterable);
      return listOfMaps;
    } else {
      throw Exception('Erreur lors du chargement des cagnottes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text(
    'Liste des Cagnottes',
    style: TextStyle(color: Colors.white),  // Définis la couleur du texte en blanc
  ),
  backgroundColor: Color.fromARGB(255, 65, 5, 5),
),

      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchCagnottes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucune cagnotte disponible.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final cagnotte = snapshot.data![index];
                return ListTile(
                  title: Text(cagnotte['nom']),
                  subtitle: Text('Montant: ${cagnotte['prix']}'), // Utilise 'prix' au lieu de 'montant'
                  // Ajoute d'autres détails de la cagnotte ici
                );
              },
            );
          }
        },
      ),
    );
  }
}
