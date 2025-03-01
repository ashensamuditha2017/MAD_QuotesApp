import 'package:flutter/material.dart';
import 'quote_screen.dart';

/// The main entry point of the application.
void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Famous Quotes',
      theme: ThemeData.dark(),
      home: const QuoteScreen(),
    );
  }
}
