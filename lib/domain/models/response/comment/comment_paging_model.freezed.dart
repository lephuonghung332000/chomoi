// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_paging_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$CommentPagingModelCopyWithImpl<$Res, CommentPagingModel>;
  @useResult
  $Res call({int total, List<CommentModel> comments});
}

/// @nodoc
class _$CommentPagingModelCopyWithImpl<$Res, $Val extends CommentPagingModel>
    implements $CommentPagingModelCopyWith<$Res> {
  _$CommentPagingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? comments = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentPagingModelCopyWith<$Res>
    implements $CommentPagingModelCopyWith<$Res> {
  factory _$$_CommentPagingModelCopyWith(_$_CommentPagingModel value,
          $Res Function(_$_CommentPagingModel) then) =
      __$$_CommentPagingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<CommentModel> comments});
}

/// @nodoc
class __$$_CommentPagingModelCopyWithImpl<$Res>
    extends _$CommentPagingModelCopyWithImpl<$Res, _$_CommentPagingModel>
    implements _$$_CommentPagingModelCopyWith<$Res> {
  __$$_CommentPagingModelCopyWithImpl(
      _$_CommentPagingModel _value, $Res Function(_$_CommentPagingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? comments = null,
  }) {
    return _then(_$_CommentPagingModel(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
    ));
  }
}

/// @nodoc

class _$_CommentPagingModel implements _CommentPagingModel {
  _$_CommentPagingModel(
      {required this.total, required final List<CommentModel> comments})
      : _comments = comments;

  @override
  final int total;
  final List<CommentModel> _comments;
  @override
  List<CommentModel> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'CommentPagingModel(total: $total, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentPagingModel &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentPagingModelCopyWith<_$_CommentPagingModel> get copyWith =>
      __$$_CommentPagingModelCopyWithImpl<_$_CommentPagingModel>(
          this, _$identity);
}

abstract class _CommentPagingModel implements CommentPagingModel {
  factory _CommentPagingModel(
      {required final int total,
      required final List<CommentModel> comments}) = _$_CommentPagingModel;

  @override
  int get total;
  @override
  List<CommentModel> get comments;
  @override
  @JsonKey(ignore: true)
  _$$_CommentPagingModelCopyWith<_$_CommentPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
