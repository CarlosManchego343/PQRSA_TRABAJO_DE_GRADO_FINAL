// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:pqrsafinal/Cliente/ui/EditarCliente/contenedorEditarCliente.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class columnaBotones extends StatefulWidget {
  final String id;
  columnaBotones(this.id);
  @override
  columnaBotonesState createState() => columnaBotonesState();
}

class columnaBotonesState extends State<columnaBotones> {
  PlatformFile? archivoSeleccionado;

  CollectionReference pqrsa = FirebaseFirestore.instance.collection('PQRSA');

  CollectionReference pqrsaCerradas =
      FirebaseFirestore.instance.collection('PQRSA_cerrada');

  CollectionReference cliente =
      FirebaseFirestore.instance.collection('Cliente');

  CollectionReference datosPQRSA =
      FirebaseFirestore.instance.collection('Datos_PQRSA');

  String? idPqrsa;

  String? idCliente;

  Map? pqrsaEncontrada;

  String? numeroIdentidadCliente;

  String? tipoDePQRSA;

  Map? clienteEncontrado;

  String? fechaDeCierre;

  Map? datosDeGraficaPQRSACerradas;

  Future seleccionarArchivo() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      archivoSeleccionado = result.files.first;
    });
  }

  Future enviarArchivo() async {
    final path = 'Archivos/${widget.id}/${archivoSeleccionado!.name}';
    final archivo = archivoSeleccionado!.bytes!;

    await FirebaseStorage.instance.ref(path).putData(archivo);
  }

  void eliminarArchivo() {
    setState(() {
      archivoSeleccionado = null;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idPqrsa = widget.id;
    var fechaActual = new DateTime.now();
    fechaDeCierre = DateFormat('dd/MM/yyyy').format(fechaActual);
    pqrsa
        .where('id', isEqualTo: idPqrsa)
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                pqrsaEncontrada = snapshot.docs[0].data() as Map?;
                numeroIdentidadCliente =
                    pqrsaEncontrada!["Documento_del_cliente"];
                tipoDePQRSA = pqrsaEncontrada!["Tipo_de_pqrsa"];
              }),
              cliente
                  .where('Numero_de_documento',
                      isEqualTo: numeroIdentidadCliente)
                  .get()
                  .then((QuerySnapshot snapshot) => {
                        setState(() {
                          clienteEncontrado = snapshot.docs[0].data() as Map?;
                          idCliente = clienteEncontrado!["id"];
                        })
                      })
            });
    datosPQRSA
        .where("id", isEqualTo: "Cerradas")
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                datosDeGraficaPQRSACerradas = snapshot.docs[0].data() as Map?;
              })
            });
  }

  void cerrarPQRSA() {
    pqrsaCerradas.doc(pqrsaEncontrada!["id"]).set({
      "id": pqrsaEncontrada!["id"],
      "Area": pqrsaEncontrada!["Area"],
      "Asunto": pqrsaEncontrada!["Asunto"],
      "Documento_del_cliente": pqrsaEncontrada!["Documento_del_cliente"],
      "Documento_del_recibidor": pqrsaEncontrada!["Documento_del_recibidor"],
      "Estado": "Cerrada",
      "Fecha_de_radicacion": pqrsaEncontrada!["Fecha_de_radicacion"],
      "Fecha_de_cierre": fechaDeCierre,
      "Tipo_de_pqrsa": pqrsaEncontrada!["Tipo_de_pqrsa"],
    });
    if (pqrsaEncontrada!["Tipo_de_pqrsa"] == "Agradecimiento") {
      datosPQRSA.doc("Cerradas").update({
        "Agradecimientos": datosDeGraficaPQRSACerradas!["Agradecimientos"] + 1
      });
    } else if (pqrsaEncontrada!["Tipo_de_pqrsa"] == "Petición") {
      datosPQRSA
          .doc("Cerradas")
          .update({"Peticion": datosDeGraficaPQRSACerradas!["Peticion"] + 1});
    } else if (pqrsaEncontrada!["Tipo_de_pqrsa"] == "Queja") {
      datosPQRSA
          .doc("Cerradas")
          .update({"Queja": datosDeGraficaPQRSACerradas!["Queja"] + 1});
    } else if (pqrsaEncontrada!["Tipo_de_pqrsa"] == "Reclamo") {
      datosPQRSA
          .doc("Cerradas")
          .update({"Reclamo": datosDeGraficaPQRSACerradas!["Reclamo"] + 1});
    } else if (pqrsaEncontrada!["Tipo_de_pqrsa"] == "Sugerencia") {
      datosPQRSA
          .doc("Cerradas")
          .update({"Sugerencias": datosDeGraficaPQRSACerradas!["Sugerencias"] + 1});
    }

    pqrsa.doc(pqrsaEncontrada!["id"]).delete();
    Navigator.pushNamed(context, '/menuPrincipalPQRSA');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(height: 35),
        if (archivoSeleccionado != null)
          Container(
            child: Center(
              child: Text(archivoSeleccionado!.name),
            ),
          ),
        const SizedBox(height: 25),
        if (archivoSeleccionado != null)
          FlatButton(
            onPressed: enviarArchivo,
            child: Text(
              "Adjuntar archivo",
              style: TextStyle(color: Colores.black),
            ),
            color: Colores.Botones,
          ),
        const SizedBox(height: 25),
        if (archivoSeleccionado != null)
          FlatButton(
            onPressed: eliminarArchivo,
            child: Text(
              "Elegir otro archivo",
              style: TextStyle(color: Colores.black),
            ),
            color: Colores.Botones,
          ),
        SizedBox(height: 35),
        FlatButton(
          onPressed: seleccionarArchivo,
          child: Text(
            "Agregar documento",
            style: TextStyle(color: Colores.black),
          ),
          color: Colores.Botones,
          height: 50,
          minWidth: 100,
        ),
        SizedBox(height: 25),
        FlatButton(
          onPressed: cerrarPQRSA,
          child: Text(
            "Terminar PQRSA",
            style: TextStyle(color: Colores.black),
          ),
          color: Colores.Botones,
          height: 50,
          minWidth: 100,
        ),
        SizedBox(height: 25),
        FlatButton(
          onPressed: () {},
          child: Text(
            "Devolver PQRSA",
            style: TextStyle(color: Colores.black),
          ),
          color: Colores.Botones,
          height: 50,
          minWidth: 100,
        ),
        SizedBox(height: 25),
        FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => contenedorEditarCliente(idCliente!)));
          },
          child: Text(
            "Editar cliente",
            style: TextStyle(color: Colores.black),
          ),
          color: Colores.Botones,
          height: 50,
          minWidth: 100,
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
