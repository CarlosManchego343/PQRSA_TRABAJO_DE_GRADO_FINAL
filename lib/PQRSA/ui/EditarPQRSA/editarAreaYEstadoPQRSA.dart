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

  late String? pqrsaAEditar;

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
              })
            });
  }

  void editarPQRSA() {
    print("Entre a editar");
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
