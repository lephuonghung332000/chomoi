// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_chat_paging_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageChatPagingModel {
  int get total => throw _privateConstructorUsedError;
  List<MessageChatModel> get chats => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageChatPagingModelCopyWith<MessageChatPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageChatPagingModelCopyWith<$Res> {
  factory $MessageChatPagingModelCopyWith(MessageChatPagingModel value,
          $Res Function(MessageChatPagingModel) then) =
      _$MessageChatPagingModelCopyWithImpl<$Res, MessageChatPagingModel>;
  @useResult
  $Res call({int total, List<MessageChatModel> chats});
}

/// @nodoc
class _$MessageChatPagingModelCopyWithImpl<$Res,
        $Val extends MessageChatPagingModel>
    implements $MessageChatPagingModelCopyWith<$Res> {
  _$MessageChatPagingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? chats = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<MessageChatModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageChatPagingModelCopyWith<$Res>
    implements $MessageChatPagingModelCopyWith<$Res> {
  factory _$$_MessageChatPagingModelCopyWith(_$_MessageChatPagingModel value,
          $Res Function(_$_MessageChatPagingModel) then) =
      __$$_MessageChatPagingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<MessageChatModel> chats});
}

/// @nodoc
class __$$_MessageChatPagingModelCopyWithImpl<$Res>
    extends _$MessageChatPagingModelCopyWithImpl<$Res,
        _$_MessageChatPagingModel>
    implements _$$_MessageChatPagingModelCopyWith<$Res> {
  __$$_MessageChatPagingModelCopyWithImpl(_$_MessageChatPagingModel _value,
      $Res Function(_$_MessageChatPagingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? chats = null,
  }) {
    return _then(_$_MessageChatPagingModel(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<MessageChatModel>,
    ));
  }
}

/// @nodoc

class _$_MessageChatPagingModel implements _MessageChatPagingModel {
  _$_MessageChatPagingModel(
      {required this.total, required final List<MessageChatModel> chats})
      : _chats = chats;

  @override
  final int total;
  final List<MessageChatModel> _chats;
  @override
  List<MessageChatModel> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  String toString() {
    return 'MessageChatPagingModel(total: $total, chats: $chats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageChatPagingModel &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_chats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageChatPagingModelCopyWith<_$_MessageChatPagingModel> get copyWith =>
      __$$_MessageChatPagingModelCopyWithImpl<_$_MessageChatPagingModel>(
          this, _$identity);
}

abstract class _MessageChatPagingModel implements MessageChatPagingModel {
  factory _MessageChatPagingModel(
      {required final int total,
      required final List<MessageChatModel> chats}) = _$_MessageChatPagingModel;

  @override
  int get total;
  @override
  List<MessageChatModel> get chats;
  @override
  @JsonKey(ignore: true)
  _$$_MessageChatPagingModelCopyWith<_$_MessageChatPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
