import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/controller/api_keys_controller.dart';
import 'package:news_app/model/each_article_model.dart';

final searchTextProvider = StateProvider<String>(
  (ref) {
    return " ";
  },
);
final searchResultProvider =
    FutureProvider.family<List<EachArticleModel>, String>((ref, keyword) async {
  final searchText = ref.watch(searchTextProvider);
  final apiKey = await ref.watch(apiKeyProvider);
  final dio = Dio();
  var response = await dio.get(
      "https://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&apiKey=$apiKey");
  Map<String, dynamic> content = response.data;
  List<EachArticleModel> articleList = [];
  List tempList = content['articles'];
  tempList.forEach((element) {
    articleList.add(EachArticleModel.fromJSON(element));
  });
  return articleList;
});
