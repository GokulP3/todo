import 'package:flutter/material.dart';

class SnackBarWidget {
  static void message(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green.shade600,
        content: Text(
          message,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
        )));
  }
}
