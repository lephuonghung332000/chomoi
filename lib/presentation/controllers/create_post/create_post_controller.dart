import 'dart:io';

import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/app/util/file_converter.dart';
import 'package:chomoi/app/util/get_cupertino_dialog.dart';
import 'package:chomoi/domain/models/request/post/post_request_model.dart';
import 'package:chomoi/domain/models/response/brand/brand_model.dart';
import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/domain/models/response/country/district_model.dart';
import 'package:chomoi/domain/models/response/country/province_model.dart';
import 'package:chomoi/domain/models/response/country/ward_model.dart';
import 'package:chomoi/domain/models/response/user/user_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/brand/fetch_brand_use_case.dart';
import 'package:chomoi/domain/usecases/category/fetch_category_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_districts_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_provinces_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_wards_use_case.dart';
import 'package:chomoi/domain/usecases/post/add_post_usecase.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:chomoi/presentation/widgets/loading_dialog.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostController extends GetxController {
  final FetchCategoryUseCase fetchCategoryUseCase;
  final FetchBrandUseCase fetchBrandUseCase;
  final FetchProvincesUseCase fetchProvincesUseCase;
  final FetchDistrictsUseCase fetchDistrictsUseCase;
  final FetchWardsUseCase fetchWardsUseCase;
  final FetchUserUseCase fetchUserUseCase;
  final AddPostUseCase addPostUseCase;

  CreatePostController({
    required this.fetchCategoryUseCase,
    required this.fetchBrandUseCase,
    required this.fetchProvincesUseCase,
    required this.fetchDistrictsUseCase,
    required this.fetchWardsUseCase,
    required this.fetchUserUseCase,
    required this.addPostUseCase,
  });

  String _categoryName = '';

  final _categoryState = const States<List<CategoryModel>>.init(
    entity: [],
  ).obs;

  States<List<CategoryModel>> get categoryState => _categoryState.value;

  final _brandState = const States<List<BrandModel>>.init(
    entity: [],
  ).obs;

  States<List<BrandModel>> get brandState => _brandState.value;

  // form key
  final categoryController = TextEditingController();

  final brandController = TextEditingController();

  final priceController = TextEditingController();

  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  final addressController = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();

  final _imageFiles = RxList<File>();

  final _formatter = CurrencyTextInputFormatter(locale: 'vi');

  CurrencyTextInputFormatter get formatter => _formatter;

  int _price = 0;

  List<File> get imageFiles => _imageFiles.toList();

  final _selectedBrand = BrandModel.empty().obs;

  BrandModel get selectedBrand => _selectedBrand.value;

  final _userState = States<UserModel>.init(
    entity: UserModel.empty(),
  ).obs;

  States<UserModel> get userState => _userState.value;

  final _provincesState = const States<List<ProvinceModel>>.init(
    entity: [],
  ).obs;

  final _districtsState = const States<List<DistrictModel>>.init(
    entity: [],
  ).obs;

  final _wardState = const States<List<WardModel>>.init(
    entity: [],
  ).obs;

  final createPostFormKey = GlobalKey<FormState>();

  States<List<ProvinceModel>> get provincesState => _provincesState.value;

  States<List<DistrictModel>> get districtsState => _districtsState.value;

  States<List<WardModel>> get wardState => _wardState.value;

  final _addPostState = const States<Unit>.init(
    entity: unit,
  ).obs;

  States<Unit> get addPostState => _addPostState.value;

  final _isValidForm = false.obs;

  bool get isValidForm => _isValidForm.value;

  List<CategoryModel> _categories = [];

  void onValidForm() {
    _isValidForm.value = createPostFormKey.currentState!.validate() &&
        categoryController.text.isNotEmpty &&
        brandController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        imageFiles.isNotEmpty;
  }

  Future<void> selectImagesFromGallery() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      final images = selectedImages
          .map(
            (e) => File(e.path),
          )
          .toList();
      _imageFiles.addAll(images);
      onValidForm();
    }
    Get.back();
  }

  Future<void> selectImagesFromCamera() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      final pickedImageFile = File(pickedImage.path);
      _imageFiles.add(pickedImageFile);
      onValidForm();
    }
    Get.back();
  }

  Future<void> getProvinces() async {
    _provincesState.value = const States.loading();
    final result = await fetchProvincesUseCase.call();
    result.fold((failure) {
      _provincesState.value = States.failure(failure);
    }, (value) {
      _provincesState.value = States.success(entity: value);
    });
  }

  Future<void> getDistricts({String? provinceId}) async {
    if (provinceId == null) {
      return;
    }
    final int id = int.parse(provinceId);
    _districtsState.value = const States.loading();
    final result = await fetchDistrictsUseCase.call(id);
    result.fold((failure) {
      _districtsState.value = States.failure(failure);
    }, (value) {
      _districtsState.value = States.success(entity: value);
    });
  }

  Future<void> getWards({String? districtId}) async {
    if (districtId == null) {
      return;
    }
    final int id = int.parse(districtId);

    _wardState.value = const States.loading();
    final result = await fetchWardsUseCase.call(id);
    result.fold((failure) {
      _wardState.value = States.failure(failure);
    }, (value) {
      _wardState.value = States.success(entity: value);
    });
  }

  void routeCreatePostSuccess(
      {required PostRequestModel postRequestModel, required File firstImage}) {
    Get.toNamed(AppPages.createPostSuccessPage.name,
        arguments: {'post': postRequestModel, 'image': firstImage});
  }

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
    _fetchBrand();
    _fetchUser();

    super.onReady();
  }

  Future<void> _fetchUser() async {
    final userId = AuthService.get.getCurrentUserId();
    if (userId == null) {
      return;
    }
    _userState.value = const States.loading();
    // call info myself
    final result = await fetchUserUseCase.call(userId);
    result.fold((failure) {
      _userState.value = States.failure(failure);
    }, (value) {
      _userState.value = States.success(entity: value);
      addressController.text = value.address;
    });
  }

  Future<void> _fetchCategory() async {
    _categoryState.value = const States.loading();
    final result = await fetchCategoryUseCase.call();
    result.fold((failure) {
      _categoryState.value = States.failure(failure);
    }, (value) {
      _categoryState.value = States.success(entity: value);
      _categories = value;
    });
  }

  Future<void> _fetchBrand() async {
    _brandState.value = const States.loading();
    final result = await fetchBrandUseCase.call();
    result.fold((failure) {
      _brandState.value = States.failure(failure);
    }, (value) {
      _brandState.value = States.success(entity: value);
    });
  }

  Future<void> addPost() async {
    FocusManager.instance.primaryFocus?.unfocus();
    _addPostState.value = const States.loading();
    LoadingDialog.show();
    final List<dio.MultipartFile> multipartFiles = [];
    for (int i = 0; i < imageFiles.length; i++) {
      final multipart = await imageFiles[i].toMultipart;
      multipartFiles.add(multipart);
    }
    final categoryId = _categories
        .where(
            (element) => element.name.compareTo(categoryController.text) == 0)
        .first
        .id;

    final userId = AuthService.get.getCurrentUserId();
    if (userId == null) {
      return;
    }

    final postRequestModel = PostRequestModel(
      title: titleController.text,
      brandId: brandController.text,
      address: addressController.text,
      price: _price,
      categoryId: categoryId,
      userId: userId,
      description: descriptionController.text,
      files: multipartFiles,
    );

    final result = await addPostUseCase.call(postRequestModel);
    result.fold((failure) async {
      _addPostState.value = States.failure(failure);
      await LoadingDialog.hide();
      Get.cupertinoDialog(
        title: AppStrings.error_title,
        middleText: failure.toString(),
        onConfirm: () => Get.back(),
        barrierDismissible: false,
      );
    }, (value) async {
      _addPostState.value = States.success(entity: value);
      await LoadingDialog.hide();
      Get.back();
      routeCreatePostSuccess(
          postRequestModel: postRequestModel, firstImage: imageFiles.first);
    });
  }

  void setCategorySelection(String categoryName) {
    Get.back();
    categoryController.text = categoryName;
  }

  void setAddressSelection(String address) {
    addressController.text = address;
  }

  void setBrandSelection(BrandModel brand) {
    Get.back();
    _selectedBrand.value = brand;
    brandController.text = brand.name;
  }

  @override
  void onClose() {
    categoryController.dispose();
    brandController.dispose();
    priceController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    super.onClose();
  }

  void removeImage(File e) {
    _imageFiles.remove(e);
  }

  void formatInputPrice(String value) {
    _price = _formatter.getUnformattedValue().toInt();
  }
}
