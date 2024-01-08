import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: const Color.fromARGB(255, 128, 11, 11),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/img/1.png', // Replace with your logo asset
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  'About Crowdfunding Cagnotte',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome to Crowdfunding Cagnotte, your platform for creating and supporting fundraising campaigns. Whether you have a cause to support or want to contribute to a meaningful project, we provide a space for individuals and organizations to come together.',
                ),
                SizedBox(height: 10),
                Text(
                  'Our Mission',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Empower people to make a positive impact by connecting them with the resources they need to bring their ideas to life.',
                ),
                SizedBox(height: 10),
                Text(
                  'How It Works',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '1. Create a Cagnotte: Start a fundraising campaign for your project or cause.',
                ),
                Text(
                  '2. Support Others: Explore and contribute to campaigns that resonate with you.',
                ),
                Text(
                  '3. Make a Difference: Join a community of changemakers and make a positive impact.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
