// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// CAMPO DE TEXTO CUSTOMIZADO PARA USAR EM TODAS AS TELAS

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    required this.inputtext,
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
  }) : super(key: key);

  final IconData icon;
  final String label;
  bool isObscured = false;
  final bool isSecret;
  final TextInputType inputtext;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  //   DEIXAR O CAMPO DE SENHA SECRETA

  bool isObscured = false;

  @override
  void initState() {
    super.initState();
    isObscured = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.inputtext,
        obscureText: isObscured,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  icon: Icon(
                    isObscured ? Icons.visibility_off : Icons.visibility,
                  ),
                )
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
        ),
      ),
    );
  }
}
