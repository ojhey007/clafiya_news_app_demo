import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_demo/api/api.dart';
import 'package:news_app_demo/home/controller/home_controller.dart';
import 'package:news_app_demo/home/repository/news_repository_impl.dart';
import 'package:news_app_demo/home/service/home_service.dart';

final container = GetIt.instance;

Future<void> registerApiInstance() async {
  final Api api = Api(Dio());
  Get.put(api);
  api.setUpInterceptors();

  container
      .registerLazySingleton<NewsRepositoryImpl>(() => NewsRepositoryImpl());
  container.registerLazySingleton<NewsService>(() => NewsService());
  container.registerLazySingleton<HomeController>(() => HomeController());
}
