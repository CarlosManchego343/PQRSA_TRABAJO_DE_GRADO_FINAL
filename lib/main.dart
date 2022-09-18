import 'package:pqrsafinal/PQRSA/ui/VistasPrincipales/editarPQRSA.dart';
import 'package:pqrsafinal/PQRSA/ui/VistasPrincipales/verADetallePQRSA.dart';
import 'package:pqrsafinal/Usuarios/ui/IngresoAlAplicativo/ResetearContrasenia.dart';
import 'package:pqrsafinal/PQRSA/ui/VistasPrincipales/menuPrincipalPQRSA.dart';
import 'package:pqrsafinal/Usuarios/ui/ManejoDeUsuarios/menuPrincipalUsuarios.dart';
import 'package:pqrsafinal/firebase_options.dart';
import 'package:pqrsafinal/WidgetsGenerales/ScrollViewWeb.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Usuarios/ui/IngresoAlAplicativo/loginWeb.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'PQRSA',
        theme: ThemeData(fontFamily: 'OpenSans'),
        initialRoute: "/menuPrincipalUsuarios",
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "/loginWeb": (BuildContext context) => new LoginWeb(),
          "/menuPrincipalPQRSA": (BuildContext context) => new menuPrincipalPQRSA(),
          "/verADetallePQRSA": (BuildContext context) => new verADetallePQRSA(),
          "/editarPQRSA": (BuildContext context) => new editarPQRSA(),
          "/resetearContrasenia": (BuildContext context) =>
              new ResetearContrasenia(),
          "/menuPrincipalUsuarios": (BuildContext context) => new menuPrincipalUsuario()
        });
  }
}
