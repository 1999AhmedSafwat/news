import 'package:flutter/material.dart';

import '../models/articles.dart';

class ItemNew extends StatefulWidget {
  final Articles article;
  final Function onClick;

  const ItemNew({super.key, required this.article, required this.onClick});

  @override
  State<ItemNew> createState() => _ItemNewState();
}

class _ItemNewState extends State<ItemNew> {
  get index => Null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  widget.onClick.call();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.article.urlToImage ?? "",
                    height: 190,
                    width: 350,
                    fit: BoxFit.fill,
                    errorBuilder: (context, object, error) {
                      return Container(
                        child: Image.asset(
                          "assets/images/istockphoto-1222357475-2048x2048.jpg",
                          height: 190,
                          width: 350,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  color: Colors.blue.withOpacity(.5),
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 5, vertical: 2),
                  child: Text(
                    widget.article.author ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          widget.article.title ?? "",
          textAlign: TextAlign.end,
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}
