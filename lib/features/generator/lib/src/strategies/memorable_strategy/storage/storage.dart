import 'package:generator/src/models/word.dart';
import 'package:generator/src/models/word_role.dart';

abstract interface class Storage {
  Future<void> insertWords({
    required Stream<Word> words,
  });

  Future<Word> getWord({
    int? length,
    WordRole? wordRole,
  });

  /// If false => stored data is invalid
  Future<bool> preformCheck();
}
