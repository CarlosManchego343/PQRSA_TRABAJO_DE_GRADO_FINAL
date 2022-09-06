// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class columna1IBPQRSA extends StatefulWidget {
  @override
  columna1IBPQRSAState createState() => columna1IBPQRSAState();
}

class columna1IBPQRSAState extends State<columna1IBPQRSA> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Codigo:",
                      style: TextStyle(fontSize: 18, color: ArgonColors.black, fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("WAPPET-2020-00127",
                      style: TextStyle(fontSize: 18, color: ArgonColors.black)),
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
          color: ArgonColors.black,
        ),
        SizedBox(height: 5),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Fecha de radicación:",
                      style: TextStyle(fontSize: 18, color: ArgonColors.black, fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("16/09/2020",
                      style: TextStyle(fontSize: 18, color: ArgonColors.black)),
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
          color: ArgonColors.black,
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Tipo de PQRSA:",
                      style: TextStyle(fontSize: 18, color: ArgonColors.black, fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Petición",
                      style: TextStyle(fontSize: 18, color: ArgonColors.black)),
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
          color: ArgonColors.black,
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Recibida por:",
                      style: TextStyle(
                          fontSize: 18,
                          color: ArgonColors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("1007656588",
                      style: TextStyle(fontSize: 18, color: ArgonColors.black)),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
