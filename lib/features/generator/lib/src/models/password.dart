import 'package:generator/src/symbols/symbols.dart';

class Password {
  final String get;
  final List<Symbol> _symbols;

  Password.fromString({
    required String string,
  })  : get = string,
        _symbols = string.split('').map(Symbol.byValue).toList();

  Password.fromSymbols({required List<Symbol> symbols})
      : _symbols = symbols,
        get = symbols.join();

  List<Symbol> get symbols => _symbols;

  @override
  String toString() => 'Password($get)';
}
