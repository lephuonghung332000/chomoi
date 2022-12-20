import 'dart:io';

import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/app/util/file_converter.dart';
import 'package:chomoi/app/util/gender.dart';
import 'package:chomoi/app/util/get_cupertino_dialog.dart';
import 'package:chomoi/domain/models/request/user/user_request_model.dart';
import 'package:chomoi/domain/models/response/country/district_model.dart';
import 'package:chomoi/domain/models/response/country/province_model.dart';
import 'package:chomoi/domain/models/response/country/ward_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/country/fetch_districts_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_provinces_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_wards_use_case.dart';
import 'package:chomoi/domain/usecases/user/update_user_usecase.dart';
import 'package:chomoi/presentation/pages/setting_tab/setting/viewmodels/user_view_model.dart';
import 'package:chomoi/presentation/widgets/loading_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditUserController extends GetxController {
  final FetchProvincesUseCase fetchProvincesUseCase;
  final FetchDistrictsUseCase fetchDistrictsUseCase;
  final FetchWardsUseCase fetchWardsUseCase;
  final UpdateUserUseCase updateUserUseCase;

  EditUserController({
    required this.fetchProvincesUseCase,
    required this.fetchDistrictsUseCase,
    required this.fetchWardsUseCase,
    required this.updateUserUseCase,
  });

  final _userViewModel = UserViewModel().obs;

  UserViewModel get userViewModel => _userViewModel.value;

  File get selectedFile => _file.value;

  final _file = File('').obs;

  final ImagePicker imagePicker = ImagePicker();

  final _selectedDate = DateTime.now().obs;

  DateTime? get selectedDate => _selectedDate.value;

  final List<String> genders = ['Nam', 'Nữ'];

  final _updateUserState = const States<Unit>.init(
    entity: unit,
  ).obs;

  States<Unit> get updateUserState => _updateUserState.value;

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final familyNameController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final birthdayController = TextEditingController();
  final editUserFormKey = GlobalKey<FormState>();

  final _provincesState = const States<List<ProvinceModel>>.init(
    entity: [],
  ).obs;

  final _districtsState = const States<List<DistrictModel>>.init(
    entity: [],
  ).obs;

  final _wardState = const States<List<WardModel>>.init(
    entity: [],
  ).obs;

  States<List<ProvinceModel>> get provincesState => _provincesState.value;

  States<List<DistrictModel>> get districtsState => _districtsState.value;

  States<List<WardModel>> get wardState => _wardState.value;

  final _isValidForm = true.obs;

  bool get isValidForm => _isValidForm.value;

  void onValidForm() {
    _isValidForm.value = editUserFormKey.currentState!.validate() &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        familyNameController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        birthdayController.text.isNotEmpty;
  }

  void _initArguments() {
    // post
    if (Get.arguments != null) {
      if (Get.arguments['user'] != null) {
        _userViewModel.value = Get.arguments['user'] as UserViewModel;
        _initValueEditingController(userViewModel);
      }
    }
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

  void _initValueEditingController(UserViewModel userViewModel) {
    nameController.text = userViewModel.nameUser;
    familyNameController.text = userViewModel.familyNameUser;
    emailController.text = userViewModel.emailUser;
    phoneController.text = userViewModel.phoneUser;
    birthdayController.text = userViewModel.birthDayUser;
    genderController.text = userViewModel.genderUser;
    addressController.text = userViewModel.addressUser;
  }

  Future<void> selectImageFromGallery() async {
    final XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      _file.value = File(selectedImage.path);
    }
    Get.back();
  }

  Future<void> selectImagesFromCamera() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      _file.value = File(pickedImage.path);
    }
    Get.back();
  }

  Future<void> updateUser() async {
    FocusManager.instance.primaryFocus?.unfocus();
    _updateUserState.value = const States.loading();
    LoadingDialog.show();
    final multipartFile =
        _file.value.path.isNotEmpty ? await _file.value.toMultipart : null;

    final updateUserModel = UserRequestModel(
      email: emailController.text,
      name: nameController.text,
      phone: phoneController.text,
      birthday: birthdayController.text,
      fullname: '${familyNameController.text} ${nameController.text}',
      gender: genderController.text.gender,
      address: addressController.text,
      file: multipartFile,
    );
    final userId = AuthService.get.getCurrentUserId();
    if (userId == null) {
      return;
    }
    final result =
        await updateUserUseCase.call(Tuple2(updateUserModel, userId));
    result.fold((failure) async {
      _updateUserState.value = States.failure(failure);
      await LoadingDialog.hide();
      Get.cupertinoDialog(
        title: AppStrings.error_title,
        middleText: failure.toString(),
        onConfirm: () => Get.back(),
        barrierDismissible: false,
      );
    }, (value) async {
      _updateUserState.value = States.success(entity: value);
      await LoadingDialog.hide();
      Get.back(result: true);
    });
  }

  @override
  void onInit() {
    _initArguments();
    super.onInit();
  }

  void setSelectedDate(DateTime? value) {
    _selectedDate.value = value ?? DateTime.now();
  }

  void setAddressSelection(String address) {
    addressController.text = address;
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    familyNameController.dispose();
    genderController.dispose();
    addressController.dispose();
    birthdayController.dispose();
    super.onClose();
  }
}
