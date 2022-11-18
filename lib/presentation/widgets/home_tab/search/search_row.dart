import 'package:chomoi/presentation/pages/home_tab/search/viewmodels/search_view_model.dart';
import 'package:chomoi/presentation/widgets/ink_well_container.dart';
import 'package:flutter/material.dart';

class SearchRow extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final SearchViewModel viewModel;

  const SearchRow({
    Key? key,
    this.onTap,
    required this.viewModel,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWellContainer(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor,
              width: 0.5,
            ),
          ),
        ),
        child: Text(
          viewModel.key,
        ),
      ),
    );
  }
}
