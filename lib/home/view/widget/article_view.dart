import 'package:flutter/material.dart';
import 'package:news_app_demo/app_const/app_constant.dart';
import 'package:news_app_demo/home/view/widget/app_bar.dart';
import 'package:news_app_demo/home/view/widget/web_view_stack.dart';

class ArticleView extends StatefulWidget {
  final String postUrl;
  const ArticleView({required this.postUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(20, 64),
          child: AppBarMenu(
            appTitle: appTitle,
          )),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebViewStack(
            initialUrl: widget.postUrl,
          )),
    );
  }
}
