// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/EditarPQRSA/editarAreaYEstadoPQRSA.dart';
import 'package:pqrsafinal/PQRSA/ui/EditarPQRSA/editarPQRSA.dart';

import '../../../WidgetsGenerales/Theme.dart';

class contenedorEditarEstadoPQRSA extends StatefulWidget {
  final String id;
  contenedorEditarEstadoPQRSA(this.id);
  @override
  contenedorEditarEstadoPQRSAState createState() =>
      contenedorEditarEstadoPQRSAState();
}

class contenedorEditarEstadoPQRSAState
    extends State<contenedorEditarEstadoPQRSA> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference datosPQRSA =
      FirebaseFirestore.instance.collection('Datos_PQRSA');

  late Map? pqrsaEncontrada;

  late Map? datosDeGraficaPQRSAAbiertas;

  late Map? datosDeGraficaPQRSADevueltas;

  late String? pqrsaAEditar;

  late String? estadoAEditar;

  late String? tipoAEditar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pqrsaAEditar = widget.id;
    db
        .collection('PQRSA')
        .where('id', isEqualTo: pqrsaAEditar)
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                pqrsaEncontrada = snapshot.docs[0].data() as Map?;
                estadoAEditar = pqrsaEncontrada!["Estado"];
                tipoAEditar = pqrsaEncontrada!["Tipo_de_pqrsa"];
              })
            });
    datosPQRSA
        .where("id", isEqualTo: "Abiertas")
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                datosDeGraficaPQRSAAbiertas = snapshot.docs[0].data() as Map?;
              })
            });
    datosPQRSA
        .where("id", isEqualTo: "Devueltas")
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                datosDeGraficaPQRSADevueltas = snapshot.docs[0].data() as Map?;
              })
            });
  }

  void editarEstado() {
    if (tipoAEditar == "Agradecimiento") {
      datosPQRSA.doc("Abiertas").update({
        "Agradecimientos": datosDeGraficaPQRSAAbiertas!["Agradecimientos"] - 1
      });
      datosPQRSA.doc("Devueltas").update({
        "Agradecimientos": datosDeGraficaPQRSADevueltas!["Agradecimientos"] + 1
      });
    } else if (tipoAEditar == "Petición") {
      datosPQRSA.doc("Abiertas").update(
          {"Peticiones": datosDeGraficaPQRSAAbiertas!["Peticiones"] - 1});
      datosPQRSA.doc("Devueltas").update(
          {"Peticiones": datosDeGraficaPQRSADevueltas!["Peticiones"] + 1});
    } else if (tipoAEditar == "Reclamo") {
      datosPQRSA
          .doc("Abiertas")
          .update({"Reclamos": datosDeGraficaPQRSAAbiertas!["Reclamos"] - 1});
      datosPQRSA
          .doc("Devueltas")
          .update({"Reclamos": datosDeGraficaPQRSADevueltas!["Reclamos"] + 1});
    } else if (tipoAEditar == "Queja") {
      datosPQRSA
          .doc("Abiertas")
          .update({"Quejas": datosDeGraficaPQRSAAbiertas!["Quejas"] - 1});
      datosPQRSA
          .doc("Devueltas")
          .update({"Quejas": datosDeGraficaPQRSADevueltas!["Quejas"] + 1});
    } else if (tipoAEditar == "Sugerencia") {
      datosPQRSA
          .doc("Abiertas")
          .update({"Sugerencias": datosDeGraficaPQRSAAbiertas!["Sugerencias"] - 1});
      datosPQRSA
          .doc("Devueltas")
          .update({"Sugerencias": datosDeGraficaPQRSADevueltas!["Sugerencias"] + 1});
    }
    db.collection('PQRSA').doc(pqrsaAEditar).update({"Estado": "Devuelta"});
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("PQRSA editada correctamente")));
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Image.asset('assets/img/logoPQRSA.png', width: 280, height: 100),
        automaticallyImplyLeading: false,
        backgroundColor: Colores.bgCabeceraPrincipal,
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Volver atras',
                style: TextStyle(color: Colores.black, fontSize: 20),
              ))
        ],
      ),
      body: ListView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Devolver PQRSA a una area",
                        style: TextStyle(fontSize: 34, color: Colores.black)),
                  ),
                ),
                editarAreaYEstadoPQRSA(widget.id),
                Divider(
                  height: 40.0,
                  thickness: 1.5,
                  indent: 32.0,
                  endIndent: 32.0,
                  color: Colores.menuDeOpciones,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Devolver PQRSA",
                        style: TextStyle(fontSize: 34, color: Colores.black)),
                  ),
                ),
                FlatButton(
                  onPressed: editarEstado,
                  child: Text(
                    "Devolver PQRSA",
                    style: TextStyle(color: Colores.black),
                  ),
                  color: Colores.Botones,
                ),
              ],
            ),
          ]),
    );
  }
}
