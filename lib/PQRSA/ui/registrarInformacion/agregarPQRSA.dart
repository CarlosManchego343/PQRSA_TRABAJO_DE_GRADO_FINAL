// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:intl/intl.dart';
import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';
import 'package:pqrsafinal/WidgetsGenerales/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class agregarPQRSA extends StatefulWidget {
  @override
  agregarPQRSAtate createState() => agregarPQRSAtate();
}

class agregarPQRSAtate extends State<agregarPQRSA> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Map? datosDeGraficaPQRSATotalidad;
  Map? datosDeGraficaPQRSAAbiertas;
  CollectionReference datosPQRSA =
      FirebaseFirestore.instance.collection('Datos_PQRSA');

  String _tipoSeleccionado = 'Tipo de PQRSA';
  String _areaSeleccionada = 'Area';

  // ignore: prefer_final_fields
  List _tipo = [
    'Tipo de PQRSA',
    'Petición',
    'Queja',
    'Reclamo',
    'Sugerencia',
    'Agradecimiento'
  ];

  // ignore: prefer_final_fields
  List _area = [
    'Area',
    'Legal',
    'Finanzas',
    'Producción',
    'Seguridad',
    'Social',
    'Administración'
  ];
  TextEditingController? _asunto;
  TextEditingController? _fechaRadicacion;
  TextEditingController? _documentoDelRecibidor;
  TextEditingController? _documentoDelCliente;

  @override
  void initState() {
    super.initState();
    _asunto = TextEditingController(text: "");
    _fechaRadicacion = TextEditingController(text: "");
    _documentoDelRecibidor = TextEditingController(text: "");
    _documentoDelCliente = TextEditingController(text: "");
    datosPQRSA
        .where("id", isEqualTo: "Totalidad")
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                datosDeGraficaPQRSATotalidad = snapshot.docs[0].data() as Map?;
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
  }

  void _llamarFechaRadicacion() async {
    var selectedDate = await getDatePickerWidget();
    String fechaFormateada = DateFormat('dd/MM/yyyy').format(selectedDate!);
    setState(() {
      _fechaRadicacion!.text = fechaFormateada;
    });
  }

  Future<DateTime?> getDatePickerWidget() {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(3021),
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        });
  }

  void _limpiarCampos() {
    setState(() {
      _tipoSeleccionado = "Tipo de PQRSA";
      _areaSeleccionada = "Area";
    });
    _asunto!.text = "";
    _fechaRadicacion!.text = "";
    _documentoDelRecibidor!.text = "";
    _documentoDelCliente!.text = "";
  }

  void _agregarPQRSA() {
    String id = Uuid().v1();
    if (_formKey.currentState!.validate()) {
      if (_tipoSeleccionado != 'Tipo de PQRSA') {
        if (_areaSeleccionada != 'Area') {
          DocumentSnapshot documento;
          db
              .collection('Cliente')
              .where('Numero_de_documento',
                  isEqualTo: _documentoDelCliente!.text)
              .get()
              .then((sub) => {
                    if (sub.docs.isNotEmpty)
                      {
                        db.collection('PQRSA').doc(id).set({
                          "id": id,
                          "Area": _areaSeleccionada,
                          "Documento_del_cliente": _documentoDelCliente!.text,
                          "Documento_del_recibidor":
                              _documentoDelRecibidor!.text,
                          "Fecha_de_radicacion": _fechaRadicacion!.text,
                          "Asunto": _asunto!.text,
                          "Estado": "Abierta",
                          "Tipo_de_pqrsa": _tipoSeleccionado
                        }),
                        if (_tipoSeleccionado == "Agradecimiento")
                          {
                            datosPQRSA.doc("Totalidad").update({
                              "Agradecimientos": datosDeGraficaPQRSATotalidad![
                                      "Agradecimientos"] +
                                  1
                            }),
                            datosPQRSA.doc("Abiertas").update({
                              "Agradecimientos": datosDeGraficaPQRSAAbiertas![
                                      "Agradecimientos"] +
                                  1
                            }),
                          }
                        else if (_tipoSeleccionado == "Petición")
                          {
                            datosPQRSA.doc("Totalidad").update({
                              "Peticiones":
                                  datosDeGraficaPQRSATotalidad!["Peticiones"] + 1
                            }),
                            datosPQRSA.doc("Abiertas").update({
                              "Peticiones": datosDeGraficaPQRSAAbiertas![
                                      "Peticiones"] +
                                  1
                            }),
                          }
                        else if (_tipoSeleccionado == "Queja")
                          {
                            datosPQRSA.doc("Totalidad").update({
                              "Quejas": datosDeGraficaPQRSATotalidad!["Quejas"] + 1
                            }),
                            datosPQRSA.doc("Abiertas").update({
                              "Quejas": datosDeGraficaPQRSAAbiertas![
                                      "Quejas"] +
                                  1
                            }),
                          }
                        else if (_tipoSeleccionado == "Reclamo")
                          {
                            datosPQRSA.doc("Totalidad").update({
                              "Reclamos":
                                  datosDeGraficaPQRSATotalidad!["Reclamos"] + 1
                            }),
                            datosPQRSA.doc("Abiertas").update({
                              "Reclamos": datosDeGraficaPQRSAAbiertas![
                                      "Reclamos"] +
                                  1
                            }),
                          }
                        else if (_tipoSeleccionado == "Sugerencia")
                          {
                            datosPQRSA.doc("Totalidad").update({
                              "Sugerencias":
                                  datosDeGraficaPQRSATotalidad!["Sugerencias"] +
                                      1
                            }),
                            datosPQRSA.doc("Abiertas").update({
                              "Sugerencias": datosDeGraficaPQRSAAbiertas![
                                      "Sugerencias"] +
                                  1
                            }),
                          },
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("Información registrada correctamente"))),
                        _limpiarCampos()
                      }
                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Este cliente no existe")))
                      }
                  });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Por favor, elija una area")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Por favor, elija un tipo de PQRSA")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  SizedBox(height: 100),
                  Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Asunto",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.article_outlined),
                              controller: _asunto,
                              validator: (Asunto) {
                                if (Asunto.isEmpty) {
                                  return 'Por favor introduzca el asunto de la PQRSA';
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Container(
                              child: DropdownButtonFormField<String>(
                                hint: Text('Tipo'),
                                decoration: InputDecoration(
                                  filled: true,
                                  errorMaxLines: 2,
                                  labelStyle: TextStyle(color: Colores.black),
                                  contentPadding: const EdgeInsets.only(
                                      top: 16.0, left: 10.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .focusColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .focusColor
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colores.BordeDeInputs,
                                    ),
                                  ),
                                ),
                                value: _tipoSeleccionado,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                iconSize: 28,
                                elevation: 16,
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _tipoSeleccionado = newValue;
                                    });
                                  }
                                },
                                items: _tipo
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Container(
                              child: DropdownButtonFormField<String>(
                                hint: Text('Area'),
                                decoration: InputDecoration(
                                  filled: true,
                                  errorMaxLines: 2,
                                  labelStyle: TextStyle(color: Colores.black),
                                  contentPadding: const EdgeInsets.only(
                                      top: 16.0, left: 10.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .focusColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .focusColor
                                          .withOpacity(0.5),
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
                                items: _area
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Fecha de radicación",
                              onTap: _llamarFechaRadicacion,
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.date_range_rounded),
                              controller: _fechaRadicacion,
                              validator: (fecha) {
                                if (fecha.isEmpty) {
                                  return 'Por favor introduzca la fecha de radicación';
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Documento del cliente",
                              inputFormatter:
                                  FilteringTextInputFormatter.digitsOnly,
                              prefixIcon: Icon(Icons.pin),
                              controller: _documentoDelCliente,
                              validator: (documentoC) {
                                if (documentoC.isEmpty) {
                                  return 'Por favor introduzca el número de documento del cliente';
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Documento del recibidor",
                              inputFormatter:
                                  FilteringTextInputFormatter.digitsOnly,
                              prefixIcon: Icon(Icons.pin),
                              controller: _documentoDelRecibidor,
                              validator: (documentoE) {
                                if (documentoE.isEmpty) {
                                  return 'Por favor introduzca el número de documento del que recibio la PQRSA';
                                }
                              },
                            ),
                          ),
                        ],
                      ))
                ]),
                SizedBox(height: 15),
                FlatButton(
                  onPressed: () {
                    _agregarPQRSA();
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
