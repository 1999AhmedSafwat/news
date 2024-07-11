import 'package:flutter/material.dart';

import 'features/news/presentation/news_screen.dart';

void main() {
  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewsScreen()
    );
  }
}





