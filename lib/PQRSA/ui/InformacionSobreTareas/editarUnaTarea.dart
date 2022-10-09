import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

import '../../../WidgetsGenerales/Theme.dart';
import '../../../WidgetsGenerales/input.dart';

class editarUnaTarea extends StatefulWidget {
  final String idPqrsa;
  final String idTarea;
  editarUnaTarea(this.idPqrsa, this.idTarea);
  @override
  editarUnaTareaState createState() => editarUnaTareaState();
}

class editarUnaTareaState extends State<editarUnaTarea> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();

  TextEditingController? _nombreDeTarea;

  String? idDeLaPqrsa;

  String? idDeLaTarea;

  Map? tareaEncontrada;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idDeLaPqrsa = widget.idPqrsa;
    idDeLaTarea = widget.idTarea;
    db
        .collection('PQRSA')
        .doc(idDeLaPqrsa)
        .collection('Tareas')
        .where("id", isEqualTo: idDeLaTarea)
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                tareaEncontrada = snapshot.docs[0].data() as Map?;
                _nombreDeTarea =
                    TextEditingController(text: tareaEncontrada!["Nombre"]);
              })
            });
    _nombreDeTarea = TextEditingController(text: "");
  }

  void agregarTarea() {
    if (_formKey.currentState!.validate()) {
      db
          .collection('PQRSA')
          .doc(idDeLaPqrsa)
          .collection('Tareas')
          .doc(idDeLaTarea)
          .update({
        "Nombre": _nombreDeTarea!.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Información actulizada correctamente")));
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
                      top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                  child: Input(
                    placeholder: "Nombre de la tarea",
                    inputFormatter: FilteringTextInputFormatter.deny(""),
                    prefixIcon: Icon(Icons.article_rounded),
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
