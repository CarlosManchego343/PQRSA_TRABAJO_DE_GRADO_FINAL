import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../WidgetsGenerales/Theme.dart';
import '../../../WidgetsGenerales/input.dart';

class agregarUsuario extends StatefulWidget {
  @override
  agregarUsuarioState createState() => agregarUsuarioState();
}

class agregarUsuarioState extends State<agregarUsuario> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  String _areaSeleccionada = 'Area';

  String _rolSeleccionado = 'Rol';

  List _area = [
    'Area',
    'Legal',
    'Finanzas',
    'Producción',
    'Seguridad',
    'Social',
    'Administración'
  ];

  List _rol = ['Rol', 'Administrador', 'Trabajador'];

  TextEditingController? _numeroDeDocumento;
  TextEditingController? _nombre;
  TextEditingController? _correo;
  TextEditingController? _contrasenia;

  @override
  void initState() {
    super.initState();
    _numeroDeDocumento = TextEditingController(text: "");
    _nombre = TextEditingController(text: "");
    _correo = TextEditingController(text: "");
    _contrasenia = TextEditingController(text: "");
  }

  void _limpiarCampos() {
    _rolSeleccionado = "Rol";
    _areaSeleccionada = "Area";
    _numeroDeDocumento!.text = "";
    _nombre!.text = "";
    _correo!.text = "";
    _contrasenia!.text = "";
  }

  void _AgregarUsuario() {
    if (_formKey.currentState!.validate()) {
      print('Asi es');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Número de documento",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.pin_rounded),
                              controller: _numeroDeDocumento,
                              validator: (documento) {
                                if (documento.isEmpty) {
                                  return 'Por favor introduzca el número de documento';
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
                              placeholder: "Correo electronico",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.email_rounded),
                              controller: _correo,
                              validator: (correo) {
                                if (correo.isEmpty) {
                                  return 'Por favor introduzca el correo';
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
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Nombre",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.directions_rounded),
                              controller: _nombre,
                              validator: (nombre) {
                                if (nombre.isEmpty) {
                                  return 'Por favor introduzca el nombre';
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
                              placeholder: "Contraseña",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.directions_rounded),
                              controller: _contrasenia,
                              validator: (contrasenia) {
                                if (contrasenia.isEmpty) {
                                  return 'Por favor introduzca la contraseña';
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
                            child: Container(
                              child: DropdownButtonFormField<String>(
                                hint: Text('Municipio'),
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
                                value: _rolSeleccionado,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                iconSize: 28,
                                elevation: 16,
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _rolSeleccionado = newValue;
                                    });
                                  }
                                },
                                items:
                                    _rol.map<DropdownMenuItem<String>>((value) {
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
                ],
              ),
              SizedBox(height: 15),
              FlatButton(
                onPressed: _AgregarUsuario,
                child: Text(
                  "Registrar",
                  style: TextStyle(color: Colores.black),
                ),
                color: Colores.Botones,
              )
            ],
          )),
    );
  }
}
