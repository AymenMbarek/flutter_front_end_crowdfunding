import 'package:flutter/material.dart';
import 'CreateCagnottePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color.fromARGB(255, 226, 113, 7),
      ),
      body: Column(
        children: [
          // Small Image at the top
          
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background Image
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    'assets/img/crowdfunding.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Centered Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateCagnottePage()),
                      );
                    },
                    child: Text('Démarrer une cagnotte'),
                  ),
                ),
              ],
            ),
          ),
          // Large Image at the bottom
         
        ],
      ),
    );
  }
}
