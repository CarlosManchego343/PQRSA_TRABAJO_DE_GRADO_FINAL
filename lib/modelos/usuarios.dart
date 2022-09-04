import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Usuarios {
  late String nombre;
  late String email;
  late String contrasenia;
  late String rol;

  Usuarios(String nombre, String email, String contrasenia, String rol) {
    this.nombre = nombre;
    this.email = email;
    this.contrasenia = contrasenia;
    this.rol = rol;
  }
}
