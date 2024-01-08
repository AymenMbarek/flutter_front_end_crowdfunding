// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
         child: Container(
        child: Column(
          children: [ Image.asset('assets/img/friendship.png'),
           
            Text(
              ' ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                 // Navigator.pushNamed(context, '/test');
                  Navigator.pushReplacementNamed(context, '/testpage');
                  print('welcom');
                },
                child: Text(
                  'Welcom to cagnotte',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 238, 127, 99),
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}