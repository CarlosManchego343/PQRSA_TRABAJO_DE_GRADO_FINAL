// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/BotonesDeVerADetalle/columnaBotones.dart';
import 'package:pqrsafinal/Cliente/ui/InformacionSobreCliente/columnaIC.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class botones extends StatefulWidget {
  final String id;
  botones(this.id);
  @override
  botonesState createState() => botonesState();
}

class botonesState extends State<botones> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox (
            height: 420.0,
            child: Container(
              margin: EdgeInsets.only(left: 90, top: 8, bottom: 8, right: 90),
              child: Scrollbar(
                controller: _scrollController,
                scrollbarOrientation: ScrollbarOrientation.right,
                thickness: 10,
                radius: Radius.circular(20),
                child: ListView(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  children: [columnaBotones(widget.id)],
                ),
              ),
            )));
  }
}
