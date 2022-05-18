import 'package:news_app_demo/app_const/app_constant.dart';

loadNewsCategoriesEndpoint(String category) =>
    "http://newsapi.org/v$apiVersion/top-headlines?country=$country&category=$category&apiKey=$apiKey";

const loadNewsEndpoint =
    "http://newsapi.org/v$apiVersion/top-headlines?country=$country&apiKey=$apiKey";
