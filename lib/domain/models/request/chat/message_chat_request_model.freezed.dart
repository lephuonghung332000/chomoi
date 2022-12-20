// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_chat_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageChatRequestModel {
  String get chatBoxId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get sendBy => throw _privateConstructorUsedError;
  MultipartFile? get file => throw _privateConstructorUsedError;
  bool get ownMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageChatRequestModelCopyWith<MessageChatRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageChatRequestModelCopyWith<$Res> {
  factory $MessageChatRequestModelCopyWith(MessageChatRequestModel value,
          $Res Function(MessageChatRequestModel) then) =
      _$MessageChatRequestModelCopyWithImpl<$Res, MessageChatRequestModel>;
  @useResult
  $Res call(
      {String chatBoxId,
      String content,
      String sendBy,
      MultipartFile? file,
      bool ownMessage});
}

/// @nodoc
class _$MessageChatRequestModelCopyWithImpl<$Res,
        $Val extends MessageChatRequestModel>
    implements $MessageChatRequestModelCopyWith<$Res> {
  _$MessageChatRequestModelCopyWithImpl(this._value, this._then);

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
    Object? file = freezed,
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
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as MultipartFile?,
      ownMessage: null == ownMessage
          ? _value.ownMessage
          : ownMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageChatRequestModelCopyWith<$Res>
    implements $MessageChatRequestModelCopyWith<$Res> {
  factory _$$_MessageChatRequestModelCopyWith(_$_MessageChatRequestModel value,
          $Res Function(_$_MessageChatRequestModel) then) =
      __$$_MessageChatRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatBoxId,
      String content,
      String sendBy,
      MultipartFile? file,
      bool ownMessage});
}

/// @nodoc
class __$$_MessageChatRequestModelCopyWithImpl<$Res>
    extends _$MessageChatRequestModelCopyWithImpl<$Res,
        _$_MessageChatRequestModel>
    implements _$$_MessageChatRequestModelCopyWith<$Res> {
  __$$_MessageChatRequestModelCopyWithImpl(_$_MessageChatRequestModel _value,
      $Res Function(_$_MessageChatRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatBoxId = null,
    Object? content = null,
    Object? sendBy = null,
    Object? file = freezed,
    Object? ownMessage = null,
  }) {
    return _then(_$_MessageChatRequestModel(
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
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as MultipartFile?,
      ownMessage: null == ownMessage
          ? _value.ownMessage
          : ownMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MessageChatRequestModel implements _MessageChatRequestModel {
  _$_MessageChatRequestModel(
      {required this.chatBoxId,
      required this.content,
      required this.sendBy,
      this.file,
      required this.ownMessage});

  @override
  final String chatBoxId;
  @override
  final String content;
  @override
  final String sendBy;
  @override
  final MultipartFile? file;
  @override
  final bool ownMessage;

  @override
  String toString() {
    return 'MessageChatRequestModel(chatBoxId: $chatBoxId, content: $content, sendBy: $sendBy, file: $file, ownMessage: $ownMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageChatRequestModel &&
            (identical(other.chatBoxId, chatBoxId) ||
                other.chatBoxId == chatBoxId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.sendBy, sendBy) || other.sendBy == sendBy) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.ownMessage, ownMessage) ||
                other.ownMessage == ownMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, chatBoxId, content, sendBy, file, ownMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageChatRequestModelCopyWith<_$_MessageChatRequestModel>
      get copyWith =>
          __$$_MessageChatRequestModelCopyWithImpl<_$_MessageChatRequestModel>(
              this, _$identity);
}

abstract class _MessageChatRequestModel implements MessageChatRequestModel {
  factory _MessageChatRequestModel(
      {required final String chatBoxId,
      required final String content,
      required final String sendBy,
      final MultipartFile? file,
      required final bool ownMessage}) = _$_MessageChatRequestModel;

  @override
  String get chatBoxId;
  @override
  String get content;
  @override
  String get sendBy;
  @override
  MultipartFile? get file;
  @override
  bool get ownMessage;
  @override
  @JsonKey(ignore: true)
  _$$_MessageChatRequestModelCopyWith<_$_MessageChatRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
