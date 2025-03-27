import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, bool isSuccess) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: isSuccess ? Colors.green : Colors.red, // Green for success, Red for error
    behavior: SnackBarBehavior.floating, // Floating style
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    duration: Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
