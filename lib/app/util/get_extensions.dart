import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension GetExt on GetInterface {
  NavigatorState get globalNavigator => Get.global(null).currentState!;
}
