// import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiKeyProvider = StateProvider((ref) async {
  final List<String> keys = [
    // 'f280dfd066bb428c9b642535acd1eeee',
    'aa5c4ac5663148518791fb54ef1f2297'
  ];
  // final dio = Dio();
  // int i = 0;
  // for (i; i < keys.length; i++) {
  //   var response = await dio
  //       .get("https://newsapi.org/v2/everything?q=bitcoin&apiKey=${keys[i]}");
  //   if (response.data['status'] == "ok") {
  //     break;
  //   }
  // }
  return keys[0];
});
