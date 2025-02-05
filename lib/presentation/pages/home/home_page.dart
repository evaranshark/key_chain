import 'package:flutter/material.dart';
import 'package:generator/generator.dart';
import 'package:generator/src/strategies/random_strategy/random_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:key_chain/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _Form(),
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

  final double minLength = 8;

  final double maxLength = 30;

  int get divisions => (maxLength - minLength).toInt();

  late int length;

  final strategy = RandomGenerationStrategy();

  @override
  void initState() {
    super.initState();
    length = minLength.floor();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          services.get<IPasswordGenerator>().generate(
                configuration: GeneratorConfiguration(
                  useCapitalLetters: true,
                  useLowerCaseLetters: true,
                  useDigits: useDigits,
                  useSymbols: useSymbols,
                ),
                strategy: strategy,
              ),
        ),
        _LengthField(
            length: length,
            minLength: minLength,
            maxLength: maxLength,
            divisions: divisions,
            onChanged: onLengthChanged),
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
        Spacer(),
        Text(
          GoRouterState.of(context).path ?? '',
        ),
      ],
    );
  }

  void onLengthChanged(double value) {
    setState(() {
      length = value.floor();
      strategy.updateLength(length: length);
    });
  }
}

class _LengthField extends StatelessWidget {
  const _LengthField({
    required this.length,
    required this.minLength,
    required this.maxLength,
    required this.divisions,
    required this.onChanged,
  });

  final int length;
  final double minLength;
  final double maxLength;
  final int divisions;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Password length  $length'),
        Slider.adaptive(
          value: length.toDouble(),
          min: minLength,
          max: maxLength,
          divisions: divisions,
          label: 'Password length',
          onChanged: onChanged,
        ),
      ],
    );
  }
}
