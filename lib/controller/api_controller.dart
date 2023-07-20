import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/controller/api_keys_controller.dart';
import 'package:news_app/model/each_article_model.dart';

final newsProvider = FutureProvider.family<List<EachArticleModel>, String>(
    (ref, category) async {
  final dio = Dio();
  final apiKey = await ref.watch(apiKeyProvider);
  var response = await dio.get(
      "https://newsapi.org/v2/top-headlines?country=in&category=${category.toLowerCase()}&apiKey=$apiKey");
  Map<String, dynamic> content = response.data;
  List<EachArticleModel> articleList = [];
  List tempList = content['articles'];
  tempList.forEach((element) {
    articleList.add(EachArticleModel.fromJSON(element));
  });
  return articleList;
});
