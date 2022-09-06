import 'package:pqrsafinal/PQRSA/ui/ColumnasTablaPQRSAActivas/columnaConCodigo.dart';
import 'package:pqrsafinal/PQRSA/ui/ColumnasTablaPQRSAActivas/tablaDePQRSA.dart';
import 'package:flutter/material.dart';

class PQRSActivas extends StatefulWidget {
  @override
  PQRSActivasState createState() => PQRSActivasState();
}

class PQRSActivasState extends State<PQRSActivas> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            children: [
              columnaConCodigo(),
              tablaDePQRSA()
            ],
          ),
        ),
      ),
    );
  }
}
