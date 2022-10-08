// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/InformacionSobreTareas/columnaTareas.dart';
import 'package:pqrsafinal/PQRSA/ui/InformacionSobreTareas/contenedorAgregarUnaTarea.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class informacionTareas extends StatefulWidget {
  final String id;
  informacionTareas(this.id);
  @override
  informacionTareasState createState() => informacionTareasState();
}

class informacionTareasState extends State<informacionTareas> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
            height: 320.0,
            child: ListView(
              controller: ScrollController(),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder:(context) => contenedorAgregarUnaTarea(widget.id) )
                            );
                        },
                        child: Text(
                          "Agregar Tareas",
                          style: TextStyle(color: Colores.black),
                        ),
                        color: Colores.Botones,
                        height: 50,
                        minWidth: 100,
                      ),
                    ),
                    SizedBox(height: 15),
                    columnaTareas(widget.id)
                  ],
                )
              ],
            )));
  }
}
