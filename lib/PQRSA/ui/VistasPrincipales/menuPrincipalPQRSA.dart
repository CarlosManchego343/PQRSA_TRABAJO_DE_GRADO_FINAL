import 'package:pqrsafinal/WidgetsGenerales/ReportesDeLasPQRSA/menuDeReportes.dart';
import 'package:pqrsafinal/PQRSA/ui/VistasPrincipales/PQRSActivas.dart';
import 'package:pqrsafinal/PQRSA/ui/VistasPrincipales/menuCreacionPQRS.dart';
import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';
import 'package:flutter/material.dart';

class menuPrincipalPQRSA extends StatefulWidget {
  @override
  menuPrincipalPQRSAState createState() => menuPrincipalPQRSAState();
}

class menuPrincipalPQRSAState extends State<menuPrincipalPQRSA> with TickerProviderStateMixin{
  List<Widget> pages = [PQRSActivas(), menuCreacionPQRS(), MenuDeReportes()];
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: pages.length, vsync: this);
  }

  void salir() {
        Navigator.pushNamed(context, '/loginWeb');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Image.asset('assets/img/logoPQRSA.png', width: 280, height: 100),
        automaticallyImplyLeading: false,
        backgroundColor: ArgonColors.bgCabeceraPrincipal,
        actions: <Widget>[
          FlatButton(
            onPressed: salir, 
            child: Text('Cerrar sesión',
            style: TextStyle(
              color: ArgonColors.black,
              fontSize: 20
            ),
            ))
        ],
        bottom: TabBar(
          indicatorColor: ArgonColors.bgTapElejido,
          labelColor: ArgonColors.black,
          controller: _controller,
          tabs: [
            Tab(text: "Consultar PQRSA"),
            Tab(text: "Crear PQRSA"),
            Tab(text: "Reportes de la PQRSA")
          ],
        ),
      ),
      body: TabBarView(
        children: pages,
        controller: _controller,
      ),
      
    );
  }
}
