import 'package:bloc_freezed/domain/entities/crypto_entity.dart';

abstract class ExchangeApiRepository {
  Future<List<CryptoEntity>> getCryptoAssets();
}
