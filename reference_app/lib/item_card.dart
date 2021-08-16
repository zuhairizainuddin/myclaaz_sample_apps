import 'package:flutter/material.dart';
import 'package:reference_app/page.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    required this.imagePath,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            imagePath,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => TopicPage(
                title: title,
                description: description,
                assetPath: imagePath,
              ),
            ),
          );
        },
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
