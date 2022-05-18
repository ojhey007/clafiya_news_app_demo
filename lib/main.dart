import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_demo/app_global_util/app_setup.dart';
import 'package:news_app_demo/home/view/home.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() {
  registerApiInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News Demo',
      smartManagement: SmartManagement.keepFactory,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
