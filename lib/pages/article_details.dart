import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/source_model.dart';
import 'dart:core';

import 'package:news_app/services/api_ser.dart';
import 'package:news_app/model/article_model.dart';

class ArticlePage extends StatelessWidget {

  final Article article;
  ArticlePage({required this.article});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Column(
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(article.urlToImage),
                  fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(height: 8.0,),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(article.source.name,style: TextStyle(
              color: Colors.white,
            ),),
          ),
          SizedBox(height: 8.0,),
          Text(article.description,style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 16.0),)
        ],
      ),
    );
  }
}


