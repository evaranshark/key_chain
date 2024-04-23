import 'package:flutter/material.dart';
import 'package:generator/src/models/password_config.dart';
import 'package:generator/src/password_generator.dart';
import 'package:get_it/get_it.dart';

final services = GetIt.instance;

void main() {
  services.registerSingleton<PasswordGenerator>(
    DefaultPasswordGenerator(),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            services.get<PasswordGenerator>().generate(
                  configuration: GeneratorConfiguration(
                    useCapitalLetters: true,
                    useLowerCaseLetters: true,
                    length: 10,
                    useDigits: false,
                    useSymbols: false,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
