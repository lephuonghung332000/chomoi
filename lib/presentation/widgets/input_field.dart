import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String placeholder;
  final Color color;
  final bool password;
  final bool readOnly;
  final String? label;
  final TextStyle style;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final int? maxLength;
  final int? maxLine;
  final ValueChanged<String>? onChanged;
  final EdgeInsets contentPadding;
  final List<TextInputFormatter> inputFormatters;
  final InputDecoration? decoration;

  const InputField({
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.placeholder = '',
    this.color = AppColors.grayPhilippine,
    this.password = false,
    this.style = AppTextStyles.contentRegular15w400,
    this.validator,
    this.label,
    this.maxLength,
    this.maxLine,
    this.suffixIcon,
    this.onChanged,
    this.readOnly = false,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
    this.onTap,
    this.inputFormatters = const [],
    this.decoration,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isShowPassword = false;
  bool passwordIsNotEmpty = false;

  @override
  void initState() {
    _addPasswordListener();
    super.initState();
  }

  void _addPasswordListener() {
    if (widget.password) {
      widget.controller.addListener(() {
        if (widget.controller.text.isNotEmpty) {
          setState(() {
            passwordIsNotEmpty = true;
          });
        } else {
          setState(() {
            passwordIsNotEmpty = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      maxLength: widget.maxLength,
      maxLines: widget.maxLine ?? 1,
      inputFormatters: widget.inputFormatters,
      decoration: widget.decoration ??
          InputDecoration(
            contentPadding: widget.contentPadding,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.color,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.color,
              ),
            ),
            labelText: widget.label,
            labelStyle: AppTextStyles.contentRegular15w400.copyWith(
              color: AppColors.grayPhilippine,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget.placeholder,
            hintStyle: AppTextStyles.contentRegular15w400.copyWith(
              color: AppColors.grayLight,
            ),
            errorMaxLines: 2,
            errorStyle: AppTextStyles.infoRegular13w400.copyWith(
              color: AppColors.errorColor,
            ),
            isDense: true,
            suffixIconConstraints: const BoxConstraints(minWidth: 10),
            suffixIcon: widget.password && passwordIsNotEmpty
                ? _buildShowAndHidePassword()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: widget.suffixIcon,
                  ),
          ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      style: widget.style,
      onChanged: (text) {
        widget.onChanged?.call(text);
        widget.controller.selection = TextSelection.fromPosition(
          TextPosition(offset: widget.controller.text.length),
        );
      },
      keyboardType: widget.keyboardType,
      obscureText: widget.password && !isShowPassword,
      autocorrect: false,
      readOnly: widget.readOnly,
      validator: widget.validator,
    );
  }

  Widget _buildShowAndHidePassword() => CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        disabledColor: Colors.transparent,
        minSize: 20,
        onPressed: () {
          setState(() {
            isShowPassword = !isShowPassword;
          });
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Text(
            isShowPassword ? AppStrings.hide_title : AppStrings.show_title,
            key: ValueKey<bool>(isShowPassword),
            style: AppTextStyles.infoRegular13w400.copyWith(
              color: AppColors.blueWater,
            ),
          ),
        ),
      );
}
