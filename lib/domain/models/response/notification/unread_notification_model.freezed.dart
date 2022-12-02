// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unread_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UnreadNotificationModelTearOff {
  const _$UnreadNotificationModelTearOff();

  _UnreadNotificationModel call({required int total}) {
    return _UnreadNotificationModel(
      total: total,
    );
  }
}

/// @nodoc
const $UnreadNotificationModel = _$UnreadNotificationModelTearOff();

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
      _$UnreadNotificationModelCopyWithImpl<$Res>;
  $Res call({int total});
}

/// @nodoc
class _$UnreadNotificationModelCopyWithImpl<$Res>
    implements $UnreadNotificationModelCopyWith<$Res> {
  _$UnreadNotificationModelCopyWithImpl(this._value, this._then);

  final UnreadNotificationModel _value;
  // ignore: unused_field
  final $Res Function(UnreadNotificationModel) _then;

  @override
  $Res call({
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UnreadNotificationModelCopyWith<$Res>
    implements $UnreadNotificationModelCopyWith<$Res> {
  factory _$UnreadNotificationModelCopyWith(_UnreadNotificationModel value,
          $Res Function(_UnreadNotificationModel) then) =
      __$UnreadNotificationModelCopyWithImpl<$Res>;
  @override
  $Res call({int total});
}

/// @nodoc
class __$UnreadNotificationModelCopyWithImpl<$Res>
    extends _$UnreadNotificationModelCopyWithImpl<$Res>
    implements _$UnreadNotificationModelCopyWith<$Res> {
  __$UnreadNotificationModelCopyWithImpl(_UnreadNotificationModel _value,
      $Res Function(_UnreadNotificationModel) _then)
      : super(_value, (v) => _then(v as _UnreadNotificationModel));

  @override
  _UnreadNotificationModel get _value =>
      super._value as _UnreadNotificationModel;

  @override
  $Res call({
    Object? total = freezed,
  }) {
    return _then(_UnreadNotificationModel(
      total: total == freezed
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
            other is _UnreadNotificationModel &&
            const DeepCollectionEquality().equals(other.total, total));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(total));

  @JsonKey(ignore: true)
  @override
  _$UnreadNotificationModelCopyWith<_UnreadNotificationModel> get copyWith =>
      __$UnreadNotificationModelCopyWithImpl<_UnreadNotificationModel>(
          this, _$identity);
}

abstract class _UnreadNotificationModel implements UnreadNotificationModel {
  factory _UnreadNotificationModel({required int total}) =
      _$_UnreadNotificationModel;

  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$UnreadNotificationModelCopyWith<_UnreadNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
