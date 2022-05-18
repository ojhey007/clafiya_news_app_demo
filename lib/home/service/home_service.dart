import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_demo/app_global_util/app_setup.dart';
import 'package:news_app_demo/home/model/article_model.dart';
import 'package:news_app_demo/home/repository/news_repository_impl.dart';

class NewsService {
  Future<List<Article>> getNews([String? category]) async {
    List<Article> news = [];

    Response response =
        await container.get<NewsRepositoryImpl>().getNews(category);
    Map<String, dynamic> res = response.data;
    if (res['status'] == "ok") {
      res["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element?['title'] ?? "",
            author: element?['author'] ?? "",
            description: element?['description'] ?? "",
            urlToImage: element?['urlToImage'],
            publshedAt: DateTime.parse(element?['publishedAt'] ?? ""),
            content: element?["content"] ?? "",
            articleUrl: element?["url"] ?? "",
          );
          return news.add(article);
        }
      });
    }
    return news;
  }
}
