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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: FlatButton(
                          textColor: Colores.black,
                          color: Colores.Botones,
                          onPressed: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => contenedorAgregarUsuario())
                              );
                          },
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
            ),),
      ),
    );
  }
}

