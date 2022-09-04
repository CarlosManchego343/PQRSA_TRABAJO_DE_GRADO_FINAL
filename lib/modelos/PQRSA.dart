import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PQRSA {
  late String codigo;
  late String fechaDeRadicacion;
  late String tipoDePQRSA;
  late String bloque;
  late String area;
  late String documentoDelCliente;
  late String documentoDelRecibidor;

  PQRSA(
      String codigo,
      String fechaDeRadicacion,
      String tipoDePQRSA,
      String bloque,
      String area,
      String documentoDelCliente,
      String documentoDelRecibidor) {
        this.codigo = codigo;
        this.fechaDeRadicacion = fechaDeRadicacion;
        this.tipoDePQRSA = tipoDePQRSA;
        this.bloque = bloque;
        this.area = area;
        this.documentoDelCliente = documentoDelCliente;
        this.documentoDelRecibidor = documentoDelRecibidor;
      }
}
