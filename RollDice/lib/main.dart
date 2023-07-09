//// Import packages
import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

/// define func
void main(
    //// Argument (parameters)
    ) {
  /// calll func
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer([
          Color.fromARGB(255, 207, 195, 237),
          Color.fromARGB(255, 45, 7, 98),
          Colors.black,
        ]),
      ),
    ),
  );
}
