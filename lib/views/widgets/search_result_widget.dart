import 'package:flutter/material.dart';
import 'package:news_app/model/each_article_model.dart';

import '../screens/webview_page.dart';

class SearchResultWidget extends StatelessWidget {
  final EachArticleModel model;
  const SearchResultWidget(this.model, {super.key});
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
        height: 450,
        width: double.infinity,
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
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title!,
                maxLines: 4,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.fade,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                model.content!,
                maxLines: 4,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.fade,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
