// ContactFormPage.dart
import 'package:flutter/material.dart';

class ContactFormPage extends StatefulWidget {
  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire de Contact'),
        backgroundColor: Color.fromARGB(255, 226, 113, 7),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Formulaire de Contact',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: messageController,
              decoration: InputDecoration(
                labelText: 'Message',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Logique pour envoyer le message
                String message = messageController.text;
                // Vous pouvez ajouter ici la logique pour traiter le message
                // par exemple, envoyer un e-mail, sauvegarder dans une base de données, etc.
                print('Message envoyé: $message');
              },
              child: Text('Envoyer le message'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Changez la couleur du bouton
                textStyle: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
