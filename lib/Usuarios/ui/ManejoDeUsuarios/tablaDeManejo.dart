// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pqrsafinal/Usuarios/ui/ColumnasTablaUsuarios/columnaConNumeroDeIdentificacion.dart';
import 'package:pqrsafinal/Usuarios/ui/ColumnasTablaUsuarios/tablaDeUsuarios.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class tablaDeManejo extends StatefulWidget {
  @override
  tablaDeManejoState createState() => tablaDeManejoState();
}

class tablaDeManejoState extends State<tablaDeManejo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                textColor: Colores.black,
                color: Colores.Botones,
                onPressed: () {},
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 12, bottom: 12),
                    child: Text("Agregar usuarios",
                        style: TextStyle(
                            color: Colores.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0)))),
              ],
            ),
            Row(
              children: [columnaConNumeroDeIdentificacion(), tablaDeUsuarios()],
            ),
          ],
        )),
      ),
    );
  }
}
