import 'source_model.dart';
class Article{
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publisherAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publisherAt,
    required this.content,
});
  factory Article.fromJSON(Map<String, dynamic> json){
    return Article(
      source: Source.fromJSON(json['source']),
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publisherAt: json['publisherAt'] as String,
      content: json['content'] as String,

    );
  }

}