import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:flutter/cupertino.dart';

import 'app_back_button.dart';

class IOSSearchBar extends StatefulWidget {
  const IOSSearchBar({
    Key? key,
    this.controller,
    this.focusNode,
    this.placeholder,
    this.padding = const EdgeInsets.symmetric(vertical: 6),
    this.alwaysShowCancelButton = false,
    this.autofocus = false,
    this.enable = true,
    this.isShowChat = false,
    this.onActiveSearch,
    this.onCancel,
    this.onSubmit,
    this.color = AppColors.white,
    this.colorSearchBar = AppColors.white,
    this.onUpdate,
    this.height = 60,
    this.borderRadius,
    this.isShowBackButton = true,
    this.prefixIcon = const Icon(CupertinoIcons.search),
  }) : super(key: key);

  final String? placeholder;

  final EdgeInsetsGeometry? padding;

  final bool alwaysShowCancelButton;

  final bool isShowBackButton;

  final bool autofocus;

  final bool enable;

  final bool isShowChat;

  final Color color;

  final Color colorSearchBar;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final ValueChanged<bool>? onActiveSearch;

  final VoidCallback? onCancel;

  final ValueChanged<String>? onUpdate;

  final ValueChanged<String>? onSubmit;

  final double height;

  final BorderRadius? borderRadius;

  final Widget prefixIcon;

  @override
  State<IOSSearchBar> createState() => _IOSSearchBarState();
}

class _IOSSearchBarState extends State<IOSSearchBar>
    with SingleTickerProviderStateMixin {
  String _lastInput = '';
  TextEditingController? _controller;
  FocusNode? _focusNode;

  TextEditingController? _activeController;
  FocusNode? _activeFocusNode;
  final _hasFocus = ValueNotifier<bool>(false);

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 250),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.easeInOut,
    reverseCurve: Curves.easeInOut,
  );

  @override
  void initState() {
    _hasFocus.addListener(() {
      if (_hasFocus.value) {
        _showCancelButton();
      } else {
        _hideCancelButton();
      }
      widget.onActiveSearch?.call(_hasFocus.value);
    });

    _hasFocus.value = widget.autofocus;
    _initControllerAndFocusNode();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant IOSSearchBar oldWidget) {
    _initControllerAndFocusNode();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

  void _initControllerAndFocusNode() {
    if (widget.controller == null && _controller == null) {
      _controller = TextEditingController();
    }
    if (widget.focusNode == null && _focusNode == null) {
      _focusNode = FocusNode();
    }
    _activeController = widget.controller ?? _controller;
    _activeFocusNode = widget.focusNode ?? _focusNode;
  }

  void _showCancelButton() {
    if (!_animationController.isAnimating) {
      _animationController.forward();
    }
  }

  void _hideCancelButton() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          if (widget.alwaysShowCancelButton) _buildCancelButton(),
          if (widget.isShowBackButton)
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return SizeTransition(
                  axis: Axis.horizontal,
                  axisAlignment: -1,
                  sizeFactor: _animation,
                  child: child!,
                );
              },
              child: Center(child: _buildCancelButton()),
            ),
          if (widget.alwaysShowCancelButton)
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return SizeTransition(
                  axis: Axis.horizontal,
                  axisAlignment: -1,
                  sizeFactor: _animation,
                  child: child!,
                );
              },
              child: HBox(
                Tween<double>(begin: 16, end: 0).evaluate(_animation),
              ),
            ),
          Expanded(child: _buildSearchTextField()),
          if (widget.isShowChat) ...[
            const HBox(16),
            const SvgIcon(
              icon: AppAssets.iconChat,
              size: AppConstant.iconSize,
            )
          ]
        ],
      ),
    );
  }

  CupertinoSearchTextField _buildSearchTextField() {
    return CupertinoSearchTextField(
      controller: _activeController,
      focusNode: _activeFocusNode,
      enabled: widget.enable,
      onChanged: (text) {
        // Issue: https://github.com/flutter/flutter/issues/80024
        // When keyboard is hidden, OnChanged Function is called
        // So need check that last input is same as text.
        if (_lastInput == text) {
          return;
        }

        _lastInput = text;
        widget.onUpdate?.call(text);
      },
      onSubmitted: widget.onSubmit,
      placeholder: widget.placeholder,
      placeholderStyle: AppTextStyles.contentRegular15w400.apply(
        color: AppColors.tertiaryTextColor,
      ),
      prefixIcon: widget.prefixIcon,
      autocorrect: false,
      autofocus: widget.autofocus,
      style: AppTextStyles.titleMediumRegular17w400.apply(
        color: AppColors.primaryTextColor,
      ),
      backgroundColor: widget.color,
      borderRadius: widget.borderRadius,
      onTap: () {
        _hasFocus.value = true;
      },
    );
  }

  Widget _buildCancelButton() {
    return AppBackButton(
      onBack: () {
        _activeFocusNode?.unfocus();
        _hasFocus.value = false;
        widget.onCancel?.call();
        Navigator.of(context).pop();
      },
      padding: EdgeInsets.zero,
    );
  }
}
