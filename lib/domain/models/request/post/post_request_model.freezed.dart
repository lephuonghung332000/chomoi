// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostRequestModel {
  String get title => throw _privateConstructorUsedError;
  String get brandId => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<MultipartFile> get files => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostRequestModelCopyWith<PostRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostRequestModelCopyWith<$Res> {
  factory $PostRequestModelCopyWith(
          PostRequestModel value, $Res Function(PostRequestModel) then) =
      _$PostRequestModelCopyWithImpl<$Res, PostRequestModel>;
  @useResult
  $Res call(
      {String title,
      String brandId,
      String address,
      int price,
      String categoryId,
      String userId,
      String description,
      List<MultipartFile> files});
}

/// @nodoc
class _$PostRequestModelCopyWithImpl<$Res, $Val extends PostRequestModel>
    implements $PostRequestModelCopyWith<$Res> {
  _$PostRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? brandId = null,
    Object? address = null,
    Object? price = null,
    Object? categoryId = null,
    Object? userId = null,
    Object? description = null,
    Object? files = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<MultipartFile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostRequestModelCopyWith<$Res>
    implements $PostRequestModelCopyWith<$Res> {
  factory _$$_PostRequestModelCopyWith(
          _$_PostRequestModel value, $Res Function(_$_PostRequestModel) then) =
      __$$_PostRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String brandId,
      String address,
      int price,
      String categoryId,
      String userId,
      String description,
      List<MultipartFile> files});
}

/// @nodoc
class __$$_PostRequestModelCopyWithImpl<$Res>
    extends _$PostRequestModelCopyWithImpl<$Res, _$_PostRequestModel>
    implements _$$_PostRequestModelCopyWith<$Res> {
  __$$_PostRequestModelCopyWithImpl(
      _$_PostRequestModel _value, $Res Function(_$_PostRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? brandId = null,
    Object? address = null,
    Object? price = null,
    Object? categoryId = null,
    Object? userId = null,
    Object? description = null,
    Object? files = null,
  }) {
    return _then(_$_PostRequestModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<MultipartFile>,
    ));
  }
}

/// @nodoc

class _$_PostRequestModel implements _PostRequestModel {
  _$_PostRequestModel(
      {required this.title,
      required this.brandId,
      required this.address,
      required this.price,
      required this.categoryId,
      required this.userId,
      required this.description,
      required final List<MultipartFile> files})
      : _files = files;

  @override
  final String title;
  @override
  final String brandId;
  @override
  final String address;
  @override
  final int price;
  @override
  final String categoryId;
  @override
  final String userId;
  @override
  final String description;
  final List<MultipartFile> _files;
  @override
  List<MultipartFile> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  String toString() {
    return 'PostRequestModel(title: $title, brandId: $brandId, address: $address, price: $price, categoryId: $categoryId, userId: $userId, description: $description, files: $files)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostRequestModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      brandId,
      address,
      price,
      categoryId,
      userId,
      description,
      const DeepCollectionEquality().hash(_files));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostRequestModelCopyWith<_$_PostRequestModel> get copyWith =>
      __$$_PostRequestModelCopyWithImpl<_$_PostRequestModel>(this, _$identity);
}

abstract class _PostRequestModel implements PostRequestModel {
  factory _PostRequestModel(
      {required final String title,
      required final String brandId,
      required final String address,
      required final int price,
      required final String categoryId,
      required final String userId,
      required final String description,
      required final List<MultipartFile> files}) = _$_PostRequestModel;

  @override
  String get title;
  @override
  String get brandId;
  @override
  String get address;
  @override
  int get price;
  @override
  String get categoryId;
  @override
  String get userId;
  @override
  String get description;
  @override
  List<MultipartFile> get files;
  @override
  @JsonKey(ignore: true)
  _$$_PostRequestModelCopyWith<_$_PostRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
