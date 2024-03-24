import 'package:flutter/material.dart';

typedef C = AppColors;

abstract class AppColors {
  static const pureWhite = Color(0xFFF5F5F5);
}

InputDecoration inputDecoration = InputDecoration(
  // labelText: labelText,
  // prefixIcon: Icon(icon),
  labelStyle: const TextStyle(
    fontSize: 20,
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: Colors.grey,
      )),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: Colors.grey,
      )),
);
