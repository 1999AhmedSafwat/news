import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'package:dio/dio.dart';


class TelegramView extends StatefulWidget {
  @override
  State<TelegramView> createState() => _TelegramViewState();
}

class _TelegramViewState extends State<TelegramView> {
  final Dio _dio = Dio();

  // List<ConversationModel> list = [];
  List<ArticleModel> articlesList = [];

  Future<void> _fetchArticlesData() async {
    print("inside the _fetchArticlesData");
    try {

      final response = await _dio.get(
          'https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=cb661b8b1c7a41ef8334b01ff6d7c2f4');
      if (response.statusCode == 200) {
        final totalResults = response.data['totalResults'];
        print('totalResults: $totalResults');

        final allArticles = response.data['articles'];
        for (var articleData in allArticles) {
          final source = articleData['source'];
          final article = ArticleModel(
            sourceName: source['name'] as String,
            author: articleData['author'] as String,
            title: articleData['title'] as String,
            url: articleData['url'] as String,
            publishedAt: articleData['publishedAt'] as String,
          );
          articlesList.add(article);
        }
        print('Articles mapped');

        setState(() {

        });
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
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.all(0.8),
          child:
          Icon(Icons.refresh,color: Colors.white,),
        ),
       SizedBox(width: 5,),
        Icon(Icons.multiple_stop,color: Colors.yellow,),
      ],
        backgroundColor: Color(0xff0088cc),
        title: Center(
          child: Text(
            "Telegram",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),





      ),
      ),
      drawer: SafeArea(
        child: Drawer(
          surfaceTintColor: Colors.black87,
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                            "https://media.istockphoto.com/id/1463861147/photo/online-messaging-social-media-auto-post-production-filter-telephone-mobile-phone-social-media.jpg?s=2048x2048&w=is&k=20&c=2uZt9Sejg1NSVXWM0s21G_YooGNtRP-wRAeN-7_2QMg=",
                          )),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.light_mode,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text("AHMED"),
                        subtitle: Text("0101234567"),
                        trailing: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              ...List.generate(
                7,
                (index) => ListTile(
                  title: Text("new Grop"),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 7,
                  ),
                  leading: Icon(Icons.person),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _fetchArticlesData();
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff0088cc),
      ),











      body: ListView.builder(
        itemCount: articlesList.length,
        itemBuilder: (context, index) =>
            Column(children: [
              ListTile(
                title: Text(
                  articlesList[index].sourceName,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                subtitle: Text(
                  articlesList[index].title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/id/1463861147/photo/online-messaging-social-media-auto-post-production-filter-telephone-mobile-phone-social-media.jpg?s=2048x2048&w=is&k=20&c=2uZt9Sejg1NSVXWM0s21G_YooGNtRP-wRAeN-7_2QMg=",
                  ),
                  radius: 20,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon(
                    //   Icons.read_more,
                    //   color: list[index].active ? Colors.red : Colors.green,
                    // ),
                    Text(
                      articlesList[index].publishedAt,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    // CircleAvatar(
                    //   backgroundColor: list[index].isSeen ? Colors.red : Colors.blue,
                    //   radius: 5,
                    // ),
                  ],
                ),
              ),
            ],)

      ),
    );
  }
}
