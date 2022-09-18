import 'package:flutter/material.dart';
import 'package:pqrsafinal/WidgetsGenerales/Theme.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final bool? obscureText;
  final String? placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onTap;
  final Function? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final Color borderColor;
  final Function? validator;
  final TextInputType? keyboardType;
  final TextInputFormatter inputFormatter;

  Input(
      {this.obscureText,
      this.placeholder,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.onChanged,
      this.autofocus = false,
      this.borderColor = Colores.BordeDeInputs,
      this.validator,
      this.keyboardType,
      required this.inputFormatter,
      this.controller});

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
        obscureText: false,
        cursorColor: Colores.muted,
        onTap: onTap as void Function()?,
        onChanged: onChanged as void Function(String)?,
        controller: controller,
        autofocus: autofocus,
        validator: validator as String? Function(String?)?,
        inputFormatters: <TextInputFormatter>[inputFormatter],
        keyboardType: keyboardType,
        style:
            TextStyle(height: 0.85, fontSize: 14.0, color: Colores.black),
        textAlignVertical: TextAlignVertical(y: 0.6),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colores.white,
            hintStyle: TextStyle(
              color: Colores.black,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            hintText: placeholder));
  }
}
