import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=6054cbb69ba34b869a7db527b05a1570"));
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
          );

          news.add(articleModel);
        }
      });
    }
  }
}
