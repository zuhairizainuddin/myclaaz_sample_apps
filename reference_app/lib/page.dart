import 'package:flutter/material.dart';

class TopicPage extends StatelessWidget {
  const TopicPage(
      {required this.title,
      required this.assetPath,
      required this.description,
      Key? key})
      : super(key: key);

  final String title;
  final String assetPath;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Image.asset(
              assetPath,
              height: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}
