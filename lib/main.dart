import 'dart:core';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/customlist.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/services/api_ser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ApiServices client=ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App',style: TextStyle(
          color: Colors.black,
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){
          if(snapshot.hasData){
            List<Article>? articles= snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index)=> customlistTile(articles[index], context),

            );

          }
          return Center(
            child:CircularProgressIndicator() ,
          );
        },
      ),
    );
  }
}

