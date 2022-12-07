// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdsModel {
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdsModelCopyWith<AdsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsModelCopyWith<$Res> {
  factory $AdsModelCopyWith(AdsModel value, $Res Function(AdsModel) then) =
      _$AdsModelCopyWithImpl<$Res, AdsModel>;
  @useResult
  $Res call(
      {String id, String image, String title, String content, String url});
}

/// @nodoc
class _$AdsModelCopyWithImpl<$Res, $Val extends AdsModel>
    implements $AdsModelCopyWith<$Res> {
  _$AdsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? title = null,
    Object? content = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdsModelCopyWith<$Res> implements $AdsModelCopyWith<$Res> {
  factory _$$_AdsModelCopyWith(
          _$_AdsModel value, $Res Function(_$_AdsModel) then) =
      __$$_AdsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String image, String title, String content, String url});
}

/// @nodoc
class __$$_AdsModelCopyWithImpl<$Res>
    extends _$AdsModelCopyWithImpl<$Res, _$_AdsModel>
    implements _$$_AdsModelCopyWith<$Res> {
  __$$_AdsModelCopyWithImpl(
      _$_AdsModel _value, $Res Function(_$_AdsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? title = null,
    Object? content = null,
    Object? url = null,
  }) {
    return _then(_$_AdsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AdsModel implements _AdsModel {
  _$_AdsModel(
      {required this.id,
      required this.image,
      required this.title,
      required this.content,
      required this.url});

  @override
  final String id;
  @override
  final String image;
  @override
  final String title;
  @override
  final String content;
  @override
  final String url;

  @override
  String toString() {
    return 'AdsModel(id: $id, image: $image, title: $title, content: $content, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, image, title, content, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdsModelCopyWith<_$_AdsModel> get copyWith =>
      __$$_AdsModelCopyWithImpl<_$_AdsModel>(this, _$identity);
}

abstract class _AdsModel implements AdsModel {
  factory _AdsModel(
      {required final String id,
      required final String image,
      required final String title,
      required final String content,
      required final String url}) = _$_AdsModel;

  @override
  String get id;
  @override
  String get image;
  @override
  String get title;
  @override
  String get content;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_AdsModelCopyWith<_$_AdsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
