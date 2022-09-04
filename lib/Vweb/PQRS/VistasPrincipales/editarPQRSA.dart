import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/Theme.dart';
import 'package:pqrsafinal/Vweb/PQRS/WidgetsGenerales/input.dart';

class editarPQRSA extends StatefulWidget {
  @override
  editarPQRSAState createState() => editarPQRSAState();

}

class editarPQRSAState extends State<editarPQRSA> {

  final _formKey = GlobalKey<FormState>();

  String _tipoSelected = 'Petición';
  String _bloqueSelected = 'Vallemedio';

  List _tipo = ['Petición', 'Queja', 'Reclamo', 'Sugerencia', 'Agradecimiento'];

  List _bloque = ['Vallemedio', 'Carbonera'];

  TextEditingController? _numeroRadicacion;
  TextEditingController? _dirjidaA;
  TextEditingController? _asunto;
  TextEditingController? _fechaRadicacion;
  TextEditingController? _documentoDelRecibidor;
  TextEditingController? _documentoDelRadicado;

  @override
  void initState() {
    super.initState();
    _numeroRadicacion = TextEditingController(text: "WAPPET-2020-00127");
    _dirjidaA = TextEditingController(text: "Trevor Belmont");
    _asunto = TextEditingController(text: "Respuesta proyectos de inversión social vigencias 2018, 2019 y 2020");
    _fechaRadicacion = TextEditingController(text: "16/09/2020");
    _documentoDelRecibidor = TextEditingController(text: "1007656588");
    _documentoDelRadicado = TextEditingController(text: "1007565696");
  }

  void AlmacenarPQRSA() {}

  void volverAPrincipal() {
    Navigator.pushNamed(context, '/principalWeb');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          title:
              Image.asset('assets/img/logoPQRSA.png', width: 280, height: 100),
          automaticallyImplyLeading: false,
          backgroundColor: ArgonColors.bgCabeceraPrincipal,
          actions: <Widget>[
            FlatButton(
                onPressed: volverAPrincipal,
                child: Text(
                  'Volver al menú',
                  style: TextStyle(color: ArgonColors.black, fontSize: 20),
                ))
          ],
        ),
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
                              controller: _fechaRadicacion,
                              validator: (fecha) {
                                if (fecha.isEmpty) {
                                  return 'Por favor introduzca la fecha de radicación';
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
                                  labelStyle:
                                      TextStyle(color: ArgonColors.black),
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
                                      color: ArgonColors.BordeDeInputs,
                                    ),
                                  ),
                                ),
                                value: _tipoSelected,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                iconSize: 28,
                                elevation: 16,
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _tipoSelected = newValue;
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
                              hint: Text('Bloque'),
                              decoration: InputDecoration(
                                filled: true,
                                errorMaxLines: 2,
                                labelStyle: TextStyle(color: ArgonColors.black),
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
                                    color: ArgonColors.BordeDeInputs
                                  ),
                                ),
                              ),
                              value: _bloqueSelected,
                              icon: const Icon(Icons.arrow_drop_down_sharp),
                              iconSize: 28,
                              elevation: 16,
                              style: Theme.of(context).textTheme.bodyText1,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _bloqueSelected = newValue;
                                  });
                                }
                              },
                              items: _bloque
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
                              placeholder: "Número de radicado",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.fiber_pin_rounded),
                              controller: _numeroRadicacion,
                              validator: (numeroRadicado) {
                                if (numeroRadicado.isEmpty) {
                                  return 'Por favor introduzca el número de radicado';
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Dirijido a",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.person),
                              controller: _dirjidaA,
                              validator: (DirijidoA) {
                                if (DirijidoA.isEmpty) {
                                  return 'Por favor introduzca el nombre de la persona a quien se dirije la PQRSA';
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
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.pin),
                              controller: _documentoDelRadicado,
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
                                  FilteringTextInputFormatter.deny(""),
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
                    if (_formKey.currentState!.validate()) {
                      AlmacenarPQRSA();
                    }
                  },
                  child: Text(
                    "Editar",
                    style: TextStyle(color: ArgonColors.black),
                  ),
                  color: ArgonColors.Botones,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}