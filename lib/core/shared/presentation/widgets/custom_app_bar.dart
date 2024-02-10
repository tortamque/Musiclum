import 'package:flutter/material.dart';
import 'package:musiclum/config/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => AppBar(
    backgroundColor: colorPrimary,
    foregroundColor: Colors.white,
    centerTitle: true,
    title: Text(title),
  );
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
