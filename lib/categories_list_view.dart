import 'package:flutter/material.dart';
import 'ApiService.dart';

class CategoriesListView extends StatefulWidget {
  @override
  _CategoriesListViewState createState() => _CategoriesListViewState();
}
//cette page je l'ai changé pour categories_list.Dart
class _CategoriesListViewState extends State<CategoriesListView> {
  final ApiService _apiService = ApiService("http://localhost:3000/api/categories");

  Future<List<Map<String, dynamic>>> _fetchCategories() async {
    try {
      final response = await _apiService.fetchData("");

      if (response != null && response is List) {
        // Convertit chaque élément de la liste JSON en Map<String, dynamic>
        List<Map<String, dynamic>> listOfMaps = (response as List).cast<Map<String, dynamic>>();
        return listOfMaps;
      } else {
        throw Exception('Erreur lors du chargement des catégories');
      }
    } catch (e) {
      // Gérer les erreurs liées à l'appel de l'API
      print('Erreur API: $e');
      throw Exception('Erreur lors du chargement des catégories');
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Liste des Catégories',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color.fromARGB(255, 65, 5, 5),
    ),
    body: FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Aucune catégorie disponible.'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final category = snapshot.data![index];
              return ListTile(
                title: Text(category['nom_Categories']),
                // Ajoute d'autres éléments de la catégorie ici si nécessaire
              );
            },
          );
        }
      },
    ),
  );
}

}
