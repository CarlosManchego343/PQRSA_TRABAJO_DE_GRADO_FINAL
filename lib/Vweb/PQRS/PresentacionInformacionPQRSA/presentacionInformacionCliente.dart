// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pqrsafinal/Vweb/PQRS/InformacionSobreCliente/informacionCliente.dart';

import '../../../constants/Theme.dart';

class presentacionInformacionCliente extends StatefulWidget {
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
            children: <Widget>[informacionCliente()],
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
