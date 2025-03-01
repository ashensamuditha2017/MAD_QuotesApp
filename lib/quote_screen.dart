import 'package:flutter/material.dart';
import 'dart:math';
import 'quote_detail_screen.dart';

/// The main screen displaying a random quote with category selection.
class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final List<Quote> quotes = [
    Quote(
        text:
            "The only limit to our realization of tomorrow is our doubts of today.",
        author: "Franklin D. Roosevelt",
        category: "Motivational",
        details:
            "Roosevelt served as the 32nd president of the United States."),
    Quote(
        text: "An investment in knowledge pays the best interest.",
        author: "Benjamin Franklin",
        category: "Finance",
        details:
            "Benjamin Franklin was an American polymath and a Founding Father."),
    Quote(
        text: "Love all, trust a few, do wrong to none.",
        author: "William Shakespeare",
        category: "Romance",
        details: "Shakespeare was an English playwright and poet."),
  ];

  final List<String> categories = ["Motivational", "Finance", "Romance"];
  String selectedCategory = "Motivational";
  Quote? currentQuote;

  @override
  void initState() {
    super.initState();
    _initializeRandomQuote();
  }

  void _initializeRandomQuote() {
    setState(() {
      selectedCategory = categories[Random().nextInt(categories.length)];
      _getRandomQuote();
    });
  }

  void _getRandomQuote() {
    var categoryQuotes =
        quotes.where((q) => q.category == selectedCategory).toList();
    if (categoryQuotes.isNotEmpty) {
      setState(() {
        currentQuote = categoryQuotes[Random().nextInt(categoryQuotes.length)];
      });
    }
  }

  void _getNewRandomQuote() {
    setState(() {
      if (Random().nextBool()) {
        selectedCategory = categories[Random().nextInt(categories.length)];
      }
      _getRandomQuote();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text("Famous Quotes"),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent, // 🔥 Correct AppBar color
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    dropdownColor: Colors.deepPurple,
                    value: selectedCategory,
                    items: categories.map((String category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category,
                            style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedCategory = newValue;
                          _getRandomQuote();
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 30), // 🔥 Added spacing

                  if (currentQuote != null)
                    Column(
                      children: [
                        // 🔥 Quote box with padding
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          color: Colors.deepPurple.shade400,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  "\"${currentQuote!.text}\"",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "- ${currentQuote!.author}",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                            height: 30), // 🔥 Added space below the quote box

                        // 🔥 Buttons below the quote box
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: _getNewRandomQuote,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .orangeAccent, // Corrected button color
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text("New Quote",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            const SizedBox(
                                height: 10), // 🔥 Added spacing between buttons
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        QuoteDetailScreen(quote: currentQuote!),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.lightBlue, // 🔥 Sky blue color
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text("More Details",
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
