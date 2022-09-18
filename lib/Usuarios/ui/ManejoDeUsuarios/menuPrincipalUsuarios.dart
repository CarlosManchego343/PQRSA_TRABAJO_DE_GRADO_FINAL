import 'package:flutter/material.dart';
import 'package:pqrsafinal/Usuarios/ui/ManejoDeUsuarios/tablaDeManejo.dart';
import 'package:pqrsafinal/WidgetsGenerales/ReportesDeLasPQRSA/menuDeReportes.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';


class menuPrincipalUsuario extends StatefulWidget {
  @override
  menuPrincipalUsuarioState createState() => menuPrincipalUsuarioState();
}

class menuPrincipalUsuarioState extends State<menuPrincipalUsuario> with TickerProviderStateMixin{

  List<Widget> pages = [tablaDeManejo(), MenuDeReportes()];
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
          IconButton(
            onPressed: salir, 
            icon: Icon(
              Icons.exit_to_app_rounded
            ))
        ],
        bottom: TabBar(
          indicatorColor: ArgonColors.bgTapElejido,
          labelColor: ArgonColors.black,
          controller: _controller,
          tabs: [
            Tab(text: "Usuarios"),
            Tab(text: "Reportes de las PQRSA")
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
