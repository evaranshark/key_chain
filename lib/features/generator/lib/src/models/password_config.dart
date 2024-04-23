class GeneratorConfiguration {
  final bool useCapitalLetters;
  final bool useLowerCaseLetters;
  final int length;
  final bool useDigits;
  final bool useSymbols;

  GeneratorConfiguration({
    required this.useCapitalLetters,
    required this.useLowerCaseLetters,
    required this.length,
    required this.useDigits,
    required this.useSymbols,
  }) : assert(
          length >= 8,
          'Too short password',
        );
}
