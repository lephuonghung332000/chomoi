// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  double get createAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  bool get isNew => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String content,
      double createAt,
      String title,
      NotificationType type,
      bool isNew,
      bool isRead});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? content = null,
    Object? createAt = null,
    Object? title = null,
    Object? type = null,
    Object? isNew = null,
    Object? isRead = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationModelCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$_NotificationModelCopyWith(_$_NotificationModel value,
          $Res Function(_$_NotificationModel) then) =
      __$$_NotificationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String content,
      double createAt,
      String title,
      NotificationType type,
      bool isNew,
      bool isRead});
}

/// @nodoc
class __$$_NotificationModelCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$_NotificationModel>
    implements _$$_NotificationModelCopyWith<$Res> {
  __$$_NotificationModelCopyWithImpl(
      _$_NotificationModel _value, $Res Function(_$_NotificationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? content = null,
    Object? createAt = null,
    Object? title = null,
    Object? type = null,
    Object? isNew = null,
    Object? isRead = null,
  }) {
    return _then(_$_NotificationModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NotificationModel implements _NotificationModel {
  _$_NotificationModel(
      {required this.id,
      required this.userId,
      required this.content,
      required this.createAt,
      required this.title,
      required this.type,
      required this.isNew,
      required this.isRead});

  @override
  final String id;
  @override
  final String userId;
  @override
  final String content;
  @override
  final double createAt;
  @override
  final String title;
  @override
  final NotificationType type;
  @override
  final bool isNew;
  @override
  final bool isRead;

  @override
  String toString() {
    return 'NotificationModel(id: $id, userId: $userId, content: $content, createAt: $createAt, title: $title, type: $type, isNew: $isNew, isRead: $isRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isNew, isNew) || other.isNew == isNew) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, content, createAt, title, type, isNew, isRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationModelCopyWith<_$_NotificationModel> get copyWith =>
      __$$_NotificationModelCopyWithImpl<_$_NotificationModel>(
          this, _$identity);
}

abstract class _NotificationModel implements NotificationModel {
  factory _NotificationModel(
      {required final String id,
      required final String userId,
      required final String content,
      required final double createAt,
      required final String title,
      required final NotificationType type,
      required final bool isNew,
      required final bool isRead}) = _$_NotificationModel;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get content;
  @override
  double get createAt;
  @override
  String get title;
  @override
  NotificationType get type;
  @override
  bool get isNew;
  @override
  bool get isRead;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationModelCopyWith<_$_NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
