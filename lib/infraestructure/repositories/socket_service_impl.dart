import 'dart:async';
import 'dart:convert';

import 'package:bloc_freezed/domain/repositories/socket_service_repository.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketServiceImpl implements SocketServiceRepository {
  final WebSocketChannel Function(List<String> ids) builder;

  SocketServiceImpl(this.builder);
  WebSocketChannel? _channel;
  StreamController<Map<String, double>>? _controller;
  StreamSubscription? _subscription;

  @override
  Future<bool> connect(List<String> ids) async {
    try {
      _channel = builder(ids);
      await _channel!.ready;

      /// Escucha las respuestas del socket
      _subscription = _channel!.stream.listen(
        (event) {
          /// Convertimos la respuesta de tipo String a un mapa de tipo <String,String>
          final json = Map<String, String>.from(jsonDecode(event));

          /// Mapeamos el json a un mapa de tipo <String, double>
          final data = <String, double>{};
          data.addEntries(
            json.entries.map(
              (e) => MapEntry(
                e.key,
                double.parse(e.value),
              ),
            ),
          );
          if (_controller?.hasListener ?? false) {
            _controller!.add(data);
          }
        },
      );

      return true;
    } catch (_) {
      return false;
    }
  }

  //Cerramos la conexión
  @override
  Future<void> disconnect() async {
    await _channel!.sink.close();
    await _controller!.close();
    _channel = null;
  }

  @override
  Stream<Map<String, double>> get onPricesChanged {
    _controller ??= StreamController.broadcast();
    return _controller!.stream;
  }
}
