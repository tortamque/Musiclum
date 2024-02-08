import 'package:flutter/material.dart';
import 'package:musiclum/config/theme/app_theme.dart';
import 'package:musiclum/features/main_screen/presentation/pages/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: theme(colorPrimary),
      home: MainPage(),
    );
}
