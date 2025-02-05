part of 'symbols.dart';

/// Descendants represent following symbols: '!@#%^&*()-_=+[{]}:<.>/?'
sealed class SpecialSymbol extends Symbol {
  const SpecialSymbol({required super.get});
}

final class SpecSymExclamationMark extends SpecialSymbol {
  const SpecSymExclamationMark() : super(get: '!');
}

final class SpecSymAtSign extends SpecialSymbol {
  const SpecSymAtSign() : super(get: '@');
}

final class SpecSymNumberSign extends SpecialSymbol {
  const SpecSymNumberSign() : super(get: '#');
}

final class SpecSymPercentSign extends SpecialSymbol {
  const SpecSymPercentSign() : super(get: '%');
}

final class SpecSymCaret extends SpecialSymbol {
  const SpecSymCaret() : super(get: '^');
}

final class SpecSymAmpersand extends SpecialSymbol {
  const SpecSymAmpersand() : super(get: '&');
}

final class SpecSymAsterisk extends SpecialSymbol {
  const SpecSymAsterisk() : super(get: '*');
}

final class SpecSymLeftParenthesis extends SpecialSymbol {
  const SpecSymLeftParenthesis() : super(get: '(');
}

final class SpecSymRightParenthesis extends SpecialSymbol {
  const SpecSymRightParenthesis() : super(get: ')');
}

final class SpecSymHyphen extends SpecialSymbol {
  const SpecSymHyphen() : super(get: '-');
}

final class SpecSymUnderscore extends SpecialSymbol {
  const SpecSymUnderscore() : super(get: '_');
}

final class SpecSymEqualsSign extends SpecialSymbol {
  const SpecSymEqualsSign() : super(get: '=');
}

final class SpecSymPlusSign extends SpecialSymbol {
  const SpecSymPlusSign() : super(get: '+');
}

final class SpecSymLeftBracket extends SpecialSymbol {
  const SpecSymLeftBracket() : super(get: '[');
}

final class SpecSymRightBracket extends SpecialSymbol {
  const SpecSymRightBracket() : super(get: ']');
}

final class SpecSymLeftBrace extends SpecialSymbol {
  const SpecSymLeftBrace() : super(get: '{');
}

final class SpecSymRightBrace extends SpecialSymbol {
  const SpecSymRightBrace() : super(get: '}');
}

final class SpecSymColon extends SpecialSymbol {
  const SpecSymColon() : super(get: ':');
}

final class SpecSymLessThanSign extends SpecialSymbol {
  const SpecSymLessThanSign() : super(get: '<');
}

final class SpecSymGreaterThanSign extends SpecialSymbol {
  const SpecSymGreaterThanSign() : super(get: '>');
}

final class SpecSymPeriod extends SpecialSymbol {
  const SpecSymPeriod() : super(get: '.');
}

final class SpecSymSlash extends SpecialSymbol {
  const SpecSymSlash() : super(get: '/');
}

final class SpecSymQuestionMark extends SpecialSymbol {
  const SpecSymQuestionMark() : super(get: '?');
}
