import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=${dotenv.env['API_KEY'].toString()}"));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              author: element["author"],
              content: element["content"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              source: element["source"]["name"],
              publishedAt: element["publishedAt"]);

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${dotenv.env['API_KEY'].toString()}"));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              author: element["author"],
              content: element["content"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              source: element["source"]["name"],
              publishedAt: element["publishedAt"]);

          news.add(articleModel);
        }
      });
    }
  }
}
