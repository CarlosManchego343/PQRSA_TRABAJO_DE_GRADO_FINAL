import 'package:flutter/material.dart';
import 'package:pqrsafinal/Usuarios/ui/AgregarUsuario/agregarUsuario.dart';
import 'package:pqrsafinal/Usuarios/ui/EditarUsuario/editarUsuario.dart';

import '../../../WidgetsGenerales/Theme.dart';


class contenedorAgregarUsuario extends StatefulWidget {
  @override
  contenedorAgregarUsuarioState createState() => contenedorAgregarUsuarioState();

}

class contenedorAgregarUsuarioState extends State<contenedorAgregarUsuario> {

  void volverAPrincipal() {
    Navigator.pushNamed(context, '/menuPrincipalUsuarios');
  } 

  @override
  Widget build(BuildContext context) {
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
          child: Card(
            child: Column(
              children: <Widget>[
                agregarUsuario()
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

