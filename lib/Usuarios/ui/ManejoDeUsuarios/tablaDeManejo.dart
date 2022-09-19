import 'package:flutter/material.dart';
import 'package:pqrsafinal/Usuarios/ui/ColumnasTablaUsuarios/columnaConNumeroDeIdentificacion.dart';
import 'package:pqrsafinal/Usuarios/ui/ColumnasTablaUsuarios/tablaDeUsuarios.dart';

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
          child: Row(
            children: [
              columnaConNumeroDeIdentificacion(),
              tablaDeUsuarios()
            ],
          ),
        ),
      ),
    );
  }

}