import 'package:flutter/material.dart';

import 'field.dart';

class FieldButton extends StatelessWidget {
  const FieldButton({super.key, required this.field, required this.onPressed});
  final Field field;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      onPressed: onPressed,
      child: Text(
        field.getValue(),
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: field.getValue() == 'X' ? Colors.blue : Colors.red,
        ),
      ),
    );
  }
}
