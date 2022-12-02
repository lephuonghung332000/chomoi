import 'dart:math';

import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/app/util/date_formats.dart';
import 'package:chomoi/app/util/date_time_extensions.dart';
import 'package:chomoi/app/util/double_extension.dart';
import 'package:chomoi/domain/models/response/user/user_model.dart';
import 'package:flutter/material.dart';

class UserViewModel {
  final String? avatarUrl;
  final String? address;
  final String? name;
  final String? fullName;
  final String? phone;
  final String? email;
  final String? content;
  final double? createAt;
  final int? birthday;
  final bool? gender;

  UserViewModel(
      {this.avatarUrl,
      this.address,
      this.createAt,
      this.name,
      this.content,
      this.phone,
      this.email,
      this.fullName,
      this.birthday,
      this.gender});

  String get avatar => avatarUrl ?? '';

  String get addressUser => address ?? '';

  String get nameUser => name ?? '';

  String get familyNameUser => fullName?.replaceAll(RegExp(' $nameUser'), '') ?? '';

  String get phoneUser => phone ?? '';

  String get emailUser => email ?? '';

  String get birthDayUser =>
      birthday
          ?.toDouble()
          .toDateTime
          .localTimeZoneString(DateFormatEnum.dayMonthYear) ??
      '';

  String get genderUser => gender == true ? 'Nam' : 'Nữ';

  String get percentReply =>
      '${next(50, 100)}% (${AppStrings.in_text} ${next(0, 24)} ${AppStrings.hours_text})';

  int next(int min, int max) => min + Random().nextInt(max - min);

  TextSpan get follower => TextSpan(
        children: [
          TextSpan(
            text: '${next(0, 200)} ',
            style: AppTextStyles.smallBold11w700.copyWith(
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: AppStrings.follower_text,
            style: AppTextStyles.smallRegular11w400.copyWith(
              color: AppColors.black,
            ),
          ),
        ],
      );

  TextSpan get isFollowing => TextSpan(
        children: [
          TextSpan(
            text: '${next(0, 200)} ',
            style: AppTextStyles.smallBold11w700.copyWith(
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: AppStrings.is_following_text,
            style: AppTextStyles.smallRegular11w400.copyWith(
              color: AppColors.black,
            ),
          ),
        ],
      );

  double get rating => next(0, 5).toDouble();

  TextSpan ratingInfo(double rating) =>
      userInfoLine('${AppStrings.rating_user_text}: ', '$rating');

  TextSpan get dateJoin => userInfoLine(
      '${AppStrings.date_join_text}: ', createAt?.toDateTime.timeAgo ?? 'N/A');

  TextSpan get addressInfo =>
      userInfoLine('${AppStrings.address_label_create_title}: ', addressUser);

  TextSpan get replyInfo =>
      userInfoLine('${AppStrings.percent_reply_user_text}: ', percentReply);

  TextSpan userInfoLine(String title, String content) => TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppTextStyles.smallRegular11w400.copyWith(
              color: AppColors.greyStorm,
            ),
          ),
          TextSpan(
            text: content,
            style: AppTextStyles.smallRegular11w400.copyWith(
              color: AppColors.black,
            ),
          ),
        ],
      );

  factory UserViewModel.fromUser(UserModel userModel) {
    return UserViewModel(
      address: userModel.address,
      avatarUrl: userModel.avatar,
      createAt: userModel.createAt,
      name: userModel.name,
      phone: userModel.phone,
      email: userModel.email,
      fullName: userModel.fullName,
      birthday: userModel.birthday,
      gender: userModel.gender,
    );
  }
}
