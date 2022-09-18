// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class columnaBotones extends StatefulWidget {
  @override
  columnaBotonesState createState() => columnaBotonesState();
}

class columnaBotonesState extends State<columnaBotones> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(height: 50),
        FlatButton(
          onPressed: () {},
          child: Text(
            "Agregar documentos",
            style: TextStyle(color: Colores.black),
          ),
          color: Colores.Botones,
          height: 50,
          minWidth: 100,
        ),
        SizedBox(height: 50),
        FlatButton(
          onPressed: () {},
          child: Text(
            "Terminar PQRSA",
            style: TextStyle(color: Colores.black),
          ),
          color: Colores.Botones,
          height: 50,
          minWidth: 100,
        ),
        SizedBox(height: 50),
        FlatButton(
          onPressed: () {},
          child: Text(
            "Devolver PQRSA",
            style: TextStyle(color: Colores.black),
          ),
          color: Colores.Botones,
          height: 50,
          minWidth: 100,
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
