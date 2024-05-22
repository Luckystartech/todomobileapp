import 'package:riverpod/riverpod.dart';

class TextFieldProvider{
  static final titleProvider = StateProvider.autoDispose<String>((ref) {
    return '';
  });
  static final descriptionProvider = StateProvider.autoDispose<String>((ref) {
    return '';
  });
}