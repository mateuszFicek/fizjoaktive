// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Client {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  List<String> get patientsIDs => throw _privateConstructorUsedError;
  DateTime get lastVisit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClientCopyWith<Client> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) then) =
      _$ClientCopyWithImpl<$Res, Client>;
  @useResult
  $Res call(
      {String name,
      String address,
      List<String> patientsIDs,
      DateTime lastVisit});
}

/// @nodoc
class _$ClientCopyWithImpl<$Res, $Val extends Client>
    implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? patientsIDs = null,
    Object? lastVisit = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      patientsIDs: null == patientsIDs
          ? _value.patientsIDs
          : patientsIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastVisit: null == lastVisit
          ? _value.lastVisit
          : lastVisit // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientImplCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$$ClientImplCopyWith(
          _$ClientImpl value, $Res Function(_$ClientImpl) then) =
      __$$ClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String address,
      List<String> patientsIDs,
      DateTime lastVisit});
}

/// @nodoc
class __$$ClientImplCopyWithImpl<$Res>
    extends _$ClientCopyWithImpl<$Res, _$ClientImpl>
    implements _$$ClientImplCopyWith<$Res> {
  __$$ClientImplCopyWithImpl(
      _$ClientImpl _value, $Res Function(_$ClientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? patientsIDs = null,
    Object? lastVisit = null,
  }) {
    return _then(_$ClientImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      patientsIDs: null == patientsIDs
          ? _value._patientsIDs
          : patientsIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastVisit: null == lastVisit
          ? _value.lastVisit
          : lastVisit // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ClientImpl extends _Client {
  const _$ClientImpl(
      {required this.name,
      required this.address,
      required final List<String> patientsIDs,
      required this.lastVisit})
      : _patientsIDs = patientsIDs,
        super._();

  @override
  final String name;
  @override
  final String address;
  final List<String> _patientsIDs;
  @override
  List<String> get patientsIDs {
    if (_patientsIDs is EqualUnmodifiableListView) return _patientsIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patientsIDs);
  }

  @override
  final DateTime lastVisit;

  @override
  String toString() {
    return 'Client(name: $name, address: $address, patientsIDs: $patientsIDs, lastVisit: $lastVisit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._patientsIDs, _patientsIDs) &&
            (identical(other.lastVisit, lastVisit) ||
                other.lastVisit == lastVisit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, address,
      const DeepCollectionEquality().hash(_patientsIDs), lastVisit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientImplCopyWith<_$ClientImpl> get copyWith =>
      __$$ClientImplCopyWithImpl<_$ClientImpl>(this, _$identity);
}

abstract class _Client extends Client {
  const factory _Client(
      {required final String name,
      required final String address,
      required final List<String> patientsIDs,
      required final DateTime lastVisit}) = _$ClientImpl;
  const _Client._() : super._();

  @override
  String get name;
  @override
  String get address;
  @override
  List<String> get patientsIDs;
  @override
  DateTime get lastVisit;
  @override
  @JsonKey(ignore: true)
  _$$ClientImplCopyWith<_$ClientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
