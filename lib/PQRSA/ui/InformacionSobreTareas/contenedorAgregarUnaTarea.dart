import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/InformacionSobreTareas/agregarUnaTarea.dart';

import '../../../WidgetsGenerales/Theme.dart';

class contenedorAgregarUnaTarea extends StatefulWidget {
  final String id;
  contenedorAgregarUnaTarea(this.id);
  @override
  contenedorAgregarUnaTareaState createState() => contenedorAgregarUnaTareaState();
}

class contenedorAgregarUnaTareaState extends State<contenedorAgregarUnaTarea> {
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
          child: agregarUnaTarea(widget.id)
        ),
      ),
    );
  }
}