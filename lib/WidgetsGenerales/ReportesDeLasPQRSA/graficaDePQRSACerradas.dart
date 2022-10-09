import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class graficaDePQRSACerradas extends StatefulWidget {
  @override
  graficaDePQRSACerradasState createState() => graficaDePQRSACerradasState();
}

class graficaDePQRSACerradasState extends State<graficaDePQRSACerradas> {
  List<Datos>? datosDeLaGrafica;

  CollectionReference datosPQRSA =
      FirebaseFirestore.instance.collection('Datos_PQRSA');

  Map? datos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    datosPQRSA
        .where("id", isEqualTo: "Cerradas")
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                datos = snapshot.docs[0].data() as Map?;
                datosDeLaGrafica = [
                  Datos("Agradecimientos", datos!["Agradecimiento"]),
                  Datos("Quejas", datos!["Queja"]),
                  Datos("Reclamos", datos!["Reclamo"]),
                  Datos("Peticiones", datos!["Peticion"]),
                  Datos("Sugerencias", datos!["Sugerencias"])
                ];
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SfCircularChart(
        title: ChartTitle(text: "Cantidad de PQRSA cerradas"),
        legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        series: <CircularSeries>[
          PieSeries<Datos, String>(
              dataSource: datosDeLaGrafica!,
              xValueMapper: (Datos datos, _) => datos.nombre,
              yValueMapper: (Datos datos, _) => datos.datos,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              )      
        ],
      )
    ]);
  }
}

class Datos {
  final String nombre;
  final int datos;
  Datos(this.nombre, this.datos);
}
