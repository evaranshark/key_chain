import 'package:flutter/material.dart';
import 'package:generator/src/models/password_config.dart';
import 'package:generator/src/password_generator.dart';
import 'package:generator/src/strategies/random_strategy/random_strategy.dart';
import 'package:get_it/get_it.dart';

final services = GetIt.instance;

void main() {
  services.registerSingleton<RandomPasswordGenerator>(
    RandomPasswordGenerator(),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: _Form(),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({
    super.key,
  });

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  bool useDigits = false;
  bool useSymbols = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          services.get<RandomPasswordGenerator>().generate(
                configuration: GeneratorConfiguration(
                  useCapitalLetters: true,
                  useLowerCaseLetters: true,
                  useDigits: useDigits,
                  useSymbols: useSymbols,
                ),
                strategy: RandomGenerationStrategy(
                  length: 12,
                ),
              ),
        ),
        SwitchListTile.adaptive(
          value: useDigits,
          onChanged: (value) {
            setState(() {
              useDigits = value;
            });
          },
          title: const Text('Use digits'),
        ),
        SwitchListTile.adaptive(
          value: useSymbols,
          onChanged: (value) {
            setState(() {
              useSymbols = value;
            });
          },
          title: const Text('Use symbols'),
        ),
      ],
    );
  }
}
