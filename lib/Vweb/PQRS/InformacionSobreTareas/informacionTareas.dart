// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pqrsafinal/Vweb/PQRS/InformacionSobreTareas/columnaTareas.dart';

import '../../../constants/Theme.dart';

class informacionTareas extends StatefulWidget {
  @override
  informacionTareasState createState() => informacionTareasState();
}

class informacionTareasState extends State<informacionTareas> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
            height: 320.0,
            child: ListView(
              controller: ScrollController(),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    LinearProgressIndicator(
                      backgroundColor: ArgonColors.bgBarraDeProgreso,
                      valueColor:
                          AlwaysStoppedAnimation(ArgonColors.bgCuerpoLogin),
                      minHeight: 20,
                    ),
                    SizedBox(height: 15),
                    columnaTareas()
                  ],
                )
              ],
            )));
  }
}
