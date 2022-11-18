import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/controllers/home_tab/province_selection/province_selection_controller.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/custom_button.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/home_tab/province_selection/province_row.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProvinceSelectionPage extends GetView<ProvinceSelectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryContrastColor,
      appBar: CustomAppBar(
        title: AppStrings.province_selection_title,
        leading: AppBackButton(
          icon: const SvgIcon(
            icon: AppAssets.iconCancel,
          ),
          onBack: () => Navigator.of(context).pop(null),
        ),
      ),
      body: GetX<ProvinceSelectionController>(builder: (controller) {
        return controller.provinceState.when(
          loading: () => const Padding(
            padding: EdgeInsets.only(top: 10),
            child: LoadingScreen(),
          ),
          success: (entity) {
            return Container(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 8, top: 8),
                    child: Row(
                      children: const [
                        SvgIcon(
                          size: 16,
                          icon: AppAssets.iconCity,
                        ),
                        HBox(7),
                        Flexible(
                          child: Text(
                            AppStrings.filter_province_selection_title,
                            style: AppTextStyles.contentBold15w700,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => ProvinceRow(
                        index: index,
                        groupValue: controller.selectedIndex,
                        onChange: controller.onChangeSelection,
                        province: entity[index].provinceName,
                      ),
                      itemCount: entity.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  color: AppColors.greyFog,
                                ),
                                child: Text(
                                  AppStrings.filter_province_selection_title,
                                  style: AppTextStyles.contentBold15w700
                                      .copyWith(
                                          color: AppColors.grayPhilippine),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                entity[controller.selectedIndex].provinceName,
                                style: AppTextStyles.contentRegular15w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const VBox(15),
                        CustomButton(
                          title: AppStrings.apply_text,
                          minWidth: double.infinity,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          onPressed: () => Navigator.of(context)
                              .pop(entity[controller.selectedIndex]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          failure: (exception) => const SizedBox.shrink(),
          init: (entity) => const Padding(
            padding: EdgeInsets.only(top: 10),
            child: LoadingScreen(),
          ),
        );
      }),
    );
  }
}
