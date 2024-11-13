import 'package:flutter/material.dart';
import 'package:test_drive/features/login/login.dart';
import 'package:test_drive/features/registration/registration.dart';
import 'package:test_drive/features/notes_list/notes_list.dart';
import 'package:test_drive/features/note/note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Авторизация',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}


