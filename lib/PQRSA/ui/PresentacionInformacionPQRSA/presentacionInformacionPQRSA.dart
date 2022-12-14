// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/InformacionSobrePQRSA/documentosPQRSA.dart';
import 'package:pqrsafinal/PQRSA/ui/InformacionSobrePQRSA/informacionBasicaPQRSA.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class presentacionInformacionPQRSA extends StatefulWidget {
  final String id;
  presentacionInformacionPQRSA(this.id);
  @override
  presentacionInformacionPQRSAState createState() =>
      presentacionInformacionPQRSAState();
}

class presentacionInformacionPQRSAState
    extends State<presentacionInformacionPQRSA> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text("Datos de la PQRSA",
                  style: TextStyle(fontSize: 34, color: Colores.black)),
            ),
          ),
          Divider(
            height: 40.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
          ),
          Row(
            children: <Widget>[informacionBasicaPQRSA(widget.id)],
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
