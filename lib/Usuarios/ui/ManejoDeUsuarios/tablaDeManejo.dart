// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/ColumnasTablaPQRSAActivas/tablaDePQRSA.dart';
import 'package:pqrsafinal/Usuarios/ui/AgregarUsuario/contenedorAgregarUsuario.dart';
import 'package:pqrsafinal/Usuarios/ui/ColumnasTablaUsuarios/columnaConNumeroDeIdentificacion.dart';
import 'package:pqrsafinal/Usuarios/ui/ColumnasTablaUsuarios/tablaDeUsarios.dart';
import 'package:pqrsafinal/Usuarios/ui/EditarUsuario/contenededorEditarUsuario.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class tablaDeManejo extends StatefulWidget {
  @override
  tablaDeManejoState createState() => tablaDeManejoState();
}

class tablaDeManejoState extends State<tablaDeManejo> {
  
  double _opacidad = 0;

  void _mostrarCardIngresarUsuario() {
    setState(() {
      if (_opacidad == 0) {
        _opacidad = 1;
      }
    });
  }

  void _ocultarCardIngresarUsuario() {
    setState(() {
      if (_opacidad == 1) {
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
                    Container(
                      margin: EdgeInsets.all(20),
                      child: FlatButton(
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
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 80, right: 80),
                    child: Row(
                  children: [
                    columnaConNumeroDeIdentificacion(),
                    tablaDeUsuarios(),
                  ],
                ))
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: contenedorAgregarUsuario(
                  _opacidad, _ocultarCardIngresarUsuario),
            ),
          ],
        )),
      ),
    );
  }
}

class mostrarCardUsuario extends StatelessWidget {

  final double? _opacidad;

  final Function? _ocultarCardEditarUsuario;

  final String _id;

  mostrarCardUsuario(this._opacidad, this._ocultarCardEditarUsuario, this._id);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child:
          contenedorEditarUsuario(_opacidad!, _ocultarCardEditarUsuario!, _id),
    );
  }
}
