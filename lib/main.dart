import 'package:amazon_project/utils/theme.dart';
import 'package:flutter/material.dart';

import 'view/auth_screen/auth_scrren.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const AuthScreen(),
    );
  }
}
