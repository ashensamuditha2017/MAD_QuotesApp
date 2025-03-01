import 'package:flutter/material.dart';

/// A screen that displays detailed information about a selected quote.
class QuoteDetailScreen extends StatelessWidget {
  final Quote quote;

  const QuoteDetailScreen({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text("Quote Details"),
          centerTitle: true,
          backgroundColor:
              Colors.orangeAccent, // 🔥 Restored correct AppBar color
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  "\"${quote.text}\"",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "- ${quote.author}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70),
                ),
                const SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  color: Colors.deepPurple.shade400,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "About the Quote:",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          quote.details,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Back to Quotes"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Quote model class
class Quote {
  final String text;
  final String author;
  final String category;
  final String details;

  Quote(
      {required this.text,
      required this.author,
      required this.category,
      required this.details});
}
