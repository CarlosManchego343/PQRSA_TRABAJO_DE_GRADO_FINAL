import 'package:pqrsafinal/WidgetsGenerales/ReportesDeLasPQRSA/reportesArea.dart';
import 'package:pqrsafinal/WidgetsGenerales/ReportesDeLasPQRSA/reportesGenerales.dart';
import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';
import 'package:flutter/material.dart';

class MenuDeReportes extends StatefulWidget {
  @override
  MenuDeReportesState createState() => MenuDeReportesState();
}

class MenuDeReportesState extends State<MenuDeReportes> {
  int _selectIndex = 0;
  List<Widget> _widgetsOptions = [ReportesGenerales(), ReportesArea()];

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
                        "Reporte general",
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
                      title: Text("Reporte por área",
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
