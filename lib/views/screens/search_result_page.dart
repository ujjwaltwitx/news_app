import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/controller/search_result_controller.dart';
import 'package:news_app/views/widgets/search_result_widget.dart';

import '../../model/each_article_model.dart';

class SearchResultPage extends ConsumerWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController keywordController = TextEditingController();
    AsyncValue<List<EachArticleModel>> data =
        ref.watch(searchResultProvider(keywordController.text));
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onSubmitted: (value) {
            ref.read(searchTextProvider.notifier).update((state) => value);
          },
          maxLines: 1,
          decoration: const InputDecoration(hintText: 'Type a keyword'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          //   child: Text(
          //     "Results for : ${keywordController.text}",
          //     style: const TextStyle(fontSize: 20),
          //   ),
          // ),
          Expanded(
            // height: 600,
            child: data.when(
              data: (articleList) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return SearchResultWidget(articleList[index]);
                  },
                  itemCount: articleList.length,
                );
              },
              error: (error, stackTrace) => const Center(
                child: Text("Error fetching data"),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
