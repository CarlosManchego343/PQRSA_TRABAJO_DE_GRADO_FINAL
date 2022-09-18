import 'package:pqrsafinal/Cliente/ui/RegistrarInformacion/agregarClientePQRS.dart';
import 'package:pqrsafinal/PQRSA/ui/registrarInformacion/agregarPQRSA.dart';
import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';
import 'package:flutter/material.dart';

class menuCreacionPQRS extends StatefulWidget {
  @override
  menuCreacionPQRSState createState() => menuCreacionPQRSState();
}

class menuCreacionPQRSState extends State<menuCreacionPQRS> {
  int _selectIndex = 0;
  List<Widget> _widgetsOptions = [agregarClientePQRS(), agregarPQRSA()];

  void _itemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Flexible(
              flex: 1,
              child: Scaffold(
                backgroundColor: Colores.menuDeOpciones,
                body: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    SizedBox(height: 15),
                    ListTile(
                      title: Text(
                        "Agregar un cliente",
                        style: TextStyle(
                          color: Colores.white,
                        ),
                      ),
                      leading: Icon(Icons.folder_shared_outlined,
                          color: Colores.white),
                      onTap: () => _itemTapped(0),
                    ),
                    SizedBox(height: 15),
                    ListTile(
                      title: Text("Agregar una PQRSA",
                          style: TextStyle(
                            color: Colores.white,
                          )),
                      leading:
                          Icon(Icons.feed_outlined, color: Colores.white),
                      onTap: () => _itemTapped(1),
                    ),
                  ],
                ),
              )),
          Flexible(flex: 4, child: _widgetsOptions[_selectIndex])
        ],
      ),
    );
  }
}
