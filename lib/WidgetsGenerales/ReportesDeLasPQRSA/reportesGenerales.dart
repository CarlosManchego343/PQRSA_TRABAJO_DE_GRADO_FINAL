// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pqrsafinal/WidgetsGenerales/ReportesDeLasPQRSA/graficaDePQRSAAbiertas.dart';
import 'package:pqrsafinal/WidgetsGenerales/ReportesDeLasPQRSA/graficaDePQRSACerradas.dart';
import 'package:pqrsafinal/WidgetsGenerales/ReportesDeLasPQRSA/graficaDePQRSATotales.dart';
import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class ReportesGenerales extends StatefulWidget {
  @override
  ReportesGeneralesState createState() => ReportesGeneralesState();
}

class ReportesGeneralesState extends State<ReportesGenerales> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView(controller: _scrollController, children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Flexible(flex: 2, child: graficaDePQRSACerradas()),
              Flexible(flex: 2, child: graficaDePQRSATotales())
            ],
          ),
          Divider(
            height: 40.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
            color: Colores.menuDeOpciones,
          ),
          Row(
            children: [
              Flexible(flex: 2, child: graficaDePQRSAAbiertas()),
              Flexible(flex: 2, child: Text("Llename papi"))
            ],
          ),
        ],
      )
    ]);
  }
}
