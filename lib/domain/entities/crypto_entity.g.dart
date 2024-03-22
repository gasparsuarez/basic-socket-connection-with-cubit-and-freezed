// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoEntityImpl _$$CryptoEntityImplFromJson(Map<String, dynamic> json) =>
    _$CryptoEntityImpl(
      json['name'] as String,
      json['symbol'] as String,
      (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$CryptoEntityImplToJson(_$CryptoEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'symbol': instance.symbol,
      'price': instance.price,
    };
