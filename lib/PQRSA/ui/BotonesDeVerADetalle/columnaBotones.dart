// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';



import 'package:file_picker/file_picker.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class columnaBotones extends StatefulWidget {
  final String id;
  columnaBotones(this.id);
  @override
  columnaBotonesState createState() => columnaBotonesState();
}

class columnaBotonesState extends State<columnaBotones> {

 
  PlatformFile? archivoSeleccionado;

  Future seleccionarArchivo() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      archivoSeleccionado = result.files.first;
    });
  }

  Future enviarArchivo() async {
    final path = 'Archivos/${widget.id}/${archivoSeleccionado!.name}';
    final archivo = File(archivoSeleccionado!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(archivo);
  }

  void eliminarArchivo() {
    setState(() {
      archivoSeleccionado = null;
    });
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
              "Eliminar archivo",
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
          onPressed: () {},
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
          onPressed: () {},
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
