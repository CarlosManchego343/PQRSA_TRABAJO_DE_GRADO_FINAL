import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/EditarPQRSA/editarPQRSA.dart';

import '../../../WidgetsGenerales/Theme.dart';

class contenedorEditarEstadoPQRSA extends StatefulWidget {
  final String id;
  contenedorEditarEstadoPQRSA(this.id);
  @override
  contenedorEditarEstadoPQRSAState createState () => contenedorEditarEstadoPQRSAState();

}

class contenedorEditarEstadoPQRSAState extends State<contenedorEditarEstadoPQRSA> {

  void volverAPrincipal() {
    Navigator.pushNamed(context, '/menuPrincipalPQRSA');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        child: Column(
          children: <Widget>[
            
          ],
        ),
      ),
    );
  }
} 