import 'package:flutter/material.dart';

InputDecoration inputDecoration({required String label, required Icon icon}) {
  return InputDecoration(
      labelText: label,
      prefixIcon: icon,
      contentPadding: EdgeInsets.all(20),
      border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white10,
          ),
          borderRadius: BorderRadius.circular(20)));
}
