// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class tablaDePQRSA extends StatefulWidget {
  @override
  tablaDePQRSAState createState() => tablaDePQRSAState();
}

class tablaDePQRSAState extends State<tablaDePQRSA> {
  final ScrollController _scrollController = ScrollController();

  void _irADetalle() {
    Navigator.pushNamed(context, '/verADetallePQRSA');
  }

  void _irAEditar() {
    Navigator.pushNamed(context, '/editarPQRSA');
  }

  List<DataRow> _crearFilas(QuerySnapshot snapshot) {
    List<DataRow> newList =
        snapshot.docs.map((DocumentSnapshot documentSnapshot) {
      return new DataRow(cells: [
        DataCell(Center(
            child: Text(
          documentSnapshot.get('Fecha_de_radicacion'),
        ))),
        DataCell(Center(
            child: Text(
          documentSnapshot.get('Tipo_de_pqrsa'),
        ))),
        DataCell(Center(
            child: Text(
          documentSnapshot.get('Area'),
          textAlign: TextAlign.center,
        ))),
        DataCell(Center(
            child: Text(
          documentSnapshot.get('Documento_del_cliente'),
          textAlign: TextAlign.center,
        ))),
        DataCell(Center(
            child: Text(
          documentSnapshot.get('Documento_del_recibidor'),
          textAlign: TextAlign.center,
        ))),
        DataCell(FlatButton(
          onPressed: _irADetalle,
          child: Text(
            "entrar",
            style: TextStyle(color: Colores.black),
            textAlign: TextAlign.center,
          ),
          color: Colores.Botones,
        )),
        DataCell(FlatButton(
          onPressed: _irAEditar,
          child: Text(
            "Editar",
            style: TextStyle(color: Colores.black),
            textAlign: TextAlign.center,
          ),
          color: Colores.Botones,
        ))
      ]);
    }).toList();

    return newList;
  }

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
                      .collection('PQRSA')
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
                                child: Text('Fecha de radicación',
                                    style:
                                        TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Tipo de pqrsa',
                                    style:
                                        TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Area',
                                    style:
                                        TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Documento del cliente',
                                    style:
                                        TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Documento del recibidor',
                                    style:
                                        TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Ver a detalle',
                                    style:
                                        TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Editar',
                                    style:
                                        TextStyle(color: Colores.white)))),
                      ],
                      rows:
                          _crearFilas(snapshots.data as QuerySnapshot<Object?>),
                    );
                  }))),
    );
  }
}
