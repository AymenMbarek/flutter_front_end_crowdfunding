import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ApiService.dart';
import 'AdminPage.dart'; // Importer la page AdminPage
import 'LoginPage.dart'; // Importer la page InscriptionPage

class ConnectePage extends StatefulWidget {
  @override
  _ConnectePageState createState() => _ConnectePageState();
}

class _ConnectePageState extends State<ConnectePage> {
  final TextEditingController _cinController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService("http://localhost:3000");

  bool _isLoading = false;

  Future<void> _login() async {
    if (_isLoading) return;

    final String cin = _cinController.text;
    final String password = _passwordController.text;

    try {
      setState(() {
        _isLoading = true;
      });

      await _apiService.connecterUtilisateur(cin, password);

      // Connexion réussie, redirection vers la page AdminPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminPage()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Connexion réussie. Redirection...'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur de connexion. Vérifiez vos informations.'),
          duration: Duration(seconds: 2),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _navigateToInscriptionPage() {
    // Redirection vers la page InscriptionPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InscriptionPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Se connecter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cinController,
              decoration: InputDecoration(labelText: 'CIN'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
              onChanged: (value) {
                if (value.length < 6) {
                  // Affiche un message à l'utilisateur pour indiquer la longueur minimale du mot de passe
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _login,
              child: Text('Se connecter'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _navigateToInscriptionPage,
              child: Text('Inscription'),
            ),
          ],
        ),
      ),
    );
  }
}
