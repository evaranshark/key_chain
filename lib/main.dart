import 'package:flutter/material.dart';

import 'package:generator/src/password_generator.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:key_chain/router.dart';
import 'package:logger/logger.dart';

final services = GetIt.instance;

void main() {
  services
    ..registerSingleton<Logger>(Logger())
    ..registerSingleton<RouterConfig<RouteMatchList>>(RouterProvider().router)
    ..registerSingleton<IPasswordGenerator>(
      PasswordGeneratorImpl(),
    );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: services.get<RouterConfig<RouteMatchList>>(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
