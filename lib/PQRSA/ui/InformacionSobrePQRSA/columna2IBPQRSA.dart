// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class columna2IBPQRSA extends StatefulWidget {
  @override
  columna2IBPQRSAState createState() => columna2IBPQRSAState();
}

class columna2IBPQRSAState extends State<columna2IBPQRSA> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Text("Asunto:",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colores.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                      "Respuesta proyectos de inversión social vigencias 2018, 2019 y 2020",
                      style: TextStyle(fontSize: 18, color: Colores.black)),
                ),
              ],
            ),
          ],
        ),
        Divider(
          height: 40.0,
          thickness: 1.5,
          indent: 32.0,
          endIndent: 32.0,
          color: Colores.black,
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Dirijido a:",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colores.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Trevor Belmont",
                      style: TextStyle(fontSize: 18, color: Colores.black)),
                ),
              ],
            )
          ],
        ),
        Divider(
          height: 40.0,
          thickness: 1.5,
          indent: 32.0,
          endIndent: 32.0,
          color: Colores.black,
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Bloque:",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colores.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Vallemedio",
                      style: TextStyle(fontSize: 18, color: Colores.black)),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
