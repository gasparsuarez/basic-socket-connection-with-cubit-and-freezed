import 'package:bloc_freezed/domain/repositories/exchange_api_repository.dart';
import 'package:bloc_freezed/domain/repositories/socket_service_repository.dart';
import 'package:bloc_freezed/infraestructure/repositories/exchange_api_impl.dart';
import 'package:bloc_freezed/infraestructure/repositories/socket_service_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final getIt = GetIt.instance;

///
/// Dependency injector
///
class ServiceLocator {
  ServiceLocator._();

  static setUp() {
    getIt.registerLazySingleton<SocketServiceRepository>(
      () => SocketServiceImpl(
        (ids) => WebSocketChannel.connect(
          Uri.parse('wss://ws.coincap.io/prices?assets=${ids.join(',')}'),
        ),
      ),
    );

    getIt.registerLazySingleton<ExchangeApiRepository>(() => ExchangeApiImpl());
  }
}
