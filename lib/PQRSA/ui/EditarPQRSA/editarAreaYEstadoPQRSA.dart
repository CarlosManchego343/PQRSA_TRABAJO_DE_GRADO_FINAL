import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../WidgetsGenerales/Theme.dart';

class editarAreaYEstadoPQRSA extends StatefulWidget {
  final String id;
  editarAreaYEstadoPQRSA(this.id);
  @override
  editarAreaYEstadoPQRSAState createState() => editarAreaYEstadoPQRSAState();
}

class editarAreaYEstadoPQRSAState extends State<editarAreaYEstadoPQRSA> {
  final _formKey = GlobalKey<FormState>();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference datosPQRSA =
      FirebaseFirestore.instance.collection('Datos_PQRSA');

  String _areaSeleccionada = 'Area';

  List _area = [
    'Area',
    'Legal',
    'Finanzas',
    'Producción',
    'Seguridad',
    'Social',
    'Administración'
  ];

  late Map? pqrsaEncontrada;

  late Map? datosDeGraficaPQRSAAbiertas;

  late Map? datosDeGraficaPQRSADevueltas;

  late String? pqrsaAEditar;

  late String? estadoAEditar;

  late String? tipoAEditar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pqrsaAEditar = widget.id;
    db
        .collection('PQRSA')
        .where('id', isEqualTo: pqrsaAEditar)
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                pqrsaEncontrada = snapshot.docs[0].data() as Map?;
                _areaSeleccionada = pqrsaEncontrada!["Area"];
                tipoAEditar = pqrsaEncontrada!["Tipo_de_pqrsa"];
                estadoAEditar = pqrsaEncontrada!["Estado"];
              })
            });
    datosPQRSA
        .where("id", isEqualTo: "Abiertas")
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                datosDeGraficaPQRSAAbiertas = snapshot.docs[0].data() as Map?;
              })
            });
    datosPQRSA
        .where("id", isEqualTo: "Devueltas")
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                datosDeGraficaPQRSADevueltas = snapshot.docs[0].data() as Map?;
              })
            });
  }

  void editarPQRSA() {
    if (estadoAEditar != "Devuelta") {
      if (_areaSeleccionada != 'Area') {
        if (tipoAEditar == "Agradecimiento") {
          datosPQRSA.doc("Abiertas").update({
            "Agradecimientos":
                datosDeGraficaPQRSAAbiertas!["Agradecimientos"] - 1
          });
          datosPQRSA.doc("Devueltas").update({
            "Agradecimientos":
                datosDeGraficaPQRSADevueltas!["Agradecimientos"] + 1
          });
        } else if (tipoAEditar == "Petición") {
          datosPQRSA.doc("Abiertas").update(
              {"Peticiones": datosDeGraficaPQRSAAbiertas!["Peticiones"] - 1});
          datosPQRSA.doc("Devueltas").update(
              {"Peticiones": datosDeGraficaPQRSADevueltas!["Peticiones"] + 1});
        } else if (tipoAEditar == "Reclamo") {
          datosPQRSA.doc("Abiertas").update(
              {"Reclamos": datosDeGraficaPQRSAAbiertas!["Reclamos"] - 1});
          datosPQRSA.doc("Devueltas").update(
              {"Reclamos": datosDeGraficaPQRSADevueltas!["Reclamos"] + 1});
        } else if (tipoAEditar == "Queja") {
          datosPQRSA
              .doc("Abiertas")
              .update({"Quejas": datosDeGraficaPQRSAAbiertas!["Quejas"] - 1});
          datosPQRSA
              .doc("Devueltas")
              .update({"Quejas": datosDeGraficaPQRSADevueltas!["Quejas"] + 1});
        } else if (tipoAEditar == "Sugerencia") {
          datosPQRSA.doc("Abiertas").update(
              {"Sugerencias": datosDeGraficaPQRSAAbiertas!["Sugerencias"] - 1});
          datosPQRSA.doc("Devueltas").update({
            "Sugerencias": datosDeGraficaPQRSADevueltas!["Sugerencias"] + 1
          });
        }
        db
            .collection('PQRSA')
            .doc(pqrsaAEditar)
            .update({"Area": _areaSeleccionada, "Estado": "Devuelta"});
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("PQRSA editada correctamente")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Por favor, elija una area")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Esta PQRSA ya se devolvio")));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
            child: Container(
              child: DropdownButtonFormField<String>(
                hint: Text('Area'),
                decoration: InputDecoration(
                  filled: true,
                  errorMaxLines: 2,
                  labelStyle: TextStyle(color: Colores.black),
                  contentPadding: const EdgeInsets.only(top: 16.0, left: 10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor.withOpacity(0.2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor.withOpacity(0.5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colores.BordeDeInputs,
                    ),
                  ),
                ),
                value: _areaSeleccionada,
                icon: const Icon(Icons.arrow_drop_down_sharp),
                iconSize: 28,
                elevation: 16,
                style: Theme.of(context).textTheme.bodyText1,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _areaSeleccionada = newValue;
                    });
                  }
                },
                items: _area.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 15),
          FlatButton(
            onPressed: () {
              editarPQRSA();
            },
            child: Text(
              "Editar",
              style: TextStyle(color: Colores.black),
            ),
            color: Colores.Botones,
          ),
        ],
      ),
    );
  }
}
