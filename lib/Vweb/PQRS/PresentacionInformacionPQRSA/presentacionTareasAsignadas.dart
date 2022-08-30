// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pqrsafinal/Vweb/PQRS/Informaci%C3%B3nSobreTareas/informacionTareas.dart';
import 'package:pqrsafinal/Vweb/PQRS/InformacionSobreCliente/informacionCliente.dart';

import '../../../constants/Theme.dart';

class presentacionTareasAsignadas extends StatefulWidget {
  @override
  presentacionTareasAsignadasState createState() =>
      presentacionTareasAsignadasState();
}

class presentacionTareasAsignadasState
    extends State<presentacionTareasAsignadas> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text("Tareas",
                  style: TextStyle(fontSize: 34, color: ArgonColors.black)),
            ),
          ),
          Divider(
            height: 40.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
            color: ArgonColors.black,
          ),
          Row(
            children: <Widget>[informacionTareas()],
          )
        ],
      ),
      color: ArgonColors.columnaTitulos,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(5),
      elevation: 10,
    );
  }
}
