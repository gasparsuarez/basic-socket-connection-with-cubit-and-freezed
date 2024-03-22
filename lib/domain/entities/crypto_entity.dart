import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_entity.freezed.dart';
part 'crypto_entity.g.dart';

@freezed
abstract class CryptoEntity with _$CryptoEntity {
  factory CryptoEntity(
    String name,
    String symbol,
    double price,
  ) = _CryptoEntity;
  factory CryptoEntity.fromJson(Map<String, dynamic> json) => _$CryptoEntityFromJson(json);
}
