import 'package:flutter/material.dart';
import 'CagnottesListView.dart';
import 'categories_list.dart';
import 'CreateCagnottePage.dart';
import 'ListPaiementPage.dart';
import 'payment_page.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CagnottesListView()),
                );
              },
              child: Text('Affichage Liste Cagnottes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesList()),
                );
              },
              child: Text('Affichage Liste Categories'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateCagnottePage()),
                );
              },
              child: Text('Création de Cagnotte'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPaiementPage()),
                );
              },
              child: Text('Affichage Liste Paiements'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
              child: Text('Création de Paiement'),
            ),
          ],
        ),
      ),
    );
  }
}
