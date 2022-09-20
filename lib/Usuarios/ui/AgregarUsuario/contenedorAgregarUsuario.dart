import 'package:flutter/material.dart';
import 'package:pqrsafinal/Usuarios/ui/AgregarUsuario/agregarUsuario.dart';

import '../../../WidgetsGenerales/Theme.dart';

class contenedorAgregarUsuario extends StatefulWidget {
  @override
  contenedorAgregarUsuarioState createState() =>
      contenedorAgregarUsuarioState();
}

class contenedorAgregarUsuarioState extends State<contenedorAgregarUsuario> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        width: 500,
        child: Card(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.cancel_sharp))
            ],
          ),
          agregarUsuario()
        ],
      ),
      color: Colores.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colores.columnaCodigos),
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(5),
      elevation: 10,
    ));
  }
}
