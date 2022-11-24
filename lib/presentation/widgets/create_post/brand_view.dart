import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/domain/models/response/brand/brand_model.dart';
import 'package:chomoi/presentation/pages/create_post/viewmodels/brand_selection_view_model.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/create_post/brand_row.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/ios_search_bar.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandView extends StatefulWidget {
  final List<BrandModel> brands;
  final Function(BrandModel)? onTap;
  final BrandModel selectedBrand;

  const BrandView(
      {Key? key, required this.brands, this.onTap, required this.selectedBrand})
      : super(key: key);

  @override
  State<BrandView> createState() => _BrandViewState();
}

class _BrandViewState extends State<BrandView> {
  List<BrandModel> otherBrands = [];
  bool isQueryEmpty = true;

  @override
  void initState() {
    _initOtherBrandList();
    super.initState();
  }

  void _initOtherBrandList() {
    otherBrands.addAll(
      widget.brands.where(
              (element) =>
          element.name.compareTo(widget.selectedBrand.name) != 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: CustomAppBar(
        title: AppStrings.category_selection_title,
        background: AppColors.secondaryBackgroundColor,
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
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                _buildSearchBar,
                if (widget.selectedBrand.name.isNotEmpty && isQueryEmpty) ...[
                  _buildTitle(AppStrings.selected_text),
                  _buildSelectedBrand,
                ],
                if (isQueryEmpty)
                  _buildTitle(AppStrings.other_text)
                else
                  _buildTitle(AppStrings.recommend_text),
                _buildBrandList
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle(String text) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 30, bottom: 10),
          child: Text(
            text,
            style: AppTextStyles.infoRegular13w400.copyWith(
              color: AppColors.grayPhilippine,
            ),
          ),
        ),
      );

  Widget get _buildSearchBar =>
      SliverToBoxAdapter(
        child: IOSSearchBar(
          height: AppConstant.heightAppBarSearch,
          placeholder: AppStrings.search_brand_text,
          color: Colors.white,
          borderRadius: BorderRadius.zero,
          isShowBackButton: false,
          enable: true,
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: AppColors.black,
          ),
          onUpdate: (text) {
            filterSearchResults(text);
            setState(() {
              isQueryEmpty = text.isEmpty;
            });
          },
        ),
      );

  Widget get _buildSelectedBrand =>
      SliverToBoxAdapter(
        child: BrandRow(
          viewModel: BrandSelectionViewModel.fromBrand(widget.selectedBrand),
          isSelected: true,
        ),
      );

  Widget get _buildBrandList =>
      SliverToBoxAdapter(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
              BrandRow(
                viewModel: BrandSelectionViewModel.fromBrand(
                    otherBrands[index]),
                onTap: () {
                  widget.onTap?.call(otherBrands[index]);
                },
                isSelected:
                otherBrands[index].name.compareTo(widget.selectedBrand.name) ==
                    0,
              ),
          itemCount: otherBrands.length,
        ),
      );

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      final List<BrandModel> tempBrand = [];
      widget.brands.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          tempBrand.add(item);
        }
      });
      setState(() {
        otherBrands.clear();
        otherBrands.addAll(tempBrand);
      });
      return;
    } else {
      setState(() {
        otherBrands.clear();
        _initOtherBrandList();
      });
    }
  }
}
