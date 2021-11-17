import 'package:flutter/material.dart';

AlertDialog okAlertWidget(
    {required BuildContext context, required String message}) {
  return AlertDialog(
    title: Text('Grosa Store'),
    content: Text(
      message,
      style: TextStyle(fontSize: 18),
    ),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Ok'))
    ],
  );
}
