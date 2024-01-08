// ContactPage.dart
import 'package:flutter/material.dart';
import 'ContactFormPage.dart'; // Import the contact form page

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactez-nous'),
        backgroundColor: Color.fromARGB(255, 226, 113, 7),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nhésitez pas à nous contacter !',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Adresse email : contact@votresite.com',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Téléphone : +216 ',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the contact form page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactFormPage()),
                );
              },
              child: Text('Envoyer un message'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Change the color of the button
                textStyle: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
