// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class tablaDeTareas extends StatefulWidget {
  final String id;
  tablaDeTareas(this.id);
  @override
  tablaDeTareasState createState() => tablaDeTareasState();
}

class tablaDeTareasState extends State<tablaDeTareas> {
  final ScrollController _scrollController = ScrollController();

  List<DataRow> _crearFilas(QuerySnapshot snapshot) {
    List<DataRow> newList =
        snapshot.docs.map((DocumentSnapshot documentSnapshot) {
      return new DataRow(cells: [
        DataCell(Center(
            child: Text(
          documentSnapshot.get('Nombre'),
        ))),
        DataCell(Center(
            child: Switch(
          value: documentSnapshot.get('Estado'),
          onChanged: (value) {
            setState(() {
              FirebaseFirestore.instance
                  .collection('PQRSA')
                  .doc(widget.id)
                  .collection('Tareas')
                  .doc(documentSnapshot.id)
                  .update({"Estado": value});
            });
          },
          activeTrackColor: Colores.cuerpoSwicth,
          activeColor: Colores.bgTituloLogin,
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
          onPressed: () {
            FirebaseFirestore.instance
                  .collection('PQRSA')
                  .doc(widget.id)
                  .collection('Tareas')
                  .doc(documentSnapshot.id)
                  .delete();
          },
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                      .doc(widget.id)
                      .collection('Tareas')
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
                                child: Text('Nombre de la tarea',
                                    style: TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Estado',
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
