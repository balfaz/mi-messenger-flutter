import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  final String titolo;
  const LogoApp({Key key, @required this.titolo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150.0,
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/tag-logo.png'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              this.titolo,
              style: TextStyle(fontSize: 30.0),
            )
          ],
        ),
      ),
    );
  }
}
