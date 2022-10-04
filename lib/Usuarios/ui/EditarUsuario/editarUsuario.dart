import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../WidgetsGenerales/Theme.dart';
import '../../../WidgetsGenerales/input.dart';

class editarUsuario extends StatefulWidget {
  final String? id;
  editarUsuario({this.id});
  @override
  editarUsuarioState createState() => editarUsuarioState();
}

class editarUsuarioState extends State<editarUsuario> {
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

  late Map? usuarioEncontrado;

  late String? usuarioAEditar;

  @override
  void initState() {
    super.initState();
    usuarioAEditar = widget.id;
    _nombre = TextEditingController(text: "");
      db
        .collection('Usuarios')
        .where('uid', isEqualTo: usuarioAEditar)
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                usuarioEncontrado = snapshot.docs[0].data() as Map?;
                print(usuarioEncontrado);
                print("El id es: " + usuarioAEditar!);
                _numeroDeDocumento =
                    TextEditingController(text: usuarioEncontrado!["Numero_de_documento"]);
                _nombre = TextEditingController(text: usuarioEncontrado!["Nombre"]);
                _areaSeleccionada = usuarioEncontrado!["Area"];
                _rolSeleccionado = usuarioEncontrado!["Rol"];
              })
            });
  }

  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  void _editarUsuario() {
    if (_formKey.currentState!.validate()) {
      if (_areaSeleccionada != 'Area') {
        if (_rolSeleccionado != 'Rol') {
          db.collection('Usuarios').doc(usuarioAEditar).update({
            "Area": _areaSeleccionada,
            "Nombre": _nombre!.text,
            "Numero_de_documento": _numeroDeDocumento!.text,
            "Rol": _rolSeleccionado
          });
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Usuario editado con exito")));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Por favor, elija un rol")));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Por favor, elija un area")));
      }
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
                              placeholder: "Documento",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.pin_rounded),
                              controller: _numeroDeDocumento,
                              validator: (documento) {
                                if (documento.isEmpty) {
                                  return 'Introduzca el documento';
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
                                  return 'Introduzca el nombre';
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
                onPressed: _editarUsuario,
                child: Text(
                  "Editar",
                  style: TextStyle(color: Colores.black),
                ),
                color: Colores.Botones,
              )
            ],
          )),
    );
  }
}
