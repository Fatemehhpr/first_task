import 'package:flutter/material.dart';

class textWidget extends StatelessWidget {
  final textKey;
  final textValue;

  const textWidget({
    super.key,
    required this.textKey,
    required this.textValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            textKey,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700
            ),
          ),
          Text(
            textValue,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}