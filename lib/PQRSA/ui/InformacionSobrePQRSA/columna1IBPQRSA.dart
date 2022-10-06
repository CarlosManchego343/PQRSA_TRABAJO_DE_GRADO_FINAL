// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class columna1IBPQRSA extends StatefulWidget {
  final String id;
  columna1IBPQRSA(this.id);
  @override
  columna1IBPQRSAState createState() => columna1IBPQRSAState();
}

class columna1IBPQRSAState extends State<columna1IBPQRSA> {

  late Map? informacionColumna;
  CollectionReference pqrsa = FirebaseFirestore.instance.collection('PQRSA');
  late String? id;

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
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Text("Codigo:",
                      style: TextStyle(fontSize: 18, color: Colores.black, fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(informacionColumna!["id"],
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
        SizedBox(height: 5),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Fecha de radicación:",
                      style: TextStyle(fontSize: 18, color: Colores.black, fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(informacionColumna!["Fecha_de_radicacion"],
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
                  child: Text("Tipo de PQRSA:",
                      style: TextStyle(fontSize: 18, color: Colores.black, fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(informacionColumna!["Tipo_de_pqrsa"],
                      style: TextStyle(fontSize: 18, color: Colores.black)),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
