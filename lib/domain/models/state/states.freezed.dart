// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatesTearOff {
  const _$StatesTearOff();

  _initState<T> init<T>({required T entity}) {
    return _initState<T>(
      entity: entity,
    );
  }

  _loadingState<T> loading<T>() {
    return _loadingState<T>();
  }

  _failureState<T> failure<T>(DioError exception) {
    return _failureState<T>(
      exception,
    );
  }

  _successState<T> success<T>({required T entity}) {
    return _successState<T>(
      entity: entity,
    );
  }
}

/// @nodoc
const $States = _$StatesTearOff();

/// @nodoc
mixin _$States<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T entity) init,
    required TResult Function() loading,
    required TResult Function(DioError exception) failure,
    required TResult Function(T entity) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T entity)? init,
    TResult Function()? loading,
    TResult Function(DioError exception)? failure,
    TResult Function(T entity)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T entity)? init,
    TResult Function()? loading,
    TResult Function(DioError exception)? failure,
    TResult Function(T entity)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initState<T> value) init,
    required TResult Function(_loadingState<T> value) loading,
    required TResult Function(_failureState<T> value) failure,
    required TResult Function(_successState<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_initState<T> value)? init,
    TResult Function(_loadingState<T> value)? loading,
    TResult Function(_failureState<T> value)? failure,
    TResult Function(_successState<T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initState<T> value)? init,
    TResult Function(_loadingState<T> value)? loading,
    TResult Function(_failureState<T> value)? failure,
    TResult Function(_successState<T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatesCopyWith<T, $Res> {
  factory $StatesCopyWith(States<T> value, $Res Function(States<T>) then) =
      _$StatesCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$StatesCopyWithImpl<T, $Res> implements $StatesCopyWith<T, $Res> {
  _$StatesCopyWithImpl(this._value, this._then);

  final States<T> _value;
  // ignore: unused_field
  final $Res Function(States<T>) _then;
}

/// @nodoc
abstract class _$initStateCopyWith<T, $Res> {
  factory _$initStateCopyWith(
          _initState<T> value, $Res Function(_initState<T>) then) =
      __$initStateCopyWithImpl<T, $Res>;
  $Res call({T entity});
}

/// @nodoc
class __$initStateCopyWithImpl<T, $Res> extends _$StatesCopyWithImpl<T, $Res>
    implements _$initStateCopyWith<T, $Res> {
  __$initStateCopyWithImpl(
      _initState<T> _value, $Res Function(_initState<T>) _then)
      : super(_value, (v) => _then(v as _initState<T>));

  @override
  _initState<T> get _value => super._value as _initState<T>;

  @override
  $Res call({
    Object? entity = freezed,
  }) {
    return _then(_initState<T>(
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_initState<T> implements _initState<T> {
  const _$_initState({required this.entity});

  @override
  final T entity;

  @override
  String toString() {
    return 'States<$T>.init(entity: $entity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _initState<T> &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entity));

  @JsonKey(ignore: true)
  @override
  _$initStateCopyWith<T, _initState<T>> get copyWith =>
      __$initStateCopyWithImpl<T, _initState<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T entity) init,
    required TResult Function() loading,
    required TResult Function(DioError exception) failure,
    required TResult Function(T entity) success,
  }) {
    return init(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T entity)? init,
    TResult Function()? loading,
    TResult Function(DioError exception)? failure,
    TResult Function(T entity)? success,
  }) {
    return init?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T entity)? init,
    TResult Function()? loading,
    TResult Function(DioError exception)? failure,
    TResult Function(T entity)? success,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initState<T> value) init,
    required TResult Function(_loadingState<T> value) loading,
    required TResult Function(_failureState<T> value) failure,
    required TResult Function(_successState<T> value) success,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_initState<T> value)? init,
    TResult Function(_loadingState<T> value)? loading,
    TResult Function(_failureState<T> value)? failure,
    TResult Function(_successState<T> value)? success,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initState<T> value)? init,
    TResult Function(_loadingState<T> value)? loading,
    TResult Function(_failureState<T> value)? failure,
    TResult Function(_successState<T> value)? success,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _initState<T> implements States<T> {
  const factory _initState({required T entity}) = _$_initState<T>;

  T get entity;
  @JsonKey(ignore: true)
  _$initStateCopyWith<T, _initState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$loadingStateCopyWith<T, $Res> {
  factory _$loadingStateCopyWith(
          _loadingState<T> value, $Res Function(_loadingState<T>) then) =
      __$loadingStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$loadingStateCopyWithImpl<T, $Res> extends _$StatesCopyWithImpl<T, $Res>
    implements _$loadingStateCopyWith<T, $Res> {
  __$loadingStateCopyWithImpl(
      _loadingState<T> _value, $Res Function(_loadingState<T>) _then)
      : super(_value, (v) => _then(v as _loadingState<T>));

  @override
  _loadingState<T> get _value => super._value as _loadingState<T>;
}

/// @nodoc

class _$_loadingState<T> implements _loadingState<T> {
  const _$_loadingState();

  @override
  String toString() {
    return 'States<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _loadingState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T entity) init,
    required TResult Function() loading,
    required TResult Function(DioError exception) failure,
    required TResult Function(T entity) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T entity)? init,
    TResult Function()? loading,
    TResult Function(DioError exception)? failure,
    TResult Function(T entity)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T entity)? init,
    TResult Function()? loading,
    TResult Function(DioError exception)? failure,
    TResult Function(T entity)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initState<T> value) init,
    required TResult Function(_loadingState<T> value) loading,
    required TResult Function(_failureState<T> value) failure,
    required TResult Function(_successState<T> value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_initState<T> value)? init,
    TResult Function(_loadingState<T> value)? loading,
    TResult Function(_failureState<T> value)? failure,
    TResult Function(_successState<T> value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initState<T> value)? init,
    TResult Function(_loadingState<T> value)? loading,
    TResult Function(_failureState<T> value)? failure,
    TResult Function(_successState<T> value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loadingState<T> implements States<T> {
  const factory _loadingState() = _$_loadingState<T>;
}

/// @nodoc
abstract class _$failureStateCopyWith<T, $Res> {
  factory _$failureStateCopyWith(
          _failureState<T> value, $Res Function(_failureState<T>) then) =
      __$failureStateCopyWithImpl<T, $Res>;
  $Res call({DioError exception});
}

/// @nodoc
class __$failureStateCopyWithImpl<T, $Res> extends _$StatesCopyWithImpl<T, $Res>
    implements _$failureStateCopyWith<T, $Res> {
  __$failureStateCopyWithImpl(
      _failureState<T> _value, $Res Function(_failureState<T>) _then)
      : super(_value, (v) => _then(v as _failureState<T>));

  @override
  _failureState<T> get _value => super._value as _failureState<T>;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_failureState<T>(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as DioError,
    ));
  }
}

/// @nodoc

class _$_failureState<T> implements _failureState<T> {
  const _$_failureState(this.exception);

  @override
  final DioError exception;

  @override
  String toString() {
    return 'States<$T>.failure(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _failureState<T> &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$failureStateCopyWith<T, _failureState<T>> get copyWith =>
      __$failureStateCopyWithImpl<T, _failureState<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T entity) init,
    required TResult Function() loading,
    required TResult Function(DioError exception) failure,
    required TResult Function(T entity) success,
  }) {
    return failure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T entity)? init,
    TResult Function()? loading,
    TResult Function(DioError exception)? failure,
    TResult Function(T entity)? success,
  }) {
    return failure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T entity)? init,
    TResult Function()? loading,
    TResult Function(DioError exception)? failure,
    TResult Function(T entity)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initState<T> value) init,
    required TResult Function(_loadingState<T> value) loading,
    required TResult Function(_failureState<T> value) failure,
    required TResult Function(_successState<T> value) success,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_initState<T> value)? init,
    TResult Function(_loadingState<T> value)? loading,
    TResult Function(_failureState<T> value)? failure,
    TResult Function(_successState<T> value)? success,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initState<T> value)? init,
    TResult Function(_loadingState<T> value)? loading,
    TResult Function(_failureState<T> value)? failure,
    TResult Function(_successState<T> value)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _failureState<T> implements States<T> {
  const factory _failureState(DioError exception) = _$_failureState<T>;

  DioError get exception;
  @JsonKey(ignore: true)
  _$failureStateCopyWith<T, _failureState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$successStateCopyWith<T, $Res> {
  factory _$successStateCopyWith(
          _successState<T> value, $Res Function(_successState<T>) then) =
      __$successStateCopyWithImpl<T, $Res>;
  $Res call({T entity});
}

/// @nodoc
class __$successStateCopyWithImpl<T, $Res> extends _$StatesCopyWithImpl<T, $Res>
    implements _$successStateCopyWith<T, $Res> {
  __$successStateCopyWithImpl(
      _successState<T> _value, $Res Function(_successState<T>) _then)
      : super(_value, (v) => _then(v as _successState<T>));

  @override
  _successState<T> get _value => super._value as _successState<T>;

  @override
  $Res call({
    Object? entity = freezed,
  }) {
    return _then(_successState<T>(
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_successState<T> implements _successState<T> {
  const _$_successState({required this.entity});

  @override
  final T entity;

  @override
  String toString() {
    return 'States<$T>.success(entity: $entity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _successState<T> &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entity));

  @JsonKey(ignore: true)
  @override
  _$successStateCopyWith<T, _successState<T>> get copyWith =>
      __$successStateCopyWithImpl<T, _successState<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T entity) init,
    required TResult Function() loading,
    required TResult Function(DioError exception) failure,
    required TResult Function(T entity) success,
  }) {
    return success(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T entity)? init,
    TResult Function()? loading,
    TResult Function(DioError exception)? failure,
    TResult Function(T entity)? success,
  }) {
    return success?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T entity)? init,
    TResult Function()? loading,
    TResult Function(DioError exception)? failure,
    TResult Function(T entity)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initState<T> value) init,
    required TResult Function(_loadingState<T> value) loading,
    required TResult Function(_failureState<T> value) failure,
    required TResult Function(_successState<T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_initState<T> value)? init,
    TResult Function(_loadingState<T> value)? loading,
    TResult Function(_failureState<T> value)? failure,
    TResult Function(_successState<T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initState<T> value)? init,
    TResult Function(_loadingState<T> value)? loading,
    TResult Function(_failureState<T> value)? failure,
    TResult Function(_successState<T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _successState<T> implements States<T> {
  const factory _successState({required T entity}) = _$_successState<T>;

  T get entity;
  @JsonKey(ignore: true)
  _$successStateCopyWith<T, _successState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
