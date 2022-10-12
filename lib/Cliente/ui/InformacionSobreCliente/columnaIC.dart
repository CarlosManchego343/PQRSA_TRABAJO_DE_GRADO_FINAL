// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class columnaIC extends StatefulWidget {
  final String id;
  columnaIC(this.id);
  @override
  columnaICState createState() => columnaICState();
}

class columnaICState extends State<columnaIC> {
  String? id;

  String? numeroIdentidadCliente;

  Map? pqrsaEncontrada;

  Map? clienteEncontrado;

  CollectionReference pqrsa = FirebaseFirestore.instance.collection('PQRSA');
  CollectionReference cliente =
      FirebaseFirestore.instance.collection('Cliente');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id;
    pqrsa.where('id', isEqualTo: id).get().then((QuerySnapshot snapshot) => {
          setState(() {
            pqrsaEncontrada = snapshot.docs[0].data() as Map?;
            numeroIdentidadCliente = pqrsaEncontrada!["Documento_del_cliente"];
          }),
          cliente
              .where('Numero_de_documento', isEqualTo: numeroIdentidadCliente)
              .get()
              .then((QuerySnapshot snapshot) => {
                    setState(() {
                      clienteEncontrado = snapshot.docs[0].data() as Map?;
                    })
                  })
        });
  }

  @override
  Widget build(BuildContext context) {
    return (clienteEncontrado != null) ?
    Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Número de documento:",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colores.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(clienteEncontrado!["Numero_de_documento"],
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
                  child: Text("Nombre:",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colores.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(clienteEncontrado!["Nombre"],
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
                  child: Text("Telefono:",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colores.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(clienteEncontrado!["Telefono"],
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
                  child: Text("Correo electronico:",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colores.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(clienteEncontrado!["Correo_electronico"],
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
                  child: Text("Dirección:",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colores.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(clienteEncontrado!["Direccion"],
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
                  child: Text("Municipio:",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colores.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(clienteEncontrado!["Municipio_de_residencia"],
                      style: TextStyle(fontSize: 18, color: Colores.black)),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 15)
      ],
    ): Container(
      child: Center(child: Text("Cargando...", style: TextStyle(color: Colores.black),)),
    );
  }
}
