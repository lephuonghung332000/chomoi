// Declare all app TextStyle.

// Flutter imports:
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:flutter/material.dart';

// Project imports:

abstract class AppTextStyles {
  // headline
  static const TextStyle headlineLargeBold34w700 = TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryTextColor);
  static const TextStyle headlineMediumBold30w700 = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryTextColor);
  static const TextStyle headlineMediumSemiBold30w600 = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryTextColor);

  // heading
  static const TextStyle headlineSmallLight23w300 = TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w300,
      color: AppColors.primaryTextColor);
  static const TextStyle headlineSmallRegular23w400 = TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryTextColor);
  static const TextStyle headlineSmallBold23w700 = TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryTextColor);

  // titleLarge
  static const TextStyle titleLargeLight19w300 = TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w300,
      color: AppColors.primaryTextColor);
  static const TextStyle titleLargeRegular19w400 = TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryTextColor);
  static const TextStyle titleLargeBold19w700 = TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryTextColor);

  // title
  static const TextStyle titleMediumBold17w700 = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryTextColor);
  static const TextStyle titleMediumRegular17w400 = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryTextColor);

  // error
  static const TextStyle errorRegular16w400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
  );

  // content
  static const TextStyle contentRegular15w400 = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryTextColor);
  static const TextStyle contentBold15w700 = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryTextColor);
  static const TextStyle smallContentRegular14w400 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryTextColor);

  // info
  static const TextStyle infoRegular13w400 = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryTextColor);
  static const TextStyle infoMedium13w500 = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryTextColor);
  static const TextStyle infoBold13w700 = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryTextColor);

  // Marker Map
  static const TextStyle smallBold11w700 = TextStyle(
      fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.white);

  // small
  static const TextStyle smallRegular11w400 = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryTextColor);

  // tiny
  static const TextStyle tinyRegular10w400 = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryTextColor);

  // command
  static const TextStyle commandBold9w700 = TextStyle(
      fontSize: 9,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryTextColor);
}
