import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/controller/api_controller.dart';
import 'package:news_app/model/each_article_model.dart';
import 'package:news_app/views/widgets/news_thumbnail.dart';

class CategoryCarousel extends ConsumerWidget {
  final String heading;
  const CategoryCarousel(this.heading, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<EachArticleModel>> data = ref.watch(newsProvider(heading));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          child: Text(
            heading,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 200,
          child: data.when(
            data: (articleList) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return NewsThumbnail(articleList[index]);
                },
                itemCount: articleList.length,
              );
            },
            error: (error, stackTrace) {
              return const Center(
                child: Text("Error fetching data"),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
