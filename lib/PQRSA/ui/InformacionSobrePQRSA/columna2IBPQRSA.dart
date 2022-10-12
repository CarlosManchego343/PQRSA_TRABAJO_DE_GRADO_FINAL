// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class columna2IBPQRSA extends StatefulWidget {
  final String id;
  columna2IBPQRSA(this.id);
  @override
  columna2IBPQRSAState createState() => columna2IBPQRSAState();
}

class columna2IBPQRSAState extends State<columna2IBPQRSA> {

  Map? informacionColumna;
  CollectionReference pqrsa = FirebaseFirestore.instance.collection('PQRSA');
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    pqrsa
    .where('id', isEqualTo: id)
    .get()
    .then(
      (QuerySnapshot snapshot) => {
        setState(() {
          informacionColumna = snapshot.docs[0].data() as Map?;
        }) 
      });
  }

  @override
  Widget build(BuildContext context) {
    return (informacionColumna != null) ?
    Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Text("Asunto:",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colores.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                      informacionColumna!["Asunto"],
                      style: TextStyle(fontSize: 18, color: Colores.black)),
                ),
              ],
            ),
          ],
        ),
        Divider(
          height: 40.0,
          thickness: 1.5,
          indent: 32.0,
          endIndent: 32.0,
          color: Colores.black,
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Estado:",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colores.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(informacionColumna!["Estado"],
                      style: TextStyle(fontSize: 18, color: Colores.black)),
                ),
              ],
            )
          ],
        ),
        Divider(
          height: 40.0,
          thickness: 1.5,
          indent: 32.0,
          endIndent: 32.0,
          color: Colores.black,
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Documento del recibidor",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colores.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(informacionColumna!["Documento_del_recibidor"],
                      style: TextStyle(fontSize: 18, color: Colores.black)),
                ),
              ],
            )
          ],
        ),
      ],
    ): Container(
      child: Center(child: Text("Cargando...", style: TextStyle(color: Colores.black),)),
    );
  }
}
