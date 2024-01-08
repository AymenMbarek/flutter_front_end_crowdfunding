import 'package:cagnotte/CagnottesListView.dart';
import 'package:flutter/material.dart';
import 'ApiService.dart';

class CreateCagnottePage extends StatefulWidget {
  @override
  _CreateCagnottePageState createState() => _CreateCagnottePageState();
}

class _CreateCagnottePageState extends State<CreateCagnottePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService("http://localhost:3000");

  late String _nomCagnotte;
  late String _descriptionCagnotte;
  late double _montantCagnotte;
  late String _photoUrlCagnotte;
  late DateTime _dateCreationCagnotte = DateTime.now(); // Set initial value
  late int _idUtilisateurCagnotte;
  late int _idCategoriesCagnotte;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateCreationCagnotte,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _dateCreationCagnotte) {
      setState(() {
        _dateCreationCagnotte = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer une cagnotte'),
        backgroundColor: Color.fromARGB(255, 65, 5, 5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Formulaire de création de cagnotte'),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom de la cagnotte'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nomCagnotte = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description de la cagnotte'),
                onSaved: (value) {
                  _descriptionCagnotte = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Montant à collecter'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un montant';
                  }
                  return null;
                },
                onSaved: (value) {
                  _montantCagnotte = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL de la photo de la cagnotte'),
                onSaved: (value) {
                  _photoUrlCagnotte = value!;
                },
              ),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Date de création de la cagnotte'),
                    controller: TextEditingController(
                      text: "${_dateCreationCagnotte.toLocal()}".split(' ')[0],
                    ),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ID de l\'utilisateur'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _idUtilisateurCagnotte = int.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ID de la catégorie'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _idCategoriesCagnotte = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    try {
                      await _apiService.createCagnotte(
                        _nomCagnotte,
                        _descriptionCagnotte,
                        _montantCagnotte,
                        _photoUrlCagnotte,
                        _dateCreationCagnotte,
                        _idUtilisateurCagnotte,
                        _idCategoriesCagnotte,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Cagnotte créée avec succès!')),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CagnottesListView()),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Erreur lors de la création de la cagnotte')),
                      );
                    }
                  }
                },
                child: Text('Créer la cagnotte'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
