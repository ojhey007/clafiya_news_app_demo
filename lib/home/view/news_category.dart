import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_demo/home/controller/news_category_controller.dart';
import 'package:news_app_demo/home/view/widget/app_bar.dart';
import 'package:news_app_demo/home/view/widget/news_tile.dart';

class NewsCategory extends StatelessWidget {
  final String newsCategory;
  final NewsCategoryController newsCategoryController =
      Get.put(NewsCategoryController());
  NewsCategory({Key? key, required this.newsCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    newsCategoryController.getNewsCategory(newsCategory);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(20, 64),
          child: AppBarMenu(
            appTitle: newsCategory.toUpperCase(),
          ),
        ),
        body: Obx(
          () => SafeArea(
              child: newsCategoryController.isCategoryLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Obx(() => SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: ListView.builder(
                              itemCount: newsCategoryController
                                  .newsCategorylist.length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Obx(() => NewsTile(
                                      imgUrl: newsCategoryController
                                          .newsCategorylist[index].urlToImage,
                                      title: newsCategoryController
                                          .newsCategorylist[index].title,
                                      description: newsCategoryController
                                          .newsCategorylist[index].description,
                                      content: newsCategoryController
                                          .newsCategorylist[index].content,
                                      articleUrl: newsCategoryController
                                          .newsCategorylist[index].articleUrl,
                                    ));
                              }),
                        ),
                      ))),
        ));
  }
}
