import 'package:flutter/material.dart';
import 'package:pqrsafinal/Usuarios/ui/EditarUsuario/editarUsuario.dart';

import '../../../WidgetsGenerales/Theme.dart';

class contenedorEditarUsuario extends StatelessWidget {
  final double opacidad;

  final Function ocultarContenedor;

  final String? id;

  contenedorEditarUsuario(this.opacidad, this.ocultarContenedor, this.id);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeOut,
      opacity: opacidad,
      child: Container(
          height: 300,
          width: 500,
          child: Card(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                        color: Colores.columnaCodigos,
                        onPressed: () => ocultarContenedor(),
                        icon: Icon(Icons.cancel_sharp))
                  ],
                ),
                editarUsuario(id: id!)
              ],
            ),
            color: Colores.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colores.columnaCodigos),
                borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.all(5),
            elevation: 10,
          )),
    );
  }
}
