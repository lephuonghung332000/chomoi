// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'brand_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BrandModelTearOff {
  const _$BrandModelTearOff();

  _BrandModel call(
      {required String id, required String name, required String image}) {
    return _BrandModel(
      id: id,
      name: name,
      image: image,
    );
  }
}

/// @nodoc
const $BrandModel = _$BrandModelTearOff();

/// @nodoc
mixin _$BrandModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BrandModelCopyWith<BrandModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandModelCopyWith<$Res> {
  factory $BrandModelCopyWith(
          BrandModel value, $Res Function(BrandModel) then) =
      _$BrandModelCopyWithImpl<$Res>;
  $Res call({String id, String name, String image});
}

/// @nodoc
class _$BrandModelCopyWithImpl<$Res> implements $BrandModelCopyWith<$Res> {
  _$BrandModelCopyWithImpl(this._value, this._then);

  final BrandModel _value;
  // ignore: unused_field
  final $Res Function(BrandModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BrandModelCopyWith<$Res> implements $BrandModelCopyWith<$Res> {
  factory _$BrandModelCopyWith(
          _BrandModel value, $Res Function(_BrandModel) then) =
      __$BrandModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String image});
}

/// @nodoc
class __$BrandModelCopyWithImpl<$Res> extends _$BrandModelCopyWithImpl<$Res>
    implements _$BrandModelCopyWith<$Res> {
  __$BrandModelCopyWithImpl(
      _BrandModel _value, $Res Function(_BrandModel) _then)
      : super(_value, (v) => _then(v as _BrandModel));

  @override
  _BrandModel get _value => super._value as _BrandModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
  }) {
    return _then(_BrandModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BrandModel implements _BrandModel {
  _$_BrandModel({required this.id, required this.name, required this.image});

  @override
  final String id;
  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'BrandModel(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrandModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$BrandModelCopyWith<_BrandModel> get copyWith =>
      __$BrandModelCopyWithImpl<_BrandModel>(this, _$identity);
}

abstract class _BrandModel implements BrandModel {
  factory _BrandModel(
      {required String id,
      required String name,
      required String image}) = _$_BrandModel;

  @override
  String get id;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$BrandModelCopyWith<_BrandModel> get copyWith =>
      throw _privateConstructorUsedError;
}
