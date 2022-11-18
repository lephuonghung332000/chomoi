// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_paging_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CommentPagingModelTearOff {
  const _$CommentPagingModelTearOff();

  _CommentPagingModel call(
      {required int total, required List<CommentModel> comments}) {
    return _CommentPagingModel(
      total: total,
      comments: comments,
    );
  }
}

/// @nodoc
const $CommentPagingModel = _$CommentPagingModelTearOff();

/// @nodoc
mixin _$CommentPagingModel {
  int get total => throw _privateConstructorUsedError;
  List<CommentModel> get comments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentPagingModelCopyWith<CommentPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentPagingModelCopyWith<$Res> {
  factory $CommentPagingModelCopyWith(
          CommentPagingModel value, $Res Function(CommentPagingModel) then) =
      _$CommentPagingModelCopyWithImpl<$Res>;
  $Res call({int total, List<CommentModel> comments});
}

/// @nodoc
class _$CommentPagingModelCopyWithImpl<$Res>
    implements $CommentPagingModelCopyWith<$Res> {
  _$CommentPagingModelCopyWithImpl(this._value, this._then);

  final CommentPagingModel _value;
  // ignore: unused_field
  final $Res Function(CommentPagingModel) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
    ));
  }
}

/// @nodoc
abstract class _$CommentPagingModelCopyWith<$Res>
    implements $CommentPagingModelCopyWith<$Res> {
  factory _$CommentPagingModelCopyWith(
          _CommentPagingModel value, $Res Function(_CommentPagingModel) then) =
      __$CommentPagingModelCopyWithImpl<$Res>;
  @override
  $Res call({int total, List<CommentModel> comments});
}

/// @nodoc
class __$CommentPagingModelCopyWithImpl<$Res>
    extends _$CommentPagingModelCopyWithImpl<$Res>
    implements _$CommentPagingModelCopyWith<$Res> {
  __$CommentPagingModelCopyWithImpl(
      _CommentPagingModel _value, $Res Function(_CommentPagingModel) _then)
      : super(_value, (v) => _then(v as _CommentPagingModel));

  @override
  _CommentPagingModel get _value => super._value as _CommentPagingModel;

  @override
  $Res call({
    Object? total = freezed,
    Object? comments = freezed,
  }) {
    return _then(_CommentPagingModel(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
    ));
  }
}

/// @nodoc

class _$_CommentPagingModel implements _CommentPagingModel {
  _$_CommentPagingModel({required this.total, required this.comments});

  @override
  final int total;
  @override
  final List<CommentModel> comments;

  @override
  String toString() {
    return 'CommentPagingModel(total: $total, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentPagingModel &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.comments, comments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(comments));

  @JsonKey(ignore: true)
  @override
  _$CommentPagingModelCopyWith<_CommentPagingModel> get copyWith =>
      __$CommentPagingModelCopyWithImpl<_CommentPagingModel>(this, _$identity);
}

abstract class _CommentPagingModel implements CommentPagingModel {
  factory _CommentPagingModel(
      {required int total,
      required List<CommentModel> comments}) = _$_CommentPagingModel;

  @override
  int get total;
  @override
  List<CommentModel> get comments;
  @override
  @JsonKey(ignore: true)
  _$CommentPagingModelCopyWith<_CommentPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
