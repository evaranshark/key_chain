import 'package:generator/src/models/word.dart';

abstract interface class InitialDataSource {
  Future<Stream<Word>> getWords();
}
