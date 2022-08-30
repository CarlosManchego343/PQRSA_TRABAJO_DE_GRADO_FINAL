// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../constants/Theme.dart';

class columnaIC extends StatefulWidget {
  @override
  columnaICState createState() => columnaICState();
}

class columnaICState extends State<columnaIC> {
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
                  child: Text("Número de documento:",
                      style: TextStyle(
                          fontSize: 18,
                          color: ArgonColors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("1007565696",
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
                  child: Text("Nombre:",
                      style: TextStyle(
                          fontSize: 18,
                          color: ArgonColors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("León Ernesto Perez Torrez",
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
                  child: Text("Telefono:",
                      style: TextStyle(
                          fontSize: 18,
                          color: ArgonColors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("3134568970",
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
                  child: Text("Correo electronico:",
                      style: TextStyle(
                          fontSize: 18,
                          color: ArgonColors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("leonept@gmail.com",
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
                  child: Text("Dirección:",
                      style: TextStyle(
                          fontSize: 18,
                          color: ArgonColors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Carrera 3-B #45 - 06",
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
                  child: Text("Municipio:",
                      style: TextStyle(
                          fontSize: 18,
                          color: ArgonColors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Pueblo viejo",
                      style: TextStyle(fontSize: 18, color: ArgonColors.black)),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
