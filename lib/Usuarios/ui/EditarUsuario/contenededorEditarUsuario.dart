import 'package:flutter/material.dart';
import 'package:pqrsafinal/Usuarios/ui/EditarUsuario/editarUsuario.dart';

import '../../../WidgetsGenerales/Theme.dart';

class contenedorEditarUsuario extends StatelessWidget {
  final String? id;
  contenedorEditarUsuario(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 300,
          width: 500,
          child: Card(
            child: Column(
              children: <Widget>[
                editarUsuario(id: id!)
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
