import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/util/get_model_bottom_sheet.dart';
import 'package:chomoi/domain/models/response/country/district_model.dart';
import 'package:chomoi/domain/models/response/country/province_model.dart';
import 'package:chomoi/domain/models/response/country/ward_model.dart';
import 'package:chomoi/presentation/controllers/create_post/create_post_controller.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/custom_button.dart';
import 'package:chomoi/presentation/widgets/hanlde_popover.dart';
import 'package:chomoi/presentation/widgets/input_field.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'choose_detail_address_view.dart';

class SelectAddressView extends StatefulWidget {
  const SelectAddressView({
    Key? key,
    required this.address,
    required this.height,
    this.onSubmit,
  }) : super(key: key);
  final String address;
  final double height;
  final Function(String)? onSubmit;

  @override
  State<SelectAddressView> createState() => _SelectAddressViewState();
}

class _SelectAddressViewState extends State<SelectAddressView>
    with TickerProviderStateMixin {
  final provinceController = TextEditingController();
  final districtController = TextEditingController();
  final wardController = TextEditingController();
  late AnimationController controller;
  final createPostController = Get.find<CreatePostController>();
  List<ProvinceModel> provinces = [];
  List<DistrictModel> districts = [];
  List<WardModel> wards = [];
  String provinceId = '';
  String districtId = '';

  @override
  void initState() {
    provinceController.text = widget.address.split(',')[2].trim();
    districtController.text = widget.address.split(',')[1].trim();
    wardController.text = widget.address.split(',')[0].trim();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 500);
    controller.drive(CurveTween(curve: Curves.fastOutSlowIn));
    fetchProvince();
    super.initState();
  }

  String get address =>
      '${wardController.text}, ${districtController.text}, ${provinceController.text}';

  Future<void> fetchProvince() async {
    await createPostController.getProvinces();
    createPostController.provincesState.maybeWhen(
        orElse: () {},
        success: (value) {
          provinces = value;
          setIdProvince();
          fetchDistrict();
        });
  }

  Future<void> fetchDistrict() async {
    await createPostController.getDistricts(provinceId: provinceId);
    createPostController.districtsState.maybeWhen(
        orElse: () {},
        success: (value) {
          districts = value;
          setIdDistrict();
          fetchWards();
        });
  }

  Future<void> fetchWards() async {
    await createPostController.getWards(districtId: districtId);
    createPostController.wardState.maybeWhen(
        orElse: () {},
        success: (value) {
          wards = value;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryContrastColor,
      appBar: CustomAppBar(
        title: AppStrings.address_label_create_post_title,
        background: AppColors.primaryBackgroundColor,
        leading: AppBackButton(
          icon: const SvgIcon(
            icon: AppAssets.iconCancel,
          ),
          onBack: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [_buildSelection],
            ),
          ),
          _buildButtonFooter
        ],
      ),
    );
  }

  Widget get _buildButtonFooter => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomButton(
          title: AppStrings.done_select_address_text,
          minWidth: double.infinity,
          fontWeight: FontWeight.w700,
          fontSize: 13,
          height: 35,
          onPressed: () {
            widget.onSubmit?.call(address);
            Get.back();
          },
        ),
      );

  Widget get _buildSelection => SliverToBoxAdapter(
        child: Column(
          children: [
            //province
            _buildInputField(
              context,
              AppStrings.input_province_hint_text,
              provinceController,
              _showProvinceSelection,
            ),
            //district
            _buildInputField(
              context,
              AppStrings.input_district_hint_text,
              districtController,
              _showDistrictSelection,
            ),
            //ward
            _buildInputField(
              context,
              AppStrings.input_ward_hint_text,
              wardController,
              _showWardSelection,
            ),
          ],
        ),
      );

  Widget _buildInputField(BuildContext context, String hintText,
          TextEditingController controller, Function() onTap) =>
      Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 18),
        child: InputField(
          controller: controller,
          readOnly: true,
          label: hintText,
          contentPadding: const EdgeInsets.all(12),
          suffixIcon: const SvgIcon(
            icon: AppAssets.iconArrowDown,
            size: 18,
            color: AppColors.greyStorm,
          ),
          onTap: onTap,
        ),
      );

  Future<void> _showBottomSheet(
      Widget widget, BuildContext context, double height) async {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.modalBottomSheet(
      HandlePopover(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.only(bottom: 30),
        boxShadow: kElevationToShadow[4],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10),
        ),
        height: height,
        child: widget,
      ),
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.5),
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      isDismissible: false,
      transitionAnimationController: controller,
    );
  }

  @override
  void dispose() {
    provinceController.dispose();
    wardController.dispose();
    districtController.dispose();
    super.dispose();
  }

  void _showProvinceSelection() {
    if (provinces.isEmpty) {
      return;
    }

    _showBottomSheet(
      ChooseDetailAddressView(
        address: provinces.map((e) => e.provinceName).toList(),
        titleHeader: AppStrings.input_province_hint_text,
        selectedAddress: provinceController.text,
        onTap: (text) => _handleSelectionProvince(text),
      ),
      context,
      widget.height,
    );
  }

  void _handleSelectionProvince(String text) {
    if (provinceController.text.compareTo(text) != 0) {
      provinceController.text = text;
      wardController.clear();
      districtController.clear();
      setIdProvince();
      fetchDistrict();
    }
    Get.back();
  }

  void _handleSelectionDistrict(String text) {
    if (districtController.text.compareTo(text) != 0) {
      districtController.text = text;
      wardController.clear();
      setIdDistrict();
      fetchWards();
    }
    Get.back();
  }

  void _showDistrictSelection() {
    if (districts.isEmpty) {
      return;
    }

    _showBottomSheet(
      ChooseDetailAddressView(
        address: districts.map((e) => e.districtName).toList(),
        titleHeader: AppStrings.input_district_hint_text,
        selectedAddress: districtController.text,
        onTap: (text) => _handleSelectionDistrict(text),
      ),
      context,
      widget.height,
    );
  }

  void _handleSelectionWard(String text) {
    if (wardController.text.compareTo(text) != 0) {
      wardController.text = text;
    }
    Get.back();
  }

  void _showWardSelection() {
    if (wards.isEmpty) {
      return;
    }

    _showBottomSheet(
      ChooseDetailAddressView(
        address: wards.map((e) => e.wardName).toList(),
        titleHeader: AppStrings.input_ward_hint_text,
        selectedAddress: wardController.text,
        onTap: (text) => _handleSelectionWard(text),
      ),
      context,
      widget.height,
    );
  }

  void setIdProvince() {
    provinceId = provinces
        .where((element) =>
            element.provinceName.compareTo(provinceController.text) == 0)
        .first
        .provinceId;
  }

  void setIdDistrict() {
    districtId = districts
        .where((element) =>
            element.districtName.compareTo(districtController.text) == 0)
        .first
        .districtId;
  }
}
