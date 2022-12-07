// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unread_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UnreadNotificationModel {
  int get total => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnreadNotificationModelCopyWith<UnreadNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnreadNotificationModelCopyWith<$Res> {
  factory $UnreadNotificationModelCopyWith(UnreadNotificationModel value,
          $Res Function(UnreadNotificationModel) then) =
      _$UnreadNotificationModelCopyWithImpl<$Res, UnreadNotificationModel>;
  @useResult
  $Res call({int total});
}

/// @nodoc
class _$UnreadNotificationModelCopyWithImpl<$Res,
        $Val extends UnreadNotificationModel>
    implements $UnreadNotificationModelCopyWith<$Res> {
  _$UnreadNotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnreadNotificationModelCopyWith<$Res>
    implements $UnreadNotificationModelCopyWith<$Res> {
  factory _$$_UnreadNotificationModelCopyWith(_$_UnreadNotificationModel value,
          $Res Function(_$_UnreadNotificationModel) then) =
      __$$_UnreadNotificationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total});
}

/// @nodoc
class __$$_UnreadNotificationModelCopyWithImpl<$Res>
    extends _$UnreadNotificationModelCopyWithImpl<$Res,
        _$_UnreadNotificationModel>
    implements _$$_UnreadNotificationModelCopyWith<$Res> {
  __$$_UnreadNotificationModelCopyWithImpl(_$_UnreadNotificationModel _value,
      $Res Function(_$_UnreadNotificationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_$_UnreadNotificationModel(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UnreadNotificationModel implements _UnreadNotificationModel {
  _$_UnreadNotificationModel({required this.total});

  @override
  final int total;

  @override
  String toString() {
    return 'UnreadNotificationModel(total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnreadNotificationModel &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnreadNotificationModelCopyWith<_$_UnreadNotificationModel>
      get copyWith =>
          __$$_UnreadNotificationModelCopyWithImpl<_$_UnreadNotificationModel>(
              this, _$identity);
}

abstract class _UnreadNotificationModel implements UnreadNotificationModel {
  factory _UnreadNotificationModel({required final int total}) =
      _$_UnreadNotificationModel;

  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$_UnreadNotificationModelCopyWith<_$_UnreadNotificationModel>
      get copyWith => throw _privateConstructorUsedError;
}
