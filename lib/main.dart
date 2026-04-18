import 'package:flutter/material.dart';
import 'shared/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme(Brightness.light),
      darkTheme: AppTheme.theme(Brightness.dark),
      themeMode: ThemeMode.system,
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Column(mainAxisAlignment: .center, children: [
            Text(
              'Hello, World!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
