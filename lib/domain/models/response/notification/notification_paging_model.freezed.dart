// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_paging_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationPagingModel {
  int get total => throw _privateConstructorUsedError;
  List<NotificationModel> get notifications =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationPagingModelCopyWith<NotificationPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPagingModelCopyWith<$Res> {
  factory $NotificationPagingModelCopyWith(NotificationPagingModel value,
          $Res Function(NotificationPagingModel) then) =
      _$NotificationPagingModelCopyWithImpl<$Res, NotificationPagingModel>;
  @useResult
  $Res call({int total, List<NotificationModel> notifications});
}

/// @nodoc
class _$NotificationPagingModelCopyWithImpl<$Res,
        $Val extends NotificationPagingModel>
    implements $NotificationPagingModelCopyWith<$Res> {
  _$NotificationPagingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? notifications = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationPagingModelCopyWith<$Res>
    implements $NotificationPagingModelCopyWith<$Res> {
  factory _$$_NotificationPagingModelCopyWith(_$_NotificationPagingModel value,
          $Res Function(_$_NotificationPagingModel) then) =
      __$$_NotificationPagingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<NotificationModel> notifications});
}

/// @nodoc
class __$$_NotificationPagingModelCopyWithImpl<$Res>
    extends _$NotificationPagingModelCopyWithImpl<$Res,
        _$_NotificationPagingModel>
    implements _$$_NotificationPagingModelCopyWith<$Res> {
  __$$_NotificationPagingModelCopyWithImpl(_$_NotificationPagingModel _value,
      $Res Function(_$_NotificationPagingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? notifications = null,
  }) {
    return _then(_$_NotificationPagingModel(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ));
  }
}

/// @nodoc

class _$_NotificationPagingModel implements _NotificationPagingModel {
  _$_NotificationPagingModel(
      {required this.total,
      required final List<NotificationModel> notifications})
      : _notifications = notifications;

  @override
  final int total;
  final List<NotificationModel> _notifications;
  @override
  List<NotificationModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationPagingModel(total: $total, notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationPagingModel &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationPagingModelCopyWith<_$_NotificationPagingModel>
      get copyWith =>
          __$$_NotificationPagingModelCopyWithImpl<_$_NotificationPagingModel>(
              this, _$identity);
}

abstract class _NotificationPagingModel implements NotificationPagingModel {
  factory _NotificationPagingModel(
          {required final int total,
          required final List<NotificationModel> notifications}) =
      _$_NotificationPagingModel;

  @override
  int get total;
  @override
  List<NotificationModel> get notifications;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationPagingModelCopyWith<_$_NotificationPagingModel>
      get copyWith => throw _privateConstructorUsedError;
}
