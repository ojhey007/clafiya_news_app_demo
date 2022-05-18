import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_demo/api/api.dart';
import 'package:news_app_demo/api/api_constant.dart';
import 'package:news_app_demo/home/repository/news_respository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final Api api = Get.find<Api>();

  @override
  getNews() async {
    try {
      return await api.dio.get(loadNewsEndpoint);
    } on DioError catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  getNewsCategory(String category) async {
    try {
      return await api.dio.get(loadNewsCategoriesEndpoint(category));
    } on DioError catch (e) {
      debugPrint(e.toString());
    }
  }
}
