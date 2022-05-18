import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_demo/app_const/app_constant.dart';
import 'package:news_app_demo/home/controller/home_controller.dart';
import 'package:news_app_demo/home/view/widget/app_bar.dart';
import 'package:news_app_demo/home/view/widget/category_card.dart';
import 'package:news_app_demo/home/view/widget/news_tile.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(20, 64),
            child: AppBarMenu(appTitle: appTitle)),
        body: Obx((() => SafeArea(
            child: homeController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Obx(
                    () => SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          // Categories
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            height: 70,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController.categories.length,
                                itemBuilder: (context, index) {
                                  return CategoryCard(
                                    imageAssetUrl: homeController
                                        .categories[index].imageAssetUrl,
                                    categoryName: homeController
                                        .categories[index].categoryName,
                                  );
                                }),
                          ),

                          // News Article
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: ListView.builder(
                                itemCount: homeController.newslist.length,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Obx(() => NewsTile(
                                      imgUrl: homeController
                                          .newslist[index].urlToImage,
                                      title:
                                          homeController.newslist[index].title,
                                      description: homeController
                                          .newslist[index].description,
                                      content: homeController
                                          .newslist[index].content,
                                      articleUrl: homeController
                                          .newslist[index].articleUrl));
                                }),
                          ),
                        ],
                      ),
                    ),
                  )))));
  }
}
