import 'package:key_chain/features/generator/lib/src/symbols/symbols.dart';
import 'package:test/test.dart';

void main() {
  test('Smoke', () {
    const letO = LetterO();
    final symO = Symbol.byValue('o');
    expect(letO, equals(symO));
    expect(
      letO.similars.first,
      equals(
        const DigitZero(),
      ),
    );
    expect(letO.similars.first.toString(), equals('0'));
  });
}
