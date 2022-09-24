// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pqrsafinal/Usuarios/ui/AgregarUsuario/contenedorAgregarUsuario.dart';
import 'package:pqrsafinal/Usuarios/ui/ColumnasTablaUsuarios/columnaConNumeroDeIdentificacion.dart';
import 'package:pqrsafinal/Usuarios/ui/ColumnasTablaUsuarios/tablaDeUsuarios.dart';
import 'package:pqrsafinal/Usuarios/ui/EditarUsuario/contenededorEditaUsuario.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class tablaDeManejo extends StatefulWidget {
  @override
  tablaDeManejoState createState() => tablaDeManejoState();
}

class tablaDeManejoState extends State<tablaDeManejo> {

  double _opacidad = 0;

  void _mostrarCardIngresarUsuario() {
    setState(() {
      if(_opacidad == 0) {
        _opacidad = 1;
      }
    });
  }

  void _ocultarCardIngresarUsuario() {
    setState(() {
      if(_opacidad == 1) {
        _opacidad = 0;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Stack(
          children: [
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                        textColor: Colores.black,
                        color: Colores.Botones,
                        onPressed: _mostrarCardIngresarUsuario,
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
                  children: [
                    columnaConNumeroDeIdentificacion(),
                    tablaDeUsuarios()
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: contenedorAgregarUsuario(_opacidad, _ocultarCardIngresarUsuario),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: contenedorEditarUsuario(0, (){}, '34f9337d-af64-44f2-8d2b-b6f427ee5846'),
            ),
          ],
        )),
      ),
    );
  }
}
