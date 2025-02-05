part of 'symbols.dart';

sealed class Digit extends Symbol {
  const Digit({required super.get});

  factory Digit.byIntValue(int value) {
    return switch (value) {
      0 => const DigitZero(),
      1 => const DigitOne(),
      2 => const DigitTwo(),
      3 => const DigitThree(),
      4 => const DigitFour(),
      5 => const DigitFive(),
      6 => const DigitSix(),
      7 => const DigitSeven(),
      8 => const DigitEight(),
      9 => const DigitNine(),
      _ => throw ArgumentError.value(value, 'value', 'must be between 0 and 9'),
    };
  }
}

final class DigitZero extends Digit {
  const DigitZero() : super(get: '0');
}

final class DigitOne extends Digit {
  const DigitOne() : super(get: '1');
}

final class DigitTwo extends Digit {
  const DigitTwo() : super(get: '2');
}

final class DigitThree extends Digit {
  const DigitThree() : super(get: '3');
}

final class DigitFour extends Digit {
  const DigitFour() : super(get: '4');
}

final class DigitFive extends Digit {
  const DigitFive() : super(get: '5');
}

final class DigitSix extends Digit {
  const DigitSix() : super(get: '6');
}

final class DigitSeven extends Digit {
  const DigitSeven() : super(get: '7');
}

final class DigitEight extends Digit {
  const DigitEight() : super(get: '8');
}

final class DigitNine extends Digit {
  const DigitNine() : super(get: '9');
}

extension RandomDigit on Random {
  Digit nextDigit() => Digit.byIntValue(
        nextInt(
          10,
        ),
      );
}
