import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

import '../../../WidgetsGenerales/Theme.dart';
import '../../../WidgetsGenerales/input.dart';

class agregarUnaTarea extends StatefulWidget {
  final String id;
  agregarUnaTarea(this.id);
  @override
  agregarUnaTareaState createState() => agregarUnaTareaState();
}

class agregarUnaTareaState extends State<agregarUnaTarea> {

  final FirebaseFirestore db = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();

  TextEditingController? _nombreDeTarea;

  String? idDeLaPqrsa;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idDeLaPqrsa = widget.id;
    _nombreDeTarea = TextEditingController(text: "");
    print("En la vista de agregar una Tarea llego este id " + idDeLaPqrsa!);
  }

  void _limpiarCampos() {
    _nombreDeTarea!.text = "";
  }

  void agregarTarea() {
    String id = Uuid().v1();
    if (_formKey.currentState!.validate()) {
      db.collection('PQRSA')
      .doc(idDeLaPqrsa)
      .collection('Tareas')
      .doc(id)
      .set({
        "Nombre": _nombreDeTarea!.text,
        "Estado": false
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("Información registrada correctamente")));
      _limpiarCampos();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Nombre de la tarea",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.date_range_rounded),
                              controller: _nombreDeTarea,
                              validator: (fecha) {
                                if (fecha.isEmpty) {
                                  return 'Debe poner un nombre a la tarea';
                                }
                              },
                            ),
                          ),
                SizedBox(height: 15),
                FlatButton(
                  onPressed: () {
                    agregarTarea();
                  },
                  child: Text(
                    "Registrar",
                    style: TextStyle(color: Colores.black),
                  ),
                  color: Colores.Botones,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}