// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CommentModelTearOff {
  const _$CommentModelTearOff();

  _CommentModel call(
      {required String id,
      required String postId,
      required String userId,
      required String content,
      required double createAt,
      required String avatar,
      required String fullname}) {
    return _CommentModel(
      id: id,
      postId: postId,
      userId: userId,
      content: content,
      createAt: createAt,
      avatar: avatar,
      fullname: fullname,
    );
  }
}

/// @nodoc
const $CommentModel = _$CommentModelTearOff();

/// @nodoc
mixin _$CommentModel {
  String get id => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  double get createAt => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String postId,
      String userId,
      String content,
      double createAt,
      String avatar,
      String fullname});
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res> implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  final CommentModel _value;
  // ignore: unused_field
  final $Res Function(CommentModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? userId = freezed,
    Object? content = freezed,
    Object? createAt = freezed,
    Object? avatar = freezed,
    Object? fullname = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as double,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: fullname == freezed
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CommentModelCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$CommentModelCopyWith(
          _CommentModel value, $Res Function(_CommentModel) then) =
      __$CommentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String postId,
      String userId,
      String content,
      double createAt,
      String avatar,
      String fullname});
}

/// @nodoc
class __$CommentModelCopyWithImpl<$Res> extends _$CommentModelCopyWithImpl<$Res>
    implements _$CommentModelCopyWith<$Res> {
  __$CommentModelCopyWithImpl(
      _CommentModel _value, $Res Function(_CommentModel) _then)
      : super(_value, (v) => _then(v as _CommentModel));

  @override
  _CommentModel get _value => super._value as _CommentModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? userId = freezed,
    Object? content = freezed,
    Object? createAt = freezed,
    Object? avatar = freezed,
    Object? fullname = freezed,
  }) {
    return _then(_CommentModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as double,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: fullname == freezed
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CommentModel implements _CommentModel {
  _$_CommentModel(
      {required this.id,
      required this.postId,
      required this.userId,
      required this.content,
      required this.createAt,
      required this.avatar,
      required this.fullname});

  @override
  final String id;
  @override
  final String postId;
  @override
  final String userId;
  @override
  final String content;
  @override
  final double createAt;
  @override
  final String avatar;
  @override
  final String fullname;

  @override
  String toString() {
    return 'CommentModel(id: $id, postId: $postId, userId: $userId, content: $content, createAt: $createAt, avatar: $avatar, fullname: $fullname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.createAt, createAt) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.fullname, fullname));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(createAt),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(fullname));

  @JsonKey(ignore: true)
  @override
  _$CommentModelCopyWith<_CommentModel> get copyWith =>
      __$CommentModelCopyWithImpl<_CommentModel>(this, _$identity);
}

abstract class _CommentModel implements CommentModel {
  factory _CommentModel(
      {required String id,
      required String postId,
      required String userId,
      required String content,
      required double createAt,
      required String avatar,
      required String fullname}) = _$_CommentModel;

  @override
  String get id;
  @override
  String get postId;
  @override
  String get userId;
  @override
  String get content;
  @override
  double get createAt;
  @override
  String get avatar;
  @override
  String get fullname;
  @override
  @JsonKey(ignore: true)
  _$CommentModelCopyWith<_CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
