import 'package:bloc_freezed/domain/entities/crypto_entity.dart';
import 'package:bloc_freezed/domain/repositories/exchange_api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_freezed/domain/repositories/socket_service_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_state.dart';
part 'crypto_cubit.freezed.dart';

class CryptoCubit extends Cubit<CryptoState> {
  final SocketServiceRepository _socketRepository;
  final ExchangeApiRepository _exchangeRepository;
  CryptoCubit(
    this._socketRepository,
    this._exchangeRepository,
  ) : super(const CryptoState.initial());

  void connect() async {
    emit(const CryptoState.connecting());
    try {
      await _socketRepository.connect(
        [
          'bitcoin,dogecoin',
        ],
      );
      final cryptoAssets = await _exchangeRepository.getCryptoAssets();
      _onPricesChanged();
      emit(CryptoState.connected(cryptoAssets));
    } catch (e) {
      emit(const CryptoState.error());
    }
  }

  void _onPricesChanged() {
    _socketRepository.onPricesChanged.listen(
      (changes) {
        state.mapOrNull(
          connected: (connected) {
            final keys = changes.keys;
            var newList = [
              ...connected.cryptos.map(
                (e) {
                  if (keys.contains(e.name)) {
                    return e.copyWith(
                      price: changes[e.name]!,
                    );
                  }
                  return e;
                },
              )
            ];

            emit(connected.copyWith(
              cryptos: newList,
            ));
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    _socketRepository.disconnect();
    return super.close();
  }
}
