// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:pqrsafinal/constants/Theme.dart';
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
        DataCell(Text(documentSnapshot.get('Fecha_de_radicacion'))),
        DataCell(Text(documentSnapshot.get('Tipo_de_pqrsa'))),
        DataCell(Text(documentSnapshot.get('Area'))),
        DataCell(Text(documentSnapshot.get('Bloque'))),
        DataCell(Text(documentSnapshot.get('Dirijido_a'))),
        DataCell(Text(documentSnapshot.get('Documento_del_cliente'))),
        DataCell(Text(documentSnapshot.get('Documento_del_recibidor'))),
        DataCell(FlatButton(
          onPressed: _irADetalle,
          child: Text(
            "entrar",
            style: TextStyle(color: ArgonColors.black),
          ),
          color: ArgonColors.bgTituloLogin,
        )),
        DataCell(FlatButton(
          onPressed: _irAEditar,
          child: Text(
            "Editar",
            style: TextStyle(color: ArgonColors.black),
          ),
          color: ArgonColors.bgTituloLogin,
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
                      headingRowColor:
                          MaterialStateProperty.all(ArgonColors.columnaTitulos),
                      columns: <DataColumn>[
                        new DataColumn(label: Text('Fecha de radicación')),
                        new DataColumn(label: Text('Tipo de pqrsa')),
                        new DataColumn(label: Text('Area')),
                        new DataColumn(label: Text('Bloque')),
                        new DataColumn(label: Text('Dirijido a')),
                        new DataColumn(label: Text('Documento del cliente')),
                        new DataColumn(label: Text('Documento del recibidor')),
                        new DataColumn(label: Text('Ver a detalle')),
                        new DataColumn(label: Text('Editar')),
                      ],
                      rows:
                          _crearFilas(snapshots.data as QuerySnapshot<Object?>),
                    );
                  }))),
    );
  }
}
