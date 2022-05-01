import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController numberController;
  final String labelText;
  final FocusNode focusNode;

  const TextFieldWidget({
    Key? key,
    required this.numberController,
    required this.labelText,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: numberController,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      maxLength: 11,
      style: const TextStyle(color: Color(0xFF343D4A)),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xFFC8CBD1)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFFE0DBFC), width: 8.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.purple..shade800,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
