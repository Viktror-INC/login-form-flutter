import 'package:flutter/material.dart';
import 'package:test_flutter_login/pages/login_page/login_page.dart';
import 'package:test_flutter_login/shared/themes/light_theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      home: const LoginPage(),
    );
  }
}
