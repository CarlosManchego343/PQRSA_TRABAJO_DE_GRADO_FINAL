// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../constants/Theme.dart';

class columnaBotones extends StatefulWidget {
  @override
  columnaBotonesState createState() => columnaBotonesState();
}

class columnaBotonesState extends State<columnaBotones> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(height: 15),
        FlatButton(
          onPressed: () {},
          child: Text(
            "Agregar documentos",
            style: TextStyle(color: ArgonColors.black),
          ),
          color: ArgonColors.bgBarraDeProgreso,
        ),
        SizedBox(height: 15),
        FlatButton(
          onPressed: () {},
          child: Text(
            "Terminar PQRSA",
            style: TextStyle(color: ArgonColors.black),
          ),
          color: ArgonColors.bgBarraDeProgreso,
        ),
        SizedBox(height: 15),
        FlatButton(
          onPressed: () {},
          child: Text(
            "Devolver PQRSA",
            style: TextStyle(color: ArgonColors.black),
          ),
          color: ArgonColors.bgBarraDeProgreso,
        ),
      ],
    );
  }
}
