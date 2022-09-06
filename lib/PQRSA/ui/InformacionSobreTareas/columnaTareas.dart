// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class columnaTareas extends StatefulWidget {
  @override
  columnaTareasState createState() => columnaTareasState();
}

class columnaTareasState extends State<columnaTareas> {
  bool _controlTarea1 = false;
  bool _controlTarea2 = false;
  bool _controlTarea3 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Nombre",
                      style: TextStyle(
                          fontSize: 18,
                          color: ArgonColors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Estado",
                      style: TextStyle(
                          fontSize: 18,
                          color: ArgonColors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
        Divider(
          height: 40.0,
          thickness: 1.5,
          indent: 32.0,
          endIndent: 32.0,
          color: ArgonColors.black,
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Comer manzanas",
                      style: TextStyle(
                        fontSize: 18,
                        color: ArgonColors.black,
                      )),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {
                          _controlTarea1 = value!;
                        });
                      },
                      value: _controlTarea1,
                    )),
              ],
            )
          ],
        ),
        Divider(
          height: 40.0,
          thickness: 1.5,
          indent: 32.0,
          endIndent: 32.0,
          color: ArgonColors.black,
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Arreglar el cuarto",
                      style: TextStyle(
                        fontSize: 18,
                        color: ArgonColors.black,
                      )),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {
                          _controlTarea2 = value!;
                        });
                      },
                      value: _controlTarea2,
                    )),
              ],
            )
          ],
        ),
        Divider(
          height: 40.0,
          thickness: 1.5,
          indent: 32.0,
          endIndent: 32.0,
          color: ArgonColors.black,
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Graduarme",
                      style: TextStyle(
                        fontSize: 18,
                        color: ArgonColors.black,
                      )),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Checkbox(
                      onChanged: (bool? value) {
                        setState(() {
                          _controlTarea3 = value!;
                        });
                      },
                      value: _controlTarea3,
                    )),
              ],
            )
          ],
        ),
      ],
    );
  }
}
