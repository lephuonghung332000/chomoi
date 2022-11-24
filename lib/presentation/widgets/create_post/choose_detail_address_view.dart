import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/create_post/choose_detail_address_row.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/ios_search_bar.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseDetailAddressView extends StatefulWidget {
  final List<String> address;
  final Function(String)? onTap;
  final String selectedAddress;
  final String titleHeader;

  const ChooseDetailAddressView({
    Key? key,
    required this.address,
    required this.titleHeader,
    this.onTap,
    required this.selectedAddress,
  }) : super(key: key);

  @override
  State<ChooseDetailAddressView> createState() =>
      _ChooseDetailAddressViewState();
}

class _ChooseDetailAddressViewState extends State<ChooseDetailAddressView> {
  List<String> items = [];

  @override
  void initState() {
    _initAddressList();
    super.initState();
  }

  void _initAddressList() {
    items.addAll(widget.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryContrastColor,
      appBar: CustomAppBar(
        title: widget.titleHeader,
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
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [_buildSearchBar(context), _buildAddressDetailList],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor,
              width: 0.5,
            ),
          ),
        ),
        child: IOSSearchBar(
          height: AppConstant.heightAppBarSearch,
          placeholder: AppStrings.search_province_text,
          color: Colors.white,
          borderRadius: BorderRadius.zero,
          isShowBackButton: false,
          enable: true,
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: AppColors.black,
          ),
          onUpdate: (text) => filterSearchResults(text),
        ),
      ),
    );
  }

  Widget get _buildAddressDetailList => SliverToBoxAdapter(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ChooseDetailAddressRow(
            name: items[index],
            isSelected: items[index].toLowerCase().compareTo(
                  widget.selectedAddress.toLowerCase(),
                ) ==
                0,
            onTap: () {
              widget.onTap?.call(items[index]);
            },
          ),
          itemCount: items.length,
        ),
      );

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      final List<String> tempAddress = [];
      widget.address.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          tempAddress.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(tempAddress);
      });
      return;
    } else {
      setState(() {
        items.clear();
        _initAddressList();
      });
    }
  }
}
