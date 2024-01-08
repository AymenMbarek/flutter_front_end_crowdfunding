import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ApiService.dart';
//ca est la page de linscription 
class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final TextEditingController _cinController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _motDePasseController = TextEditingController();

  // Créer une instance de ApiService
  final ApiService _apiService = ApiService("http://localhost:3000");

  Future<void> _inscription() async {
    final String cin = _cinController.text;
    final String nom = _nomController.text;
    final String prenom = _prenomController.text;
    final String motDePasse = _motDePasseController.text;

    try {
      // Utiliser l'instance créée pour appeler la méthode inscrireUtilisateur
      await _apiService.inscrireUtilisateur(cin, nom, prenom, motDePasse);
      // Inscription réussie
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Inscription réussie')),
      );
    } catch (e) {
      // Erreur lors de l'inscription
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'inscription')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S\'inscrire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cinController,
              decoration: InputDecoration(labelText: 'CIN'),
            ),
            TextField(
              controller: _nomController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: _prenomController,
              decoration: InputDecoration(labelText: 'Prénom'),
            ),
            TextField(
              controller: _motDePasseController,
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _inscription();
              },
              child: Text('S\'inscrire'),
            ),
          ],
        ),
      ),
    );
  }
}
