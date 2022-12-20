// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatRequestModel {
  String get idReceiver => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get idSender => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatRequestModelCopyWith<ChatRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRequestModelCopyWith<$Res> {
  factory $ChatRequestModelCopyWith(
          ChatRequestModel value, $Res Function(ChatRequestModel) then) =
      _$ChatRequestModelCopyWithImpl<$Res, ChatRequestModel>;
  @useResult
  $Res call({String idReceiver, String postId, String idSender});
}

/// @nodoc
class _$ChatRequestModelCopyWithImpl<$Res, $Val extends ChatRequestModel>
    implements $ChatRequestModelCopyWith<$Res> {
  _$ChatRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idReceiver = null,
    Object? postId = null,
    Object? idSender = null,
  }) {
    return _then(_value.copyWith(
      idReceiver: null == idReceiver
          ? _value.idReceiver
          : idReceiver // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      idSender: null == idSender
          ? _value.idSender
          : idSender // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatRequestModelCopyWith<$Res>
    implements $ChatRequestModelCopyWith<$Res> {
  factory _$$_ChatRequestModelCopyWith(
          _$_ChatRequestModel value, $Res Function(_$_ChatRequestModel) then) =
      __$$_ChatRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idReceiver, String postId, String idSender});
}

/// @nodoc
class __$$_ChatRequestModelCopyWithImpl<$Res>
    extends _$ChatRequestModelCopyWithImpl<$Res, _$_ChatRequestModel>
    implements _$$_ChatRequestModelCopyWith<$Res> {
  __$$_ChatRequestModelCopyWithImpl(
      _$_ChatRequestModel _value, $Res Function(_$_ChatRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idReceiver = null,
    Object? postId = null,
    Object? idSender = null,
  }) {
    return _then(_$_ChatRequestModel(
      idReceiver: null == idReceiver
          ? _value.idReceiver
          : idReceiver // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      idSender: null == idSender
          ? _value.idSender
          : idSender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChatRequestModel implements _ChatRequestModel {
  _$_ChatRequestModel(
      {required this.idReceiver, required this.postId, required this.idSender});

  @override
  final String idReceiver;
  @override
  final String postId;
  @override
  final String idSender;

  @override
  String toString() {
    return 'ChatRequestModel(idReceiver: $idReceiver, postId: $postId, idSender: $idSender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRequestModel &&
            (identical(other.idReceiver, idReceiver) ||
                other.idReceiver == idReceiver) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.idSender, idSender) ||
                other.idSender == idSender));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idReceiver, postId, idSender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRequestModelCopyWith<_$_ChatRequestModel> get copyWith =>
      __$$_ChatRequestModelCopyWithImpl<_$_ChatRequestModel>(this, _$identity);
}

abstract class _ChatRequestModel implements ChatRequestModel {
  factory _ChatRequestModel(
      {required final String idReceiver,
      required final String postId,
      required final String idSender}) = _$_ChatRequestModel;

  @override
  String get idReceiver;
  @override
  String get postId;
  @override
  String get idSender;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRequestModelCopyWith<_$_ChatRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
