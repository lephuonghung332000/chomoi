import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/util/date_formats.dart';
import 'package:chomoi/app/util/date_time_extensions.dart';
import 'package:chomoi/app/util/double_extension.dart';
import 'package:chomoi/app/util/int_extension.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';

class PostViewModel {
  final String? title;
  final List<String>? image;
  final int? price;
  final String? avatarUrl;
  final String? address;
  final double? dateJoin;
  final String? name;
  final String? phone;
  final String? email;
  final String? content;
  final double? createAt;

  PostViewModel({
    this.title,
    this.image,
    this.price,
    this.avatarUrl,
    this.address,
    this.createAt,
    this.dateJoin,
    this.name,
    this.content,
    this.phone,
    this.email,
  });

  String get formattedPrice => price?.currency.replaceAll('VND', 'đ') ?? '';

  String get firstImage => image?.first ?? '';

  String get province => address?.split(',')[2] ?? '';

  String get avatar => avatarUrl ?? '';

  String get titlePost => title ?? '';

  String get contentPost => content?.formatContent ?? '';

  String get timeAgo => createAt?.toDateTime.timeAgo ?? '';

  String get time => createAt?.toDateTime.localTimeZoneString(DateFormatEnum.weekdayDayMonthYear) ?? '';

  String get postInfo => '・$timeAgo・$province';

  String get addressPost => address ?? '';

  String get dateJoinPost =>
      '${AppStrings.date_join_text}: ${dateJoin?.toDateTime.timeAgo ?? 'N/A'}';

  String get nameUser => name ?? '';

  String get phoneUser => phone ?? '';

  String get emailUser => email ?? '';

  factory PostViewModel.fromPost(PostModel postModel) {
    return PostViewModel(
      title: postModel.title,
      image: postModel.images,
      price: postModel.price,
      address: postModel.address,
      createAt: postModel.createAt,
      avatarUrl: postModel.avatar,
      dateJoin: postModel.dateJoin,
      name: postModel.name,
      phone: postModel.phone,
      content: postModel.description,
      email: postModel.email,
    );
  }
}

extension ContentExt on String {
  String get formatContent {
    return replaceAll(r'\n', '\n');
  }
}
