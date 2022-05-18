import 'package:get/get.dart';
import 'package:news_app_demo/app_global_util/app_setup.dart';
import 'package:news_app_demo/home/model/category_model.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;

  RxList<Article> newslist = <Article>[].obs;
  late List<Article> news;
  // RxList<CategoriesModel> categories = <CategoriesModel>[].obs;
  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  getNews() async {
    news = await container.get<NewsService>().getNews();
    print(news);
    newslist.assignAll(news);
    isLoading.value = false;
  }

  List<CategoryModel> categories = [
    CategoryModel(
        categoryName: "General",
        imageAssetUrl:
            "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
    CategoryModel(
        categoryName: "Entertainment",
        imageAssetUrl:
            "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
    CategoryModel(
        categoryName: "Business",
        imageAssetUrl:
            "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"),
    CategoryModel(
        categoryName: "Health",
        imageAssetUrl:
            "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80"),
    CategoryModel(
        categoryName: "Science",
        imageAssetUrl:
            "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80"),
    CategoryModel(
        categoryName: "Sports",
        imageAssetUrl:
            "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"),
  ];
}
