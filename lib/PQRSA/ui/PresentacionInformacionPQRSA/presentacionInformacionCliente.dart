// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pqrsafinal/Cliente/ui/InformacionSobreCliente/informacionCliente.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class presentacionInformacionCliente extends StatefulWidget {
  final String id;
  presentacionInformacionCliente(this.id);
  @override
  presentacionInformacionClienteState createState() =>
      presentacionInformacionClienteState();
}

class presentacionInformacionClienteState
    extends State<presentacionInformacionCliente> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text("Datos del radicante",
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
            children: <Widget>[informacionCliente(widget.id)],
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
