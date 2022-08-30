import 'package:flutter/material.dart';

class ReportesArea extends StatefulWidget {
  @override
  ReportesAreaState createState() => ReportesAreaState();

}

class ReportesAreaState extends State<ReportesArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("REPORTES POR ÁREA")],
      )
    );
  }

}