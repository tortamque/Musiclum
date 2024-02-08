import 'package:flutter/material.dart';

const Color colorPrimary = Colors.blueAccent;

ThemeData theme(Color color) => ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: color),
  useMaterial3: true,
);
