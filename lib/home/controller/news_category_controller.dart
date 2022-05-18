import 'package:get/get.dart';
import 'package:news_app_demo/app_global_util/app_setup.dart';
import 'package:news_app_demo/home/model/article_model.dart';
import 'package:news_app_demo/home/service/home_service.dart';

class NewsCategoryController extends GetxController {
  RxBool isCategoryLoading = true.obs;
  RxList<Article> newsCategorylist = <Article>[].obs;
  late List<Article> news;

  getNewsCategory(String category) async {
    isCategoryLoading.value = false;
    news = await container.get<NewsService>().getNewsForCategory(category);
    newsCategorylist.assignAll(news);
  }
}
