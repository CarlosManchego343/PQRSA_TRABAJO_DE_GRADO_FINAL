import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../WidgetsGenerales/Theme.dart';
import '../../../WidgetsGenerales/input.dart';

class editarCliente extends StatefulWidget {
  final String idDelCliente;
  editarCliente(this.idDelCliente);
  @override
  editarClienteState createState() => editarClienteState();
}

class editarClienteState extends State<editarCliente> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  String _municipioSeleccionado = 'Municipio de residencia';

  List _municipio = [
    'Municipio de residencia',
    'Cota',
    'Chia',
    'Cajica',
    'Tenjo'
  ];

  TextEditingController? _nombreCliente;
  TextEditingController? _documentoCliente;
  TextEditingController? _telefono;
  TextEditingController? _correo;
  TextEditingController? _direccion;

  String? idCLiente;

  Map? clienteEncontrado;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idCLiente = widget.idDelCliente;
    db
        .collection("Cliente")
        .where("id", isEqualTo: idCLiente)
        .get()
        .then((QuerySnapshot snapshot) => {
              setState(() {
                clienteEncontrado = snapshot.docs[0].data() as Map?;
                _nombreCliente =
                    TextEditingController(text: clienteEncontrado!["Nombre"]);
                _documentoCliente = TextEditingController(
                    text: clienteEncontrado!["Numero_de_documento"]);
                _telefono =
                    TextEditingController(text: clienteEncontrado!["Telefono"]);
                _correo = TextEditingController(
                    text: clienteEncontrado!["Correo_electronico"]);
                _direccion = TextEditingController(
                    text: clienteEncontrado!["Direccion"]);
                _municipioSeleccionado =
                    clienteEncontrado!["Municipio_de_residencia"];
              })
            });
  }

  void _editarCliente() {
    if (_formKey.currentState!.validate()) {
      if (_municipioSeleccionado != 'Municipio de residencia') {
        db.collection('Cliente').doc(widget.idDelCliente).update({
          "Correo_electronico": _correo!.text,
          "Direccion": _direccion!.text,
          "Municipio_de_residencia": _municipioSeleccionado,
          "Nombre": _nombreCliente!.text,
          "Numero_de_documento": _documentoCliente!.text,
          "Telefono": _telefono!.text,
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Información editada correctamente")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Por favor, elija un municipio")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: ListView(padding: EdgeInsets.all(20), children: [
        Form(
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
                                prefixIcon: Icon(Icons.pin_rounded),
                                controller: _documentoCliente,
                                inputFormatter:
                                    FilteringTextInputFormatter.digitsOnly,
                                validator: (documento) {
                                  if (documento.isEmpty) {
                                    return 'Por favor introduzca el numero de documento';
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
                                  value: _municipioSeleccionado,
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  iconSize: 28,
                                  elevation: 16,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        _municipioSeleccionado = newValue;
                                      });
                                    }
                                  },
                                  items: _municipio
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
                              child: Input(
                                placeholder: "Dirección",
                                inputFormatter:
                                    FilteringTextInputFormatter.deny(""),
                                prefixIcon: Icon(Icons.directions_rounded),
                                controller: _direccion,
                                validator: (direccion) {
                                  if (direccion.isEmpty) {
                                    return 'Por favor introduzca la dirección';
                                  }
                                },
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
                                prefixIcon: Icon(Icons.face),
                                controller: _nombreCliente,
                                validator: (nombre) {
                                  if (nombre.isEmpty) {
                                    return 'Por favor introduzca un nombre';
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
                                placeholder: "Telefono",
                                inputFormatter:
                                    FilteringTextInputFormatter.deny(""),
                                prefixIcon: Icon(Icons.phone_rounded),
                                controller: _telefono,
                                validator: (telefono) {
                                  if (telefono.isEmpty) {
                                    return 'Por favor introduzca el número de telefono';
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
                          ],
                        )),
                  ],
                ),
                SizedBox(height: 15),
                FlatButton(
                  onPressed: _editarCliente,
                  child: Text(
                    "Editar",
                    style: TextStyle(color: Colores.black),
                  ),
                  color: Colores.Botones,
                )
              ],
            ))
      ]),
    ));
  }
}
