import 'package:flutter/material.dart';
import 'package:news_app/model/each_article_model.dart';
import 'package:news_app/views/screens/webview_page.dart';

class NewsThumbnail extends StatelessWidget {
  final EachArticleModel model;
  const NewsThumbnail(this.model, {super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WebViewPage(url: model.url!),
          ),
        );
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        height: 200,
        width: 300,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(
              model.imgUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            model.title!,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    );
  }
}
