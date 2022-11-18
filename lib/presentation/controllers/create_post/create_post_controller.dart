import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/category/fetch_category_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostController extends GetxController {
  final FetchCategoryUseCase fetchCategoryUseCase;

  CreatePostController({
    required this.fetchCategoryUseCase,
  });

  String _categoryName = '';

  final createPostFormKey = GlobalKey<FormState>();

  final _categoryState = const States<List<CategoryModel>>.init(
    entity: [],
  ).obs;

  States<List<CategoryModel>> get categoryState => _categoryState.value;

  // form key
  final categoryController = TextEditingController();

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments['categoryName'] != null) {
        _categoryName = Get.arguments['categoryName'] as String;
        categoryController.text = _categoryName;
      }
    }

    super.onInit();
  }

  @override
  void onReady() {
    _fetchCategory();

    super.onReady();
  }

  Future<void> _fetchCategory() async {
    _categoryState.value = const States.loading();
    final result = await fetchCategoryUseCase.call();
    result.fold((failure) {
      _categoryState.value = States.failure(failure);
    }, (value) {
      _categoryState.value = States.success(entity: value);
    });
  }

  void setCategorySelection(String categoryName) {
    Get.back();
    categoryController.text = categoryName;
  }

  @override
  void onClose() {
    categoryController.dispose();

    super.onClose();
  }
}
