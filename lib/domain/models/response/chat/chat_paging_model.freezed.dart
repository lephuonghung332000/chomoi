// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_paging_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatPagingModel {
  int get total => throw _privateConstructorUsedError;
  List<ChatModel> get chats => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatPagingModelCopyWith<ChatPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatPagingModelCopyWith<$Res> {
  factory $ChatPagingModelCopyWith(
          ChatPagingModel value, $Res Function(ChatPagingModel) then) =
      _$ChatPagingModelCopyWithImpl<$Res, ChatPagingModel>;
  @useResult
  $Res call({int total, List<ChatModel> chats});
}

/// @nodoc
class _$ChatPagingModelCopyWithImpl<$Res, $Val extends ChatPagingModel>
    implements $ChatPagingModelCopyWith<$Res> {
  _$ChatPagingModelCopyWithImpl(this._value, this._then);

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
              as List<ChatModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatPagingModelCopyWith<$Res>
    implements $ChatPagingModelCopyWith<$Res> {
  factory _$$_ChatPagingModelCopyWith(
          _$_ChatPagingModel value, $Res Function(_$_ChatPagingModel) then) =
      __$$_ChatPagingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<ChatModel> chats});
}

/// @nodoc
class __$$_ChatPagingModelCopyWithImpl<$Res>
    extends _$ChatPagingModelCopyWithImpl<$Res, _$_ChatPagingModel>
    implements _$$_ChatPagingModelCopyWith<$Res> {
  __$$_ChatPagingModelCopyWithImpl(
      _$_ChatPagingModel _value, $Res Function(_$_ChatPagingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? chats = null,
  }) {
    return _then(_$_ChatPagingModel(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
    ));
  }
}

/// @nodoc

class _$_ChatPagingModel implements _ChatPagingModel {
  _$_ChatPagingModel(
      {required this.total, required final List<ChatModel> chats})
      : _chats = chats;

  @override
  final int total;
  final List<ChatModel> _chats;
  @override
  List<ChatModel> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  String toString() {
    return 'ChatPagingModel(total: $total, chats: $chats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatPagingModel &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_chats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatPagingModelCopyWith<_$_ChatPagingModel> get copyWith =>
      __$$_ChatPagingModelCopyWithImpl<_$_ChatPagingModel>(this, _$identity);
}

abstract class _ChatPagingModel implements ChatPagingModel {
  factory _ChatPagingModel(
      {required final int total,
      required final List<ChatModel> chats}) = _$_ChatPagingModel;

  @override
  int get total;
  @override
  List<ChatModel> get chats;
  @override
  @JsonKey(ignore: true)
  _$$_ChatPagingModelCopyWith<_$_ChatPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
