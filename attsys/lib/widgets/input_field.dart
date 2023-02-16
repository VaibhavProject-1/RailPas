import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const InputField({Key? key, required this.hintText, required this.controller}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.hintText=="Password"?isHidden :false,
      decoration: InputDecoration(
          suffixIcon: widget.hintText=="Password"?IconButton(
            onPressed: ()
            {
              setState(() {
                isHidden = !isHidden;
              });
            } ,
            icon: Icon(isHidden?Icons.remove_red_eye_rounded:Icons.password),
            ):null,
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: widget.hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
          controller: widget.controller,
    );
    
  }
}
