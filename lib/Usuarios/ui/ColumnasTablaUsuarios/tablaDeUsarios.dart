// ignore_for_file: unnecessary_new, prefer_const_constructors, camel_case_types, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pqrsafinal/Usuarios/ui/EditarUsuario/contenededorEditarUsuario.dart';
import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';

class tablaDeUsuarios extends StatefulWidget {
  @override
  tablaDeUsuariosState createState() => tablaDeUsuariosState();
}


class tablaDeUsuariosState extends State<tablaDeUsuarios> {

  double _opacidad = 0;

  final ScrollController _scrollController = ScrollController();

  void _mostrarCardEditarUsuario() {
    setState(() {
      if (_opacidad == 0) {
        _opacidad = 1;
      }
    });
  }

  void _ocultarCardEditarUsuario() {
    setState(() {
      if (_opacidad == 1) {
        _opacidad = 0;
      }
    });
  }

  List<DataRow> _crearFilas(QuerySnapshot snapshot) {
  FirebaseFirestore db = FirebaseFirestore.instance;

  List<DataRow> newList =
      snapshot.docs.map((DocumentSnapshot documentSnapshot) {
    return new DataRow(cells: [
      DataCell(Center(
          child: Text(
        documentSnapshot.get('Nombre'),
      ))),
      DataCell(Center(
          child: Text(
        documentSnapshot.get('Correo'),
      ))),
      DataCell(Center(
          child: Text(
        documentSnapshot.get('Area'),
        textAlign: TextAlign.center,
      ))),
      DataCell(Center(
          child: Text(
        documentSnapshot.get('Rol'),
        textAlign: TextAlign.center,
      ))),
      DataCell(FlatButton(
        onPressed: (){},
        child: Text(
          "Editar",
          style: TextStyle(color: Colores.black),
          textAlign: TextAlign.center,
        ),
        color: Colores.Botones,
      )),
      DataCell(FlatButton(
        onPressed: () async{
          await AuthService().deleteUser(documentSnapshot.get('Correo'), documentSnapshot.get('Contrasenia'));
          await db.collection("Usuarios").doc(documentSnapshot.id).delete;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Usuario eliminado con exito")));
        },
        child: Text(
          "Eliminar",
          style: TextStyle(color: Colores.black),
          textAlign: TextAlign.center,
        ),
        color: Colores.Botones,
      ))
    ]);
  }).toList();
  return newList;
}


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          scrollbarOrientation: ScrollbarOrientation.bottom,
          thickness: 10,
          radius: Radius.circular(20),
          child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Usuarios')
                      .snapshots(),
                  builder: (context, snapshots) {
                    if (!snapshots.hasData) return Text('Cargando...');
                    return new DataTable(
                      border: TableBorder.all(width: 1.0, color: Colores.black),
                      headingRowColor:
                          MaterialStateProperty.all(Colores.columnaTitulos),
                      columns: <DataColumn>[
                        new DataColumn(
                            label: Center(
                                child: Text('Nombre',
                                    style: TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Correo',
                                    style: TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Area',
                                    style: TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Rol',
                                    style: TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Editar',
                                    style: TextStyle(color: Colores.white)))),
                        new DataColumn(
                            label: Center(
                                child: Text('Eliminar',
                                    style: TextStyle(color: Colores.white)))),
                      ],
                      rows:
                          _crearFilas(snapshots.data as QuerySnapshot<Object?>),
                    );
                  }))),
    );
  }
}

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

Future deleteUser(String email, String password) async {
    try {
      User user = await _auth.currentUser!;
      AuthCredential credentials =
          EmailAuthProvider.credential(email: email, password: password);
      UserCredential result = await user.reauthenticateWithCredential(credentials);
      await DatabaseService(uid: result.user!.uid).deleteuser(); // called from database class
      await result.user!.delete();
      return true;
    } catch (e) {
      return null;
    }
  }
}

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Usuarios');

  Future deleteuser() {
    return userCollection.doc(uid).delete();
  }
}



