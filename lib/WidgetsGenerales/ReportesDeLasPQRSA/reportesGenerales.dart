import 'package:flutter/material.dart';
import 'package:pqrsafinal/WidgetsGenerales/ReportesDeLasPQRSA/graficaDePQRSACerradas.dart';

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
            children: [graficaDePQRSACerradas()],
          )
        ],
      )
    ]);
  }
}
