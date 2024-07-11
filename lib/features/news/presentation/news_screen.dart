import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/articles.dart';
import '../models/news_response.dart';
import '../widgets/item_news.dart';
import 'details_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsState();
}

class _NewsState extends State<NewsScreen> {
  final Dio _dio = Dio();

  List<Articles> newModel = [];

  Future<void> _fetchArticlesData() async {
    print("inside the _fetchArticlesData");
    try {
      final response = await _dio.get(
          'https://newsapi.org/v2/everything?q=bitcoin&apiKey=cb661b8b1c7a41ef8334b01ff6d7c2f4');
      if (response.statusCode == 200) {
        var newsResponse = NewsResponse.fromJson(response.data);
        print('Articles mapped ${newsResponse.articles?[0].title}');
        newModel = newsResponse.articles ?? [];
        setState(() {});
      } else {
        print('API call failed with status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error making API call: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchArticlesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "News",
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Colors.blue,
          toolbarHeight: 35,
        ),
        drawer: SafeArea(
            child: Drawer(
          child: ListView(
            children: const [
              Text(
                "Catagory",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "science",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Business",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sports",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Health",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )),
        body: ListView.builder(
          itemBuilder: (context, index) => ItemNew(
            article: newModel[index],
            onClick: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    article: newModel[index],
                  ),
                ),
              );
            },
          ),
          itemCount: newModel.length,
        ));
  }
}
