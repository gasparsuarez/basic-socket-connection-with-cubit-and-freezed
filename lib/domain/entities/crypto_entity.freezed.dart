// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CryptoEntity _$CryptoEntityFromJson(Map<String, dynamic> json) {
  return _CryptoEntity.fromJson(json);
}

/// @nodoc
mixin _$CryptoEntity {
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoEntityCopyWith<CryptoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoEntityCopyWith<$Res> {
  factory $CryptoEntityCopyWith(
          CryptoEntity value, $Res Function(CryptoEntity) then) =
      _$CryptoEntityCopyWithImpl<$Res, CryptoEntity>;
  @useResult
  $Res call({String name, String symbol, double price});
}

/// @nodoc
class _$CryptoEntityCopyWithImpl<$Res, $Val extends CryptoEntity>
    implements $CryptoEntityCopyWith<$Res> {
  _$CryptoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symbol = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoEntityImplCopyWith<$Res>
    implements $CryptoEntityCopyWith<$Res> {
  factory _$$CryptoEntityImplCopyWith(
          _$CryptoEntityImpl value, $Res Function(_$CryptoEntityImpl) then) =
      __$$CryptoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String symbol, double price});
}

/// @nodoc
class __$$CryptoEntityImplCopyWithImpl<$Res>
    extends _$CryptoEntityCopyWithImpl<$Res, _$CryptoEntityImpl>
    implements _$$CryptoEntityImplCopyWith<$Res> {
  __$$CryptoEntityImplCopyWithImpl(
      _$CryptoEntityImpl _value, $Res Function(_$CryptoEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symbol = null,
    Object? price = null,
  }) {
    return _then(_$CryptoEntityImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoEntityImpl implements _CryptoEntity {
  _$CryptoEntityImpl(this.name, this.symbol, this.price);

  factory _$CryptoEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoEntityImplFromJson(json);

  @override
  final String name;
  @override
  final String symbol;
  @override
  final double price;

  @override
  String toString() {
    return 'CryptoEntity(name: $name, symbol: $symbol, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, symbol, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoEntityImplCopyWith<_$CryptoEntityImpl> get copyWith =>
      __$$CryptoEntityImplCopyWithImpl<_$CryptoEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoEntityImplToJson(
      this,
    );
  }
}

abstract class _CryptoEntity implements CryptoEntity {
  factory _CryptoEntity(
          final String name, final String symbol, final double price) =
      _$CryptoEntityImpl;

  factory _CryptoEntity.fromJson(Map<String, dynamic> json) =
      _$CryptoEntityImpl.fromJson;

  @override
  String get name;
  @override
  String get symbol;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$CryptoEntityImplCopyWith<_$CryptoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
