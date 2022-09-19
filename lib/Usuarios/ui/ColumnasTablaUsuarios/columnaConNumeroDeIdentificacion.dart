// ignore_for_file: unnecessary_new, prefer_const_constructors, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class columnaConNumeroDeIdentificacion extends StatefulWidget {
  @override
  columnaConNumeroDeIdentificacionState createState() =>
      columnaConNumeroDeIdentificacionState();
}

List<DataRow> _crearFilas(QuerySnapshot snapshot) {
  List<DataRow> newList =
      snapshot.docs.map((DocumentSnapshot documentSnapshot) {
    return new DataRow(cells: [
      DataCell(Center(
          child: Text(
        documentSnapshot.id,
      ))),
    ]);
  }).toList();

  return newList;
}

class columnaConNumeroDeIdentificacionState
    extends State<columnaConNumeroDeIdentificacion> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Usuarios').snapshots(),
        builder: (context, snapshots) {
          if (!snapshots.hasData) return Text('Cargando...');
          return new DataTable(
            border: TableBorder.all(width: 1.0, color: Colores.black),
            headingRowColor: MaterialStateProperty.all(Colores.columnaCodigos),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
              color: Colores.BordeDeInputs,
              width: 2,
            ))),
            columns: [
              new DataColumn(
                  label: Center(
                      child: Text(
                'Número de documento',
                style: TextStyle(color: Colores.white),
              )))
            ],
            rows: _crearFilas(snapshots.data as QuerySnapshot<Object?>),
          );
        });
  }
}
