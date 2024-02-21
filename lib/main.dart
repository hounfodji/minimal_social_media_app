import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/auth/login_or_register.dart';
import 'package:minimal_social_media_app/pages/login_page.dart';
import 'package:minimal_social_media_app/pages/register_page.dart';
import 'package:minimal_social_media_app/theme/dark_mode.dart';
import 'package:minimal_social_media_app/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}