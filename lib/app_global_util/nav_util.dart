import 'package:flutter/material.dart';
import 'package:get/get.dart';

push({required Widget page, dynamic arguments}) {
  Get.to(page, arguments: arguments);
}
