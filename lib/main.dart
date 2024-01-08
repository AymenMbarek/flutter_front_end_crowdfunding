import 'dart:async';
import 'package:cagnotte/AdminPage.dart';
import 'package:cagnotte/CagnottesListView.dart';
import 'package:cagnotte/CreateCagnottePage.dart';
import 'package:cagnotte/ListPaiementPage.dart';
import 'package:cagnotte/LoginPage.dart';
import 'package:cagnotte/categories_list.dart';
import 'package:cagnotte/connecte.dart';
import 'package:cagnotte/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:cagnotte/components/login_page.dart';
import 'package:cagnotte/TestPage.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(),
              '/testpage': (context) => ConnectePage(),
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
        '/page3': (context) => Page3(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed('/page1');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logoo.png',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 30),
            Text(
              'Crowdfunding App',
              style: TextStyle(
                fontSize: 30,
                backgroundColor: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Change to spaceBetween
  children: [
    SizedBox(), // Add an empty SizedBox for spacing on the left
    ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/page2');
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      child: Text('Skip'),
    ),
  ],
),

            SizedBox(height: 30),
            Image.asset(
              'assets/img/medical.png',
              width: 250,
              height: 250,
            ),
            SizedBox(height: 30),
            Text(
              'With your support, countless people will get medical support and a happy life',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/page2');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/page1');
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      child: Text('Previous'),
    ),
    ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/page3');
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      child: Text('Skip'),
    ),
  ],
),

            SizedBox(height: 30),
            Image.asset(
              'assets/img/cagnotte.png',
              width: 350,
              height: 350,
            ),
            SizedBox(height: 30),
            Text(
              'Organization set up to provide help raise money for those in need',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/page3');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/page2');
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      child: Text('Previous'),
    ),
    SizedBox(), // Add an empty SizedBox for spacing on the right
  ],
),

            SizedBox(height: 30),
            Image.asset(
              'assets/img/education.png',
              width: 250,
              height: 250,
            ),
            SizedBox(height: 30),
            Text(
              'Education is the tool that breaks down all barriers',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/testpage');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              child: Text('login'),
            ),
          ],
        ),
      ),
    );
  }
}