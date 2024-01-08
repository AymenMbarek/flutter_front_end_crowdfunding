import 'package:flutter/material.dart';
import 'ApiService.dart';

class ListPaiementPage extends StatefulWidget {
  @override
  _ListPaiementPageState createState() => _ListPaiementPageState();
}

class _ListPaiementPageState extends State<ListPaiementPage> {
  final ApiService apiService = ApiService("http://localhost:3000");
  late List<Map<String, dynamic>> paiements;

  @override
  void initState() {
    super.initState();
    loadPaiements();
  }

  Future<void> loadPaiements() async {
    try {
      // Appel de la fonction fetchData pour récupérer la liste des paiements
      List<Map<String, dynamic>> data = await apiService.fetchData("api/paiement");

      // Met à jour l'état de la liste des paiements
      setState(() {
        paiements = data;
      });
    } catch (e) {
      // Gestion des erreurs
      print('Error loading paiements: $e');
      // Vous pouvez ajouter une logique pour afficher un message d'erreur à l'utilisateur
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Paiements'),
      ),
      body: ListView.builder(
        itemCount: paiements.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Paiement ${paiements[index]['id']}'),
            subtitle: Text('Montant: ${paiements[index]['montant']}'),
          );
        },
      ),
    );
  }
}
