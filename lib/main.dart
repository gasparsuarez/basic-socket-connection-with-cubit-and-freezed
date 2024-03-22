import 'package:bloc_freezed/DI/service_locator.dart';
import 'package:bloc_freezed/cubits/crypto_cubit/crypto_cubit.dart';
import 'package:bloc_freezed/domain/repositories/exchange_api_repository.dart';
import 'package:bloc_freezed/domain/repositories/socket_service_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  ServiceLocator.setUp();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CryptoCubit(
              getIt.get<SocketServiceRepository>(),
              getIt.get<ExchangeApiRepository>(),
            )..connect(),
          ),
        ],
        child: BlocBuilder<CryptoCubit, CryptoState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  state.when(
                    initial: () => 'Crypto Market',
                    connecting: () => 'Conectando',
                    connected: (_) => 'Conectado',
                    error: () => 'Error',
                  ),
                ),
              ),
              body: Center(child: BlocBuilder<CryptoCubit, CryptoState>(
                builder: (context, state) {
                  return state.when(
                    initial: () {
                      return const SizedBox.shrink();
                    },
                    connecting: () => const CircularProgressIndicator(),
                    connected: (cryptos) => ListView.builder(
                      itemCount: cryptos.length,
                      itemBuilder: (_, index) {
                        final crypto = cryptos[index];
                        return ListTile(
                          title: Text(crypto.name),
                          subtitle: Text(crypto.symbol),
                          trailing: Text(
                            '\$ ${crypto.price}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                    ),
                    error: () => const Text('Ocurrió un error'),
                  );
                },
              )),
            );
          },
        ),
      ),
    );
  }
}
/*    state.when(
                      initial: () => FilledButton(
                        onPressed: () => context.read<CryptoCubit>().connect(),
                        child: const Text('Comenzar a escuchar'),
                      ),
                      connecting: () => const Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Conectando..'),
                        ],
                      ),
                      connected: () => const Text('Socket connected'),
                      error: () => FilledButton(
                        onPressed: () {},
                        child: const Text('Reintentar'),
                      ),
                    ) */
