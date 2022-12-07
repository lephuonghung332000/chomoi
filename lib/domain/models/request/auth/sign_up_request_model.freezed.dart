// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpRequestModel {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  bool get gender => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  String get birthday => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpRequestModelCopyWith<SignUpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpRequestModelCopyWith<$Res> {
  factory $SignUpRequestModelCopyWith(
          SignUpRequestModel value, $Res Function(SignUpRequestModel) then) =
      _$SignUpRequestModelCopyWithImpl<$Res, SignUpRequestModel>;
  @useResult
  $Res call(
      {String name,
      String phone,
      bool gender,
      String address,
      String fullname,
      String birthday,
      String email,
      String password});
}

/// @nodoc
class _$SignUpRequestModelCopyWithImpl<$Res, $Val extends SignUpRequestModel>
    implements $SignUpRequestModelCopyWith<$Res> {
  _$SignUpRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? gender = null,
    Object? address = null,
    Object? fullname = null,
    Object? birthday = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpRequestModelCopyWith<$Res>
    implements $SignUpRequestModelCopyWith<$Res> {
  factory _$$_SignUpRequestModelCopyWith(_$_SignUpRequestModel value,
          $Res Function(_$_SignUpRequestModel) then) =
      __$$_SignUpRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String phone,
      bool gender,
      String address,
      String fullname,
      String birthday,
      String email,
      String password});
}

/// @nodoc
class __$$_SignUpRequestModelCopyWithImpl<$Res>
    extends _$SignUpRequestModelCopyWithImpl<$Res, _$_SignUpRequestModel>
    implements _$$_SignUpRequestModelCopyWith<$Res> {
  __$$_SignUpRequestModelCopyWithImpl(
      _$_SignUpRequestModel _value, $Res Function(_$_SignUpRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? gender = null,
    Object? address = null,
    Object? fullname = null,
    Object? birthday = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_SignUpRequestModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUpRequestModel implements _SignUpRequestModel {
  _$_SignUpRequestModel(
      {required this.name,
      required this.phone,
      required this.gender,
      required this.address,
      required this.fullname,
      required this.birthday,
      required this.email,
      required this.password});

  @override
  final String name;
  @override
  final String phone;
  @override
  final bool gender;
  @override
  final String address;
  @override
  final String fullname;
  @override
  final String birthday;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpRequestModel(name: $name, phone: $phone, gender: $gender, address: $address, fullname: $fullname, birthday: $birthday, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpRequestModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, phone, gender, address,
      fullname, birthday, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpRequestModelCopyWith<_$_SignUpRequestModel> get copyWith =>
      __$$_SignUpRequestModelCopyWithImpl<_$_SignUpRequestModel>(
          this, _$identity);
}

abstract class _SignUpRequestModel implements SignUpRequestModel {
  factory _SignUpRequestModel(
      {required final String name,
      required final String phone,
      required final bool gender,
      required final String address,
      required final String fullname,
      required final String birthday,
      required final String email,
      required final String password}) = _$_SignUpRequestModel;

  @override
  String get name;
  @override
  String get phone;
  @override
  bool get gender;
  @override
  String get address;
  @override
  String get fullname;
  @override
  String get birthday;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpRequestModelCopyWith<_$_SignUpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
