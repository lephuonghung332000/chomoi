import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_request_model.freezed.dart';

@freezed
class SearchRequestModel with _$SearchRequestModel {
  factory SearchRequestModel({
    required String key,
    required String userId,
  }) = _SearchRequestModel;

  factory SearchRequestModel.empty() => SearchRequestModel(
        key: '',
        userId: '',
      );
}
