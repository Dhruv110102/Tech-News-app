import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart';
import 'package:news_app/model/article_model.dart';



class ApiServices{
  final endPointUrl="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=3580036df8004dd5b6fdbf5c29d68add";

  Future<List<Article>> getArticle()  async {
  Response res= await get(endPointUrl);
  if(res.statusCode==200){
  Map<String, dynamic> json= jsonDecode(res.body);
  List<dynamic> body= json['articles'];
  List<Article> articles= body.map((dynamic item) => Article.fromJSON(item) ).toList();

  return articles;


  }else{
  throw("Cant get articles");
  }
}

}