import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generator/generator.dart';
import 'package:generator/src/strategies/random_strategy/random_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_chain/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DictionaryProvider>(future: () {
      final completer = Completer<DictionaryProvider>();
      final _provider = DictionaryProviderImpl(
        repository: DictionaryRepository(),
      );
      _provider.load().then((_) => completer.complete(_provider));
      return completer.future;
    }(), builder: (context, snapshot) {
      if (snapshot.hasData) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<MemorableStrategy>(
              create: (context) => MemorableStrategy(
                dictionaryProvider: snapshot.data!,
              ),
            ),
          ],
          child: const Scaffold(
            body: Center(
              child: _Form(),
            ),
          ),
        );
      }
      if (snapshot.hasError) {
        return Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        );
      }
      return Scaffold(
        body: Center(
          child: Text('Loading...'),
        ),
      );
    });
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

  late final GenerationStrategy strategy;

  final _randomStrat = RandomGenerationStrategy();
  late final MemorableStrategy _memorableStart;

  Password pass = Password.fromString(string: '');

  Future<void> _updatePass() async {
    pass = await services.get<IPasswordGenerator>().generate(
          configuration: GeneratorConfiguration(
            useCapitalLetters: true,
            useLowerCaseLetters: true,
            useDigits: useDigits,
            useSymbols: useSymbols,
          ),
          strategy: strategy,
        );
  }

  @override
  void initState() {
    super.initState();
    length = minLength.floor();
    _memorableStart = context.read<MemorableStrategy>();
    strategy = _memorableStart;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: pass.symbols
                .map(
                  (s) => TextSpan(
                    text: s.get,
                    style: TextStyle(
                        color: switch (s) {
                      Letter() => Colors.black,
                      Digit() => Colors.blue,
                      Symbol() => Colors.pink,
                    }),
                  ),
                )
                .toList(),
          ),
          style: GoogleFonts.notoSansMono(
            fontSize: 48,
          ),
        ),
        Text('Actual length is ${pass.get.length}'),
        _LengthField(
          length: length,
          minLength: minLength,
          maxLength: maxLength,
          divisions: divisions,
          onChanged: onLengthChanged,
        ),
        SwitchListTile.adaptive(
          value: useDigits,
          onChanged: (value) async {
            useDigits = value;
            await _updatePass();
            setState(() {});
          },
          title: const Text('Use digits'),
        ),
        SwitchListTile.adaptive(
          value: useSymbols,
          onChanged: (value) async {
            useSymbols = value;
            await _updatePass();
            setState(() {});
          },
          title: const Text('Use symbols'),
        ),
        OutlinedButton(
          onPressed: () async {
            await _updatePass();
            setState(() {});
          },
          child: const Text('Generate'),
        ),
        Spacer(),
        Text(
          GoRouterState.of(context).path ?? '',
        ),
      ],
    );
  }

  Future<void> onLengthChanged(double value) async {
    length = value.floor();
    if (strategy is RandomGenerationStrategy) {
      (strategy as RandomGenerationStrategy).updateLength(length: length);
    }
    await _updatePass();
    setState(() {});
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
