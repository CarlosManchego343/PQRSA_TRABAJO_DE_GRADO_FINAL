import 'package:flutter/material.dart';

class documentosPQRSA extends StatefulWidget {
  @override
  documentosPQRSAState createState() => documentosPQRSAState();
}

class documentosPQRSAState extends State<documentosPQRSA> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Documentos")
              ],
            ),
          ],
        ),
      ],
    );
  }
}
