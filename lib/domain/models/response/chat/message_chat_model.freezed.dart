// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageChatModel {
  String get id => throw _privateConstructorUsedError;
  String get chatBoxId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get sendBy => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  double get createAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageChatModelCopyWith<MessageChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageChatModelCopyWith<$Res> {
  factory $MessageChatModelCopyWith(
          MessageChatModel value, $Res Function(MessageChatModel) then) =
      _$MessageChatModelCopyWithImpl<$Res, MessageChatModel>;
  @useResult
  $Res call(
      {String id,
      String chatBoxId,
      String content,
      String sendBy,
      String image,
      double createAt});
}

/// @nodoc
class _$MessageChatModelCopyWithImpl<$Res, $Val extends MessageChatModel>
    implements $MessageChatModelCopyWith<$Res> {
  _$MessageChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chatBoxId = null,
    Object? content = null,
    Object? sendBy = null,
    Object? image = null,
    Object? createAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageChatModelCopyWith<$Res>
    implements $MessageChatModelCopyWith<$Res> {
  factory _$$_MessageChatModelCopyWith(
          _$_MessageChatModel value, $Res Function(_$_MessageChatModel) then) =
      __$$_MessageChatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String chatBoxId,
      String content,
      String sendBy,
      String image,
      double createAt});
}

/// @nodoc
class __$$_MessageChatModelCopyWithImpl<$Res>
    extends _$MessageChatModelCopyWithImpl<$Res, _$_MessageChatModel>
    implements _$$_MessageChatModelCopyWith<$Res> {
  __$$_MessageChatModelCopyWithImpl(
      _$_MessageChatModel _value, $Res Function(_$_MessageChatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chatBoxId = null,
    Object? content = null,
    Object? sendBy = null,
    Object? image = null,
    Object? createAt = null,
  }) {
    return _then(_$_MessageChatModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_MessageChatModel implements _MessageChatModel {
  _$_MessageChatModel(
      {required this.id,
      required this.chatBoxId,
      required this.content,
      required this.sendBy,
      required this.image,
      required this.createAt});

  @override
  final String id;
  @override
  final String chatBoxId;
  @override
  final String content;
  @override
  final String sendBy;
  @override
  final String image;
  @override
  final double createAt;

  @override
  String toString() {
    return 'MessageChatModel(id: $id, chatBoxId: $chatBoxId, content: $content, sendBy: $sendBy, image: $image, createAt: $createAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageChatModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chatBoxId, chatBoxId) ||
                other.chatBoxId == chatBoxId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.sendBy, sendBy) || other.sendBy == sendBy) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, chatBoxId, content, sendBy, image, createAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageChatModelCopyWith<_$_MessageChatModel> get copyWith =>
      __$$_MessageChatModelCopyWithImpl<_$_MessageChatModel>(this, _$identity);
}

abstract class _MessageChatModel implements MessageChatModel {
  factory _MessageChatModel(
      {required final String id,
      required final String chatBoxId,
      required final String content,
      required final String sendBy,
      required final String image,
      required final double createAt}) = _$_MessageChatModel;

  @override
  String get id;
  @override
  String get chatBoxId;
  @override
  String get content;
  @override
  String get sendBy;
  @override
  String get image;
  @override
  double get createAt;
  @override
  @JsonKey(ignore: true)
  _$$_MessageChatModelCopyWith<_$_MessageChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
