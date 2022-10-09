import 'package:flutter/material.dart';
import 'package:pqrsafinal/Cliente/ui/EditarCliente/editarCliente.dart';

import '../../../WidgetsGenerales/Theme.dart';

class contenedorEditarCliente extends StatefulWidget {
  final String idCliente;
  contenedorEditarCliente(this.idCliente);
  @override
  contenedorEditarClienteState createState() => contenedorEditarClienteState();
}

class contenedorEditarClienteState extends State<contenedorEditarCliente> {
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
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Volver atras',
                  style: TextStyle(color: Colores.black, fontSize: 20),
                ))
          ],
        ),
      body: Center(
        child: Container(
          child: editarCliente(widget.idCliente)
        ),
      ),
    );
  }
}