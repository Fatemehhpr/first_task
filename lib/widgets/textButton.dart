import 'package:flutter/material.dart';

class textButtonWidget extends StatelessWidget {
  final color;
  final text;

  const textButtonWidget({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
            onPressed: () {},
            child: Text(text),
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(2),
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10
              ),
              primary: color,
            ),
        );
  }
}