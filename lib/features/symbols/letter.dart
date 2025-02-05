part of 'symbols.dart';

sealed class Letter extends Symbol {
  const Letter({required super.get});

  Symbol get upper;
  Symbol get lower;

  List<Symbol> get similars;
}

final class LetterA extends Letter {
  const LetterA() : super(get: 'a');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [
        const SpecSymAtSign(),
      ];

  @override
  Symbol get upper => const LetterBigA();
}

final class LetterBigA extends Letter {
  const LetterBigA() : super(get: 'A');

  @override
  Symbol get lower => const LetterA();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterB extends Letter {
  const LetterB() : super(get: 'b');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [
        const DigitSix(),
      ];

  @override
  Symbol get upper => const LetterBigB();
}

final class LetterBigB extends Letter {
  const LetterBigB() : super(get: 'B');

  @override
  Symbol get lower => const LetterB();

  @override
  List<Symbol> get similars => [
        const DigitEight(),
      ];

  @override
  Symbol get upper => this;
}

// Classes for remaining English letters
final class LetterC extends Letter {
  const LetterC() : super(get: 'c');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigC();
}

final class LetterBigC extends Letter {
  const LetterBigC() : super(get: 'C');

  @override
  Symbol get lower => const LetterC();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterD extends Letter {
  const LetterD() : super(get: 'd');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigD();
}

final class LetterBigD extends Letter {
  const LetterBigD() : super(get: 'D');

  @override
  Symbol get lower => const LetterD();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterE extends Letter {
  const LetterE() : super(get: 'e');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigE();
}

final class LetterBigE extends Letter {
  const LetterBigE() : super(get: 'E');

  @override
  Symbol get lower => const LetterE();

  @override
  List<Symbol> get similars => [
        const DigitThree(),
      ];

  @override
  Symbol get upper => this;
}

final class LetterF extends Letter {
  const LetterF() : super(get: 'f');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigF();
}

final class LetterBigF extends Letter {
  const LetterBigF() : super(get: 'F');

  @override
  Symbol get lower => const LetterF();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterG extends Letter {
  const LetterG() : super(get: 'g');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [const DigitNine()];

  @override
  Symbol get upper => const LetterBigG();
}

final class LetterBigG extends Letter {
  const LetterBigG() : super(get: 'G');

  @override
  Symbol get lower => const LetterG();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterH extends Letter {
  const LetterH() : super(get: 'h');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigH();
}

final class LetterBigH extends Letter {
  const LetterBigH() : super(get: 'H');

  @override
  Symbol get lower => const LetterH();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterI extends Letter {
  const LetterI() : super(get: 'i');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [
        const SpecSymExclamationMark(),
      ];

  @override
  Symbol get upper => const LetterBigI();
}

final class LetterBigI extends Letter {
  const LetterBigI() : super(get: 'I');

  @override
  Symbol get lower => const LetterI();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterJ extends Letter {
  const LetterJ() : super(get: 'j');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigJ();
}

final class LetterBigJ extends Letter {
  const LetterBigJ() : super(get: 'J');

  @override
  Symbol get lower => const LetterJ();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterK extends Letter {
  const LetterK() : super(get: 'k');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigK();
}

final class LetterBigK extends Letter {
  const LetterBigK() : super(get: 'K');

  @override
  Symbol get lower => const LetterK();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterL extends Letter {
  const LetterL() : super(get: 'l');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [
        const DigitOne(),
      ];

  @override
  Symbol get upper => const LetterBigL();
}

final class LetterBigL extends Letter {
  const LetterBigL() : super(get: 'L');

  @override
  Symbol get lower => const LetterL();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterM extends Letter {
  const LetterM() : super(get: 'm');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigM();
}

final class LetterBigM extends Letter {
  const LetterBigM() : super(get: 'M');

  @override
  Symbol get lower => const LetterM();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterN extends Letter {
  const LetterN() : super(get: 'n');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigN();
}

final class LetterBigN extends Letter {
  const LetterBigN() : super(get: 'N');

  @override
  Symbol get lower => const LetterN();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterO extends Letter {
  const LetterO() : super(get: 'o');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [
        const DigitZero(),
      ];

  @override
  Symbol get upper => const LetterBigO();
}

final class LetterBigO extends Letter {
  const LetterBigO() : super(get: 'O');

  @override
  Symbol get lower => const LetterO();

  @override
  List<Symbol> get similars => [
        const DigitZero(),
      ];

  @override
  Symbol get upper => this;
}

final class LetterP extends Letter {
  const LetterP() : super(get: 'p');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigP();
}

final class LetterBigP extends Letter {
  const LetterBigP() : super(get: 'P');

  @override
  Symbol get lower => const LetterP();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterQ extends Letter {
  const LetterQ() : super(get: 'q');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigQ();
}

final class LetterBigQ extends Letter {
  const LetterBigQ() : super(get: 'Q');

  @override
  Symbol get lower => const LetterQ();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterR extends Letter {
  const LetterR() : super(get: 'r');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigR();
}

final class LetterBigR extends Letter {
  const LetterBigR() : super(get: 'R');

  @override
  Symbol get lower => const LetterR();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterS extends Letter {
  const LetterS() : super(get: 's');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [const DigitFive()];

  @override
  Symbol get upper => const LetterBigS();
}

final class LetterBigS extends Letter {
  const LetterBigS() : super(get: 'S');

  @override
  Symbol get lower => const LetterS();

  @override
  List<Symbol> get similars => [const DigitFive()];

  @override
  Symbol get upper => this;
}

final class LetterT extends Letter {
  const LetterT() : super(get: 't');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigT();
}

final class LetterBigT extends Letter {
  const LetterBigT() : super(get: 'T');

  @override
  Symbol get lower => const LetterT();

  @override
  List<Symbol> get similars => [
        const DigitSeven(),
      ];

  @override
  Symbol get upper => this;
}

final class LetterU extends Letter {
  const LetterU() : super(get: 'u');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigU();
}

final class LetterBigU extends Letter {
  const LetterBigU() : super(get: 'U');

  @override
  Symbol get lower => const LetterU();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterV extends Letter {
  const LetterV() : super(get: 'v');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigV();
}

final class LetterBigV extends Letter {
  const LetterBigV() : super(get: 'V');

  @override
  Symbol get lower => const LetterV();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterW extends Letter {
  const LetterW() : super(get: 'w');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigW();
}

final class LetterBigW extends Letter {
  const LetterBigW() : super(get: 'W');

  @override
  Symbol get lower => const LetterW();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterX extends Letter {
  const LetterX() : super(get: 'x');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigX();
}

final class LetterBigX extends Letter {
  const LetterBigX() : super(get: 'X');

  @override
  Symbol get lower => const LetterX();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterY extends Letter {
  const LetterY() : super(get: 'y');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigY();
}

final class LetterBigY extends Letter {
  const LetterBigY() : super(get: 'Y');

  @override
  Symbol get lower => const LetterY();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}

final class LetterZ extends Letter {
  const LetterZ() : super(get: 'z');

  @override
  Symbol get lower => this;

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => const LetterBigZ();
}

final class LetterBigZ extends Letter {
  const LetterBigZ() : super(get: 'Z');

  @override
  Symbol get lower => const LetterZ();

  @override
  List<Symbol> get similars => [];

  @override
  Symbol get upper => this;
}
