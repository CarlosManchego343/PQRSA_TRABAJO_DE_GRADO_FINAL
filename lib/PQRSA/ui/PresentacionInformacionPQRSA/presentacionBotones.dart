// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/BotonesDeVerADetalle/botones.dart';


import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class presentacionBotones extends StatefulWidget {
  @override
  presentacionBotonesState createState() =>
      presentacionBotonesState();
}

class presentacionBotonesState
    extends State<presentacionBotones> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[botones()],
          )
        ],
      ),
      color: ArgonColors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ArgonColors.columnaCodigos
        ),
        borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(5),
      elevation: 10,
    );
  }
}