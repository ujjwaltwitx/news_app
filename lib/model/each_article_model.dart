class EachArticleModel {
  String? title;
  String? content;
  String imgUrl =
      'https://cdn.vectorstock.com/i/preview-1x/85/43/error-page-not-found-vector-27898543.webp';
  String? url;
  String? author;

  EachArticleModel(
    this.title,
    this.content,
    this.imgUrl,
    this.url,
    this.author,
  );

  factory EachArticleModel.fromJSON(Map<String, dynamic> data) {
    return EachArticleModel(
      data['title'],
      data['content'],
      data['urlToImage'] ??
          'https://cdn.vectorstock.com/i/preview-1x/85/43/error-page-not-found-vector-27898543.webp',
      data['url'],
      data['author'],
    );
  }
}
