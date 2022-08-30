import 'package:flutter/material.dart';

class ReportesGenerales extends StatefulWidget {
  @override
  ReportesGeneralesState createState() => ReportesGeneralesState();

}

class ReportesGeneralesState extends State<ReportesGenerales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("REPORTES GENERALES")],
      )
    );
  }

}