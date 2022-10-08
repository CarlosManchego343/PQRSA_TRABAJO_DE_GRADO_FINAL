import 'package:flutter/material.dart';
import 'package:pqrsafinal/Usuarios/ui/EditarUsuario/editarUsuario.dart';

import '../../../WidgetsGenerales/Theme.dart';


class contenedorEditarUsuario extends StatefulWidget {
  final String id;
  contenedorEditarUsuario(this.id);
  @override
  contenedorEditarUsuarioState createState() => contenedorEditarUsuarioState();

}

class contenedorEditarUsuarioState extends State<contenedorEditarUsuario> {

  void volverAPrincipal() {
    Navigator.pushNamed(context, '/menuPrincipalUsuarios');
  } 

  @override
  Widget build(BuildContext context) {
    print("Llego este id " + widget.id);
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          title:
              Image.asset('assets/img/logoPQRSA.png', width: 280, height: 100),
          automaticallyImplyLeading: false,
          backgroundColor: Colores.bgCabeceraPrincipal,
          actions: <Widget>[
            FlatButton(
                onPressed: volverAPrincipal,
                child: Text(
                  'Volver al menú',
                  style: TextStyle(color: Colores.black, fontSize: 20),
                ))
          ],
        ),
      body: Center(
        child: Container(
          height: 300,
          width: 500,
          child: Card(
            child: Column(
              children: <Widget>[
                editarUsuario(id: widget.id)
              ],
            ),
            color: Colores.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colores.columnaCodigos),
                borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.all(5),
            elevation: 10,
          ))
      )
    );
  }
}