part of 'crypto_cubit.dart';

@freezed
class CryptoState with _$CryptoState {
  const factory CryptoState.initial() = _Initial;
  const factory CryptoState.connecting() = _Connecting;
  const factory CryptoState.connected(List<CryptoEntity> cryptos) = _Connected;
  const factory CryptoState.error() = _Error;
}
