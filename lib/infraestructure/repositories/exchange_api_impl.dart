import 'dart:developer';

import 'package:bloc_freezed/domain/entities/crypto_entity.dart';
import 'package:bloc_freezed/domain/repositories/exchange_api_repository.dart';
import 'package:dio/dio.dart';

class ExchangeApiImpl implements ExchangeApiRepository {
  final _dio = Dio();
  @override
  Future<List<CryptoEntity>> getCryptoAssets() async {
    try {
      final response = await _dio.get('https://api.coincap.io/v2/assets?ids=bitcoin,dogecoin');

      return (response.data['data'] as List)
          .map(
            (e) => CryptoEntity(
              e['id'],
              e['symbol'],
              double.parse(e['priceUsd']),
            ),
          )
          .toList();
    } catch (e) {
      log(e.toString());
      throw Exception('Ocurrió un error');
    }
  }
}
