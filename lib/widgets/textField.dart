import 'package:flutter/material.dart';

class textFieldWidget extends StatelessWidget {
  final hintText;
  final lableText;
  final controller;

   textFieldWidget({
    super.key,
    required this.hintText,
    required this.lableText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        else {
          if (value.length < 6 && lableText != 'Username') {
            return 'Please enter more than 5 letters';
          }
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: lableText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.orange,
          )
        ),
      ),
      style: TextStyle(
        fontSize: 12,
        height: 0.5,
      ),
    );
  }
}