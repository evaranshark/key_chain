import 'dart:math';

import 'package:equatable/equatable.dart';

part 'letter.dart';
part 'digit.dart';
part 'special_symbol.dart';

sealed class Symbol with EquatableMixin {
  final String get;

  const Symbol({
    required this.get,
  });

  factory Symbol.byValue(String value) => switch (value) {
        'a' => const LetterA(),
        'b' => const LetterB(),
        'c' => const LetterC(),
        'd' => const LetterD(),
        'e' => const LetterE(),
        'f' => const LetterF(),
        'g' => const LetterG(),
        'h' => const LetterH(),
        'i' => const LetterI(),
        'j' => const LetterJ(),
        'k' => const LetterK(),
        'l' => const LetterL(),
        'm' => const LetterM(),
        'n' => const LetterN(),
        'o' => const LetterO(),
        'p' => const LetterP(),
        'q' => const LetterQ(),
        'r' => const LetterR(),
        's' => const LetterS(),
        't' => const LetterT(),
        'u' => const LetterU(),
        'v' => const LetterV(),
        'w' => const LetterW(),
        'x' => const LetterX(),
        'y' => const LetterY(),
        'z' => const LetterZ(),
        _ => throw UnimplementedError('Character not supported'),
      };

  @override
  String toString() => get;

  @override
  List<Object?> get props => [get];
}
