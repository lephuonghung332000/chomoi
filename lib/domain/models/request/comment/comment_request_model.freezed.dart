// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CommentRequestModelTearOff {
  const _$CommentRequestModelTearOff();

  _CommentRequestModel call(
      {required String postId,
      required String userId,
      required String content}) {
    return _CommentRequestModel(
      postId: postId,
      userId: userId,
      content: content,
    );
  }
}

/// @nodoc
const $CommentRequestModel = _$CommentRequestModelTearOff();

/// @nodoc
mixin _$CommentRequestModel {
  String get postId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentRequestModelCopyWith<CommentRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentRequestModelCopyWith<$Res> {
  factory $CommentRequestModelCopyWith(
          CommentRequestModel value, $Res Function(CommentRequestModel) then) =
      _$CommentRequestModelCopyWithImpl<$Res>;
  $Res call({String postId, String userId, String content});
}

/// @nodoc
class _$CommentRequestModelCopyWithImpl<$Res>
    implements $CommentRequestModelCopyWith<$Res> {
  _$CommentRequestModelCopyWithImpl(this._value, this._then);

  final CommentRequestModel _value;
  // ignore: unused_field
  final $Res Function(CommentRequestModel) _then;

  @override
  $Res call({
    Object? postId = freezed,
    Object? userId = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CommentRequestModelCopyWith<$Res>
    implements $CommentRequestModelCopyWith<$Res> {
  factory _$CommentRequestModelCopyWith(_CommentRequestModel value,
          $Res Function(_CommentRequestModel) then) =
      __$CommentRequestModelCopyWithImpl<$Res>;
  @override
  $Res call({String postId, String userId, String content});
}

/// @nodoc
class __$CommentRequestModelCopyWithImpl<$Res>
    extends _$CommentRequestModelCopyWithImpl<$Res>
    implements _$CommentRequestModelCopyWith<$Res> {
  __$CommentRequestModelCopyWithImpl(
      _CommentRequestModel _value, $Res Function(_CommentRequestModel) _then)
      : super(_value, (v) => _then(v as _CommentRequestModel));

  @override
  _CommentRequestModel get _value => super._value as _CommentRequestModel;

  @override
  $Res call({
    Object? postId = freezed,
    Object? userId = freezed,
    Object? content = freezed,
  }) {
    return _then(_CommentRequestModel(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CommentRequestModel implements _CommentRequestModel {
  _$_CommentRequestModel(
      {required this.postId, required this.userId, required this.content});

  @override
  final String postId;
  @override
  final String userId;
  @override
  final String content;

  @override
  String toString() {
    return 'CommentRequestModel(postId: $postId, userId: $userId, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentRequestModel &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$CommentRequestModelCopyWith<_CommentRequestModel> get copyWith =>
      __$CommentRequestModelCopyWithImpl<_CommentRequestModel>(
          this, _$identity);
}

abstract class _CommentRequestModel implements CommentRequestModel {
  factory _CommentRequestModel(
      {required String postId,
      required String userId,
      required String content}) = _$_CommentRequestModel;

  @override
  String get postId;
  @override
  String get userId;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$CommentRequestModelCopyWith<_CommentRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
