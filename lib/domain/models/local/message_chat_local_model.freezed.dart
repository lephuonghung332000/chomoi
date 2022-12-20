// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_chat_local_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageChatLocalModel {
  String get chatBoxId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get sendBy => throw _privateConstructorUsedError;
  File? get imageSend => throw _privateConstructorUsedError;
  String? get imageReceive => throw _privateConstructorUsedError;
  double get createAt => throw _privateConstructorUsedError;
  bool get ownMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageChatLocalModelCopyWith<MessageChatLocalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageChatLocalModelCopyWith<$Res> {
  factory $MessageChatLocalModelCopyWith(MessageChatLocalModel value,
          $Res Function(MessageChatLocalModel) then) =
      _$MessageChatLocalModelCopyWithImpl<$Res, MessageChatLocalModel>;
  @useResult
  $Res call(
      {String chatBoxId,
      String content,
      String sendBy,
      File? imageSend,
      String? imageReceive,
      double createAt,
      bool ownMessage});
}

/// @nodoc
class _$MessageChatLocalModelCopyWithImpl<$Res,
        $Val extends MessageChatLocalModel>
    implements $MessageChatLocalModelCopyWith<$Res> {
  _$MessageChatLocalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatBoxId = null,
    Object? content = null,
    Object? sendBy = null,
    Object? imageSend = freezed,
    Object? imageReceive = freezed,
    Object? createAt = null,
    Object? ownMessage = null,
  }) {
    return _then(_value.copyWith(
      chatBoxId: null == chatBoxId
          ? _value.chatBoxId
          : chatBoxId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      sendBy: null == sendBy
          ? _value.sendBy
          : sendBy // ignore: cast_nullable_to_non_nullable
              as String,
      imageSend: freezed == imageSend
          ? _value.imageSend
          : imageSend // ignore: cast_nullable_to_non_nullable
              as File?,
      imageReceive: freezed == imageReceive
          ? _value.imageReceive
          : imageReceive // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as double,
      ownMessage: null == ownMessage
          ? _value.ownMessage
          : ownMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageChatLocalModelCopyWith<$Res>
    implements $MessageChatLocalModelCopyWith<$Res> {
  factory _$$_MessageChatLocalModelCopyWith(_$_MessageChatLocalModel value,
          $Res Function(_$_MessageChatLocalModel) then) =
      __$$_MessageChatLocalModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatBoxId,
      String content,
      String sendBy,
      File? imageSend,
      String? imageReceive,
      double createAt,
      bool ownMessage});
}

/// @nodoc
class __$$_MessageChatLocalModelCopyWithImpl<$Res>
    extends _$MessageChatLocalModelCopyWithImpl<$Res, _$_MessageChatLocalModel>
    implements _$$_MessageChatLocalModelCopyWith<$Res> {
  __$$_MessageChatLocalModelCopyWithImpl(_$_MessageChatLocalModel _value,
      $Res Function(_$_MessageChatLocalModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatBoxId = null,
    Object? content = null,
    Object? sendBy = null,
    Object? imageSend = freezed,
    Object? imageReceive = freezed,
    Object? createAt = null,
    Object? ownMessage = null,
  }) {
    return _then(_$_MessageChatLocalModel(
      chatBoxId: null == chatBoxId
          ? _value.chatBoxId
          : chatBoxId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      sendBy: null == sendBy
          ? _value.sendBy
          : sendBy // ignore: cast_nullable_to_non_nullable
              as String,
      imageSend: freezed == imageSend
          ? _value.imageSend
          : imageSend // ignore: cast_nullable_to_non_nullable
              as File?,
      imageReceive: freezed == imageReceive
          ? _value.imageReceive
          : imageReceive // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as double,
      ownMessage: null == ownMessage
          ? _value.ownMessage
          : ownMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MessageChatLocalModel implements _MessageChatLocalModel {
  _$_MessageChatLocalModel(
      {required this.chatBoxId,
      required this.content,
      required this.sendBy,
      this.imageSend,
      this.imageReceive,
      required this.createAt,
      required this.ownMessage});

  @override
  final String chatBoxId;
  @override
  final String content;
  @override
  final String sendBy;
  @override
  final File? imageSend;
  @override
  final String? imageReceive;
  @override
  final double createAt;
  @override
  final bool ownMessage;

  @override
  String toString() {
    return 'MessageChatLocalModel(chatBoxId: $chatBoxId, content: $content, sendBy: $sendBy, imageSend: $imageSend, imageReceive: $imageReceive, createAt: $createAt, ownMessage: $ownMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageChatLocalModel &&
            (identical(other.chatBoxId, chatBoxId) ||
                other.chatBoxId == chatBoxId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.sendBy, sendBy) || other.sendBy == sendBy) &&
            (identical(other.imageSend, imageSend) ||
                other.imageSend == imageSend) &&
            (identical(other.imageReceive, imageReceive) ||
                other.imageReceive == imageReceive) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.ownMessage, ownMessage) ||
                other.ownMessage == ownMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatBoxId, content, sendBy,
      imageSend, imageReceive, createAt, ownMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageChatLocalModelCopyWith<_$_MessageChatLocalModel> get copyWith =>
      __$$_MessageChatLocalModelCopyWithImpl<_$_MessageChatLocalModel>(
          this, _$identity);
}

abstract class _MessageChatLocalModel implements MessageChatLocalModel {
  factory _MessageChatLocalModel(
      {required final String chatBoxId,
      required final String content,
      required final String sendBy,
      final File? imageSend,
      final String? imageReceive,
      required final double createAt,
      required final bool ownMessage}) = _$_MessageChatLocalModel;

  @override
  String get chatBoxId;
  @override
  String get content;
  @override
  String get sendBy;
  @override
  File? get imageSend;
  @override
  String? get imageReceive;
  @override
  double get createAt;
  @override
  bool get ownMessage;
  @override
  @JsonKey(ignore: true)
  _$$_MessageChatLocalModelCopyWith<_$_MessageChatLocalModel> get copyWith =>
      throw _privateConstructorUsedError;
}
