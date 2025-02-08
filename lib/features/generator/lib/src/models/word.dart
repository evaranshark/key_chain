import 'package:generator/src/models/word_role.dart';

class Word {
  final String word;
  final WordRole role;
  final int length;

  Word({
    required this.word,
    required this.role,
    required this.length,
  });
}
