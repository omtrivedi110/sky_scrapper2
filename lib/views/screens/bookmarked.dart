import 'package:flutter/material.dart';

class Bookmarked extends StatelessWidget {
  const Bookmarked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BookMarked Cities"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(itemBuilder: (_, index) => ListTile()),
      ),
    );
  }
}
