import 'package:pqrsafinal/Vweb/PQRS/RegistrarInformacion/agregarClientePQRS.dart';
import 'package:pqrsafinal/Vweb/PQRS/RegistrarInformacion/agregarPQRSA.dart';
import 'package:pqrsafinal/constants/Theme.dart';
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
              backgroundColor: ArgonColors.menuDeOpciones,
              body: ListView(
                padding: EdgeInsets.all(0),
              children: [
                SizedBox(height: 15),
                ListTile(
                  title: Text(
                    "Agregar un cliente",
                    style: TextStyle(
                      color: ArgonColors.black,
                    ),
                  ),
                  leading: Icon(Icons.folder_shared_outlined,
                      color: ArgonColors.black),
                  onTap: () => _itemTapped(0),
                ),
                SizedBox(height: 15),
                ListTile(
                  title: Text("Agregar una PQRSA",
                      style: TextStyle(
                        color: ArgonColors.black,
                      )),
                  leading: Icon(Icons.feed_outlined, color: ArgonColors.black),
                  onTap: () => _itemTapped(1),
                ),
              ],
              ),
            )
            ),
            Flexible(
              flex: 4,
              child: _widgetsOptions[_selectIndex])
        ],
      ),
    );
  }
}
