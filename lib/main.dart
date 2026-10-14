  import 'package:flutter/material.dart';

  import 'screens/lab6_main_screen.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Lab 6 - Flutter UI and Navigation',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3155D9)),
          useMaterial3: true,
        ),
        home: const Lab6MainScreen(),
      );
    }
  }
