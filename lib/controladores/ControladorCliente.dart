import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class controladorCliente {
  final formKey = GlobalKey<FormState>();
  final FirebaseFirestore db = FirebaseFirestore.instance;
  List? municipio = ['Municipio de residencia', 'Aracataca', 'Pueblo viejo'];
  String? municipioSeleccionado = 'Municipio de residencia';
  late TextEditingController? nombreCliente;
  late TextEditingController? documentoCliente;
  late TextEditingController? telefono;
  late TextEditingController? correo;
  late TextEditingController? direccion;

  getFormKey() {
    return formKey;
  }

  getMunicipio() {
    return municipio!;
  }

  getMunicipioSeleccionado() {
    return municipioSeleccionado!;
  }

  setMunicipioSelecciondao(String municipioSeleccionado) {
    municipioSeleccionado = municipioSeleccionado;
  }

  getNombreCliente() {
    nombreCliente = TextEditingController(text: "");
    return nombreCliente;
  }

  getDocumentoCliente() {
    documentoCliente = TextEditingController(text: "");
    return documentoCliente;
  }

  getTelefono() {
    telefono = TextEditingController(text: "");
    return telefono;
  }

  getCorreo() {
    correo = TextEditingController(text: "");
    return correo;
  }

  getDireccion() {
    direccion = TextEditingController(text: "");
    return direccion;
  }

  AgregarCliente(context) {
    if (formKey.currentState!.validate()) {
      if (municipioSeleccionado != 'Municipio de residencia') {
        db.collection('Cliente').doc(documentoCliente!.text).set({
          "Correo_electronico": correo!.text,
          "Direccion": direccion!.text,
          "Municipio_de_residencia": municipioSeleccionado,
          "Nombre": nombreCliente!.text,
          "Numero_de_documento": documentoCliente!.text,
          "Telefono": telefono!.text
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Información registrada correctamente")));
        limpiarCampos();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Por favor, elija un municipio")));
      }
    }
  }

  limpiarCampos() {
    municipioSeleccionado = "Municipio de residencia";
    nombreCliente!.text = "";
    documentoCliente!.text = "";
    telefono!.text = "";
    correo!.text = "";
    direccion!.text = "";
  }
}
