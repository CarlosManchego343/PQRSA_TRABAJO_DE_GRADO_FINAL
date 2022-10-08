import 'package:flutter/material.dart';
import 'package:pqrsafinal/PQRSA/ui/InformacionSobreTareas/agregarUnaTarea.dart';
import 'package:pqrsafinal/PQRSA/ui/InformacionSobreTareas/editarUnaTarea.dart';

import '../../../WidgetsGenerales/Theme.dart';

class contenedorEditarUnaTarea extends StatefulWidget {
  final String idPqrsa;
  final String idTarea;
  contenedorEditarUnaTarea(this.idPqrsa, this.idTarea);
  @override
  contenedorEditarUnaTareaState createState() => contenedorEditarUnaTareaState();
}

class contenedorEditarUnaTareaState extends State<contenedorEditarUnaTarea> {
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
          child: editarUnaTarea(widget.idPqrsa, widget.idTarea)
        ),
      ),
    );
  }
}