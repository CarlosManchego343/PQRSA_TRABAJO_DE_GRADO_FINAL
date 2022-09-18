import 'package:flutter/material.dart';

class tablaDeManejo extends StatefulWidget {
  @override
  tablaDeManejoState createState() => tablaDeManejoState();
}

class tablaDeManejoState extends State<tablaDeManejo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Acá va la tabla")],
      )
    );
  }

}