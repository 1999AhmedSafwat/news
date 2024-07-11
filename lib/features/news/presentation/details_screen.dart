import 'package:flutter/material.dart';

import '../models/articles.dart';

class DetailsScreen extends StatelessWidget {
  final Articles article;

  const DetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Image.network(
              article.urlToImage??"",
              height: 250,
              width: 500,
              fit: BoxFit.fill,
            ),
            Text(
              article.author ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            Text(
              article.author ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.white),
            ),
            const Divider(),
            Text(
             article.description??"",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ],
        ));
  }
}
