// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/InformacionSobreTareas/informacionTareas.dart';
import 'package:pqrsafinal/Cliente/ui/InformacionSobreCliente/informacionCliente.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

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
                  style: TextStyle(fontSize: 34, color: Colores.black)),
            ),
          ),
          Divider(
            height: 40.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
            color: Colores.black,
          ),
          Row(
            children: <Widget>[informacionTareas()],
          )
        ],
      ),
      color: Colores.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colores.columnaCodigos
        ),
        borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(5),
      elevation: 10,
    );
  }
}
