// ignore_for_file: unnecessary_new, prefer_const_constructors, camel_case_types, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class tablaDeUsuarios extends StatefulWidget {
  @override
  tablaDeUsuariosState createState() => tablaDeUsuariosState();
}

List<DataRow> _crearFilas(QuerySnapshot snapshot) {
    List<DataRow> newList =
        snapshot.docs.map((DocumentSnapshot documentSnapshot) {
      return new DataRow(cells: [
        DataCell(Center(
            child: Text(
          documentSnapshot.get('Nombre'),
        ))),
        DataCell(Center(
            child: Text(
          documentSnapshot.get('Correo'),
        ))),
        DataCell(Center(
            child: Text(
          documentSnapshot.get('Area'),
          textAlign: TextAlign.center,
        ))),
        DataCell(Center(
            child: Text(
          documentSnapshot.get('Rol'),
          textAlign: TextAlign.center,
        ))),
        DataCell(FlatButton(
          onPressed: () {},
          child: Text(
            "Editar",
            style: TextStyle(color: Colores.black),
            textAlign: TextAlign.center,
          ),
          color: Colores.Botones,
        )),
        DataCell(FlatButton(
          onPressed: () {},
          child: Text(
            "Eliminar",
            style: TextStyle(color: Colores.black),
            textAlign: TextAlign.center,
          ),
          color: Colores.Botones,
        ))
      ]);
    }).toList();

    return newList;
  }


class tablaDeUsuariosState extends State<tablaDeUsuarios> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          scrollbarOrientation: ScrollbarOrientation.bottom,
          thickness: 10,
          radius: Radius.circular(20),
          child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Usuarios')
                      .snapshots(),
                  builder: (context, snapshots) {
                    if (!snapshots.hasData) return Text('Cargando...');
                    return new DataTable(
                      border: TableBorder.all(width: 1.0, color: Colores.black),
                      headingRowColor:
                          MaterialStateProperty.all(Colores.columnaTitulos),
                      columns: <DataColumn>[
                        new DataColumn(
                            label: Center(
                                child: Text('Nombre',
                                    style: TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Correo',
                                    style: TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Area',
                                    style: TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Rol',
                                    style: TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Editar',
                                    style: TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Eliminar',
                                    style: TextStyle(color: Colores.white)))),
                      ],
                      rows:
                          _crearFilas(snapshots.data as QuerySnapshot<Object?>),
                    );
                  }))),
    );
  }
}
