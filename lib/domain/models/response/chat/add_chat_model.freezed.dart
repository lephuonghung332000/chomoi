// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddChatModel {
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddChatModelCopyWith<AddChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddChatModelCopyWith<$Res> {
  factory $AddChatModelCopyWith(
          AddChatModel value, $Res Function(AddChatModel) then) =
      _$AddChatModelCopyWithImpl<$Res, AddChatModel>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$AddChatModelCopyWithImpl<$Res, $Val extends AddChatModel>
    implements $AddChatModelCopyWith<$Res> {
  _$AddChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddChatModelCopyWith<$Res>
    implements $AddChatModelCopyWith<$Res> {
  factory _$$_AddChatModelCopyWith(
          _$_AddChatModel value, $Res Function(_$_AddChatModel) then) =
      __$$_AddChatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_AddChatModelCopyWithImpl<$Res>
    extends _$AddChatModelCopyWithImpl<$Res, _$_AddChatModel>
    implements _$$_AddChatModelCopyWith<$Res> {
  __$$_AddChatModelCopyWithImpl(
      _$_AddChatModel _value, $Res Function(_$_AddChatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_AddChatModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddChatModel implements _AddChatModel {
  _$_AddChatModel({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'AddChatModel(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddChatModel &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddChatModelCopyWith<_$_AddChatModel> get copyWith =>
      __$$_AddChatModelCopyWithImpl<_$_AddChatModel>(this, _$identity);
}

abstract class _AddChatModel implements AddChatModel {
  factory _AddChatModel({required final String id}) = _$_AddChatModel;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_AddChatModelCopyWith<_$_AddChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
