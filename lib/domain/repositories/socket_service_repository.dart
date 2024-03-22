abstract class SocketServiceRepository {
  Future<bool> connect(List<String> ids);
  Future<void> disconnect();
  Stream<Map<String, double>> get onPricesChanged;
}
