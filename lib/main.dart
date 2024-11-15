import 'package:flutter/material.dart';
import 'package:responsive_login_ui/screen/login.dart';

import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Login Ui',
      theme: ThemeData(
        colorSchemeSeed: CustomTheme.black,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              CustomTheme.fieldBorderRadius,
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              CustomTheme.fieldBorderRadius,
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              CustomTheme.fieldBorderRadius,
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
