// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ads_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AdsModelTearOff {
  const _$AdsModelTearOff();

  _AdsModel call(
      {required String id,
      required String image,
      required String title,
      required String content,
      required String url}) {
    return _AdsModel(
      id: id,
      image: image,
      title: title,
      content: content,
      url: url,
    );
  }
}

/// @nodoc
const $AdsModel = _$AdsModelTearOff();

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
      _$AdsModelCopyWithImpl<$Res>;
  $Res call(
      {String id, String image, String title, String content, String url});
}

/// @nodoc
class _$AdsModelCopyWithImpl<$Res> implements $AdsModelCopyWith<$Res> {
  _$AdsModelCopyWithImpl(this._value, this._then);

  final AdsModel _value;
  // ignore: unused_field
  final $Res Function(AdsModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AdsModelCopyWith<$Res> implements $AdsModelCopyWith<$Res> {
  factory _$AdsModelCopyWith(_AdsModel value, $Res Function(_AdsModel) then) =
      __$AdsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String image, String title, String content, String url});
}

/// @nodoc
class __$AdsModelCopyWithImpl<$Res> extends _$AdsModelCopyWithImpl<$Res>
    implements _$AdsModelCopyWith<$Res> {
  __$AdsModelCopyWithImpl(_AdsModel _value, $Res Function(_AdsModel) _then)
      : super(_value, (v) => _then(v as _AdsModel));

  @override
  _AdsModel get _value => super._value as _AdsModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? url = freezed,
  }) {
    return _then(_AdsModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
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
            other is _AdsModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$AdsModelCopyWith<_AdsModel> get copyWith =>
      __$AdsModelCopyWithImpl<_AdsModel>(this, _$identity);
}

abstract class _AdsModel implements AdsModel {
  factory _AdsModel(
      {required String id,
      required String image,
      required String title,
      required String content,
      required String url}) = _$_AdsModel;

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
  _$AdsModelCopyWith<_AdsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
