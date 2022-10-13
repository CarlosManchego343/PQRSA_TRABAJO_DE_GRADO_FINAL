// ignore_for_file: unnecessary_brace_in_string_interps, prefer_const_constructors

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';
import 'package:flutter/foundation.dart';


class documentosPQRSA extends StatefulWidget {
  final String id;
  documentosPQRSA(this.id);
  @override
  documentosPQRSAState createState() => documentosPQRSAState();
}

class documentosPQRSAState extends State<documentosPQRSA> {
  late Future<ListResult> archivosFuturos;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    archivosFuturos =
        FirebaseStorage.instance.ref("/Archivos/${widget.id}").listAll();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Align(
            alignment: Alignment.center,
            child: Text("Documentos adjuntos",
                style: TextStyle(fontSize: 34, color: Colores.black)),
          ),
        ),
        Divider(
          height: 40.0,
          thickness: 1.5,
          indent: 32.0,
          endIndent: 32.0,
          color: Colores.black,
        ),
        FutureBuilder<ListResult>(
            future: archivosFuturos,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final archivosEncontrados = snapshot.data!.items;
                return ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: archivosEncontrados.length,
                  itemBuilder: (context, index) {
                    final archivoMostrado = archivosEncontrados[index];
                    return ListTile(
                      title: Text(archivoMostrado.name),
                    );
                  },
                );
              } else {
                return const Center(child: Text("No se encuentran documentos"));
              }
            })
      ],
    );
  }
}
