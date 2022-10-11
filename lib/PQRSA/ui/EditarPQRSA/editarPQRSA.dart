import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../WidgetsGenerales/Theme.dart';
import 'package:pqrsafinal/WidgetsGenerales/input.dart';

class editarPQRSA extends StatefulWidget {
  final String id;
  editarPQRSA(this.id);
  @override
  editarPQRSAState createState() => editarPQRSAState();
}

class editarPQRSAState extends State<editarPQRSA> {
  final _formKey = GlobalKey<FormState>();

  final FirebaseFirestore db = FirebaseFirestore.instance;

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

  void _llamarFechaRadicacion() async {
    var selectedDate = await getDatePickerWidget();
    String fechaFormateada = DateFormat('dd/MM/yyyy').format(selectedDate!);
    setState(() {
      _fechaRadicacion!.text = fechaFormateada;
    });
  }

  Future <DateTime?> getDatePickerWidget() {
    return showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2022), 
      lastDate: DateTime(3021),
      builder: (context, child) {
        return Theme(data: ThemeData.dark(), child: child!);
      }
      );
  }

  late Map? pqrsaEncontrada;

  late String? pqrsaAEditar;

  @override
  void initState() {
    super.initState();
    pqrsaAEditar = widget.id;
    db
        .collection('PQRSA')
        .where('id', isEqualTo: pqrsaAEditar)
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                pqrsaEncontrada = snapshot.docs[0].data() as Map?;
                _asunto =
                    TextEditingController(text: pqrsaEncontrada!["Asunto"]);
                _fechaRadicacion = TextEditingController(
                    text: pqrsaEncontrada!["Fecha_de_radicacion"]);
                _documentoDelCliente = TextEditingController(
                    text: pqrsaEncontrada!["Documento_del_cliente"]);
                _documentoDelRecibidor = TextEditingController(
                    text: pqrsaEncontrada!["Documento_del_recibidor"]);
                _areaSeleccionada = pqrsaEncontrada!["Area"];
                _tipoSeleccionado = pqrsaEncontrada!["Tipo_de_pqrsa"];
              })
            });
  }

  void editarPQRSA() {
    if (_formKey.currentState!.validate()) {
      if (_tipoSeleccionado != 'Tipo de PQRSA') {
        if (_areaSeleccionada != 'Area') {
          db.collection('PQRSA').doc(pqrsaAEditar).update({
            "Area": _areaSeleccionada,
            "Documento_del_cliente": _documentoDelCliente!.text,
            "Documento_del_recibidor": _documentoDelRecibidor!.text,
            "Fecha_de_radicacion": _fechaRadicacion!.text,
            "Asunto": _asunto!.text,
            "Tipo_de_pqrsa": _tipoSeleccionado
          });
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("PQRSA editada correctamente")));
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

  void volverAPrincipal() {
    Navigator.pushNamed(context, '/menuPrincipalPQRSA');
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
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.date_range_rounded),
                              onTap: _llamarFechaRadicacion,
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
                              placeholder: "Documento del radicado",
                              inputFormatter:
                                  FilteringTextInputFormatter.digitsOnly,
                              prefixIcon: Icon(Icons.pin),
                              controller: _documentoDelCliente,
                              validator: (documentoC) {
                                if (documentoC.isEmpty) {
                                  return 'Por favor introduzca el número de documento del radicado';
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
          ),
        ),
      ),
    );
  }
}
