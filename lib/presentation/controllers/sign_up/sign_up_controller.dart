import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/app/util/gender.dart';
import 'package:chomoi/app/util/get_cupertino_dialog.dart';
import 'package:chomoi/domain/models/request/auth/sign_up_request_model.dart';
import 'package:chomoi/domain/models/response/auth/sign_up_information_model.dart';
import 'package:chomoi/domain/models/response/country/district_model.dart';
import 'package:chomoi/domain/models/response/country/province_model.dart';
import 'package:chomoi/domain/models/response/country/ward_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/auth/signup_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_districts_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_provinces_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_wards_use_case.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  // form field
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final familyNameController = TextEditingController();
  final genderController = TextEditingController();
  final provinceController = TextEditingController();
  final districtController = TextEditingController();
  final wardController = TextEditingController();
  final birthdayController = TextEditingController();
  final passwordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();

  // use cases
  final FetchProvincesUseCase fetchProvincesUseCase;
  final FetchDistrictsUseCase fetchDistrictsUseCase;
  final FetchWardsUseCase fetchWardsUseCase;
  final SignUpUseCase signUpUseCase;

  SignUpController({
    required this.fetchProvincesUseCase,
    required this.fetchDistrictsUseCase,
    required this.fetchWardsUseCase,
    required this.signUpUseCase,
  });

  final List<String> genders = ['Nam', 'Nữ'];
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

  final _selectedProvince = Rxn<ProvinceModel>();
  final _selectedDistrict = Rxn<DistrictModel>();
  final _selectedWard = Rxn<WardModel>();
  final _selectedDate = DateTime.now().obs;

  ProvinceModel? get selectedProvince => _selectedProvince.value;

  DistrictModel? get selectedDistrict => _selectedDistrict.value;

  WardModel? get selectedWard => _selectedWard.value;

  DateTime? get selectedDate => _selectedDate.value;

  final _isValidForm = false.obs;

  bool get isValidForm => _isValidForm.value;

  final _signUpState = States<SignUpInformationModel>.init(
    entity: SignUpInformationModel.empty(),
  ).obs;

  States<SignUpInformationModel> get signUpState => _signUpState.value;

  @override
  Future<void> onReady() async {
    super.onReady();
    getProvinces();
  }

  void onValidForm() {
    _isValidForm.value = signUpFormKey.currentState!.validate() &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        familyNameController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        provinceController.text.isNotEmpty &&
        districtController.text.isNotEmpty &&
        wardController.text.isNotEmpty &&
        birthdayController.text.isNotEmpty;
  }

  void setSelectedProvince(ProvinceModel? value) {
    _selectedProvince.value = value;
  }

  void setSelectedDistrict(DistrictModel? value) {
    _selectedDistrict.value = value;
  }

  void setSelectedWard(WardModel? value) {
    _selectedWard.value = value;
  }

  void setSelectedDate(DateTime? value) {
    _selectedDate.value = value ?? DateTime.now();
  }

  void _clearInputDistrict() {
    //clear district field
    if (districtController.text.isNotEmpty) {
      districtController.clear();
    }
  }

  void _clearInputWard() {
    //clear ward field
    if (wardController.text.isNotEmpty) {
      wardController.clear();
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
    _clearInputDistrict();
    _clearInputWard();

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
    _clearInputWard();

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

  Future<void> signUp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    _signUpState.value = const States.loading();
    final result = await signUpUseCase.call(
      SignUpRequestModel(
        name: nameController.text,
        gender: genderController.text.gender,
        birthDay: birthdayController.text,
        password: passwordController.text,
        fullName: '${familyNameController.text} ${nameController.text}',
        email: emailController.text,
        address:
            '${wardController.text}, ${districtController.text}, ${provinceController.text}',
        phone: phoneController.text,
      ),
    );
    result.fold((failure) {
      _signUpState.value = States.failure(failure);
      Get.cupertinoDialog(
        title: AppStrings.error_title,
        middleText: failure.toString(),
        onConfirm: () => Get.back(),
        barrierDismissible: false,
      );
    }, (value) {
      _signUpState.value = States.success(entity: value);
      AuthService.get.storeToken(value.idToken);
      _routeToMain();
    });
  }

  void _routeToMain() {
    const animationDuration = Duration(milliseconds: 500);
    Future.delayed(
      animationDuration,
    ).then(
      (value) => Get.offAllNamed(AppPages.mainPage.name),
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    familyNameController.dispose();
    genderController.dispose();
    districtController.dispose();
    provinceController.dispose();
    birthdayController.dispose();
    wardController.dispose();
    super.onClose();
  }
}
