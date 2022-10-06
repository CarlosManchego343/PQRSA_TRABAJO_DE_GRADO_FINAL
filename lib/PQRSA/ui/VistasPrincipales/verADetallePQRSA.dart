// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/PresentacionInformacionPQRSA/presentacionBotones.dart';
import 'package:pqrsafinal/PQRSA/ui/PresentacionInformacionPQRSA/presentacionInformacionCliente.dart';
import 'package:pqrsafinal/PQRSA/ui/PresentacionInformacionPQRSA/presentacionInformacionPQRSA.dart';
import 'package:pqrsafinal/PQRSA/ui/PresentacionInformacionPQRSA/presentacionTareasAsignadas.dart';

import '../../../WidgetsGenerales/Theme.dart';

class verADetallePQRSA extends StatefulWidget {
  final String id;
  verADetallePQRSA(this.id);
  @override
  verADetallePQRSAState createState() => verADetallePQRSAState();
}

class verADetallePQRSAState extends State<verADetallePQRSA> {
  void volverAPrincipal() {
    Navigator.pushNamed(context, '/menuPrincipalPQRSA');
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              presentacionInformacionPQRSA(widget.id),
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: presentacionInformacionCliente(widget.id),
                  ),
                  Flexible(flex: 2, child: presentacionTareasAsignadas()),
                  Flexible(flex: 2, child: presentacionBotones()),
                ],
              )
            ],
          ),
        ));
  }
}
