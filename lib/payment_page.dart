import 'package:cagnotte/ListPaiementPage.dart';
import 'package:flutter/material.dart';
import 'ApiService.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final ApiService apiService = ApiService("http://localhost:3000");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late double _montant;
  late String _description;
  late String _numeroCarte; // Ajoutez cette ligne
  late int _idCagnotte;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Payment Details',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Montant'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer le montant';
                  }
                  return null;
                },
                onSaved: (value) {
                  _montant = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer la description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Numéro de carte'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer le numéro de carte';
                  }
                  return null;
                },
                onSaved: (value) {
                  _numeroCarte = value!; // Assurez-vous que _numeroCarte est bien le numéro de carte ici
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ID de la Cagnotte'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer l\'ID de la cagnotte';
                  }
                  return null;
                },
                onSaved: (value) {
                  _idCagnotte = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Call the createPaiement function to create a payment
                    try {
                      await apiService.createPaiement(_montant, _description, _numeroCarte, _idCagnotte);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Paiement créé avec succès!')),
                      );
                      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ListPaiementPage()), // Assurez-vous d'avoir le widget ListPaiementPage défini
        );  // Revenir à la page précédente après la création du paiement
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Erreur lors de la création du paiement')),
                      );
                    }
                  }
                },
                child: Text('Effectuer le paiement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
