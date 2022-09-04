import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/Theme.dart';
import 'package:pqrsafinal/Vweb/PQRS/WidgetsGenerales/input.dart';
import 'package:pqrsafinal/Vweb/PQRS/WidgetsGenerales/inputContrasenia.dart';

class ResetearContrasenia extends StatefulWidget {
  @override
  ResetearContraseniaState createState() => ResetearContraseniaState();
}

class ResetearContraseniaState extends State<ResetearContrasenia> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _autenticacion = FirebaseAuth.instance;
  TextEditingController? _email;


  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
  }

  void _irAInicioDeSesion() {
    ClearTextEditingController();
    Navigator.pushNamed(context, '/loginWeb');
  }

  // ignore: non_constant_identifier_names
  void ClearTextEditingController() {
    _email!.text = "";
  }
  
  Future _cambiarLaContrasenia() async{
    try {
      await _autenticacion.sendPasswordResetEmail(email: _email!.text);

    ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Correo enviado")));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/Sociedad.jpg"),
                    fit: BoxFit.cover)),
          ),
          Align(
            // ignore: unnecessary_new
            child: new Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: SizedBox(
                width: 500,
                height: 1000,
                child: SafeArea(
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 145.0, left: 24.0, right: 24.0, bottom: 6.0),
                      child: Card(
                          elevation: 5,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  decoration: BoxDecoration(
                                      color: ArgonColors.bgTituloLogin,
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 0.5,
                                              color: ArgonColors.black))),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Center(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text("Bienvenido",
                                            style: TextStyle(
                                                color: ArgonColors.black,
                                                fontSize: 36.0)),
                                      )),
                                      // Divider()
                                    ],
                                  )),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.48,
                                  color: ArgonColors.bgCuerpoLogin,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SingleChildScrollView(
                                        child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Center(
                                            child: Text("Cambiar contraseña",
                                                style: TextStyle(
                                                    color:
                                                        ArgonColors.black,
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 26)),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Input(
                                                  inputFormatter:
                                                      FilteringTextInputFormatter
                                                          .deny(""),
                                                  placeholder: "Correo",
                                                  prefixIcon: Icon(
                                                    Icons.email,
                                                    color: ArgonColors.black,
                                                  ),
                                                  controller: _email,
                                                  validator: (email) {
                                                    if (email.isEmpty) {
                                                      return 'Por favor ingrese un email';
                                                    }
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Center(
                                              child: FlatButton(
                                                textColor: ArgonColors.black,
                                                color: ArgonColors.Botones,
                                                onPressed: _cambiarLaContrasenia,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16.0,
                                                        right: 16.0,
                                                        top: 12,
                                                        bottom: 12),
                                                    child: Text("CAMBIAR",
                                                        style: TextStyle(
                                                            color: ArgonColors
                                                                .black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16.0))),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                  onPressed: _irAInicioDeSesion,
                                                  child: Text(
                                                      'Volver al inicio de sesión'))
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                  ))
                            ],
                          )),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
