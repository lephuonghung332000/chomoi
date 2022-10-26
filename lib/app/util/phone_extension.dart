extension PhoneExtension on String {
  String get trimExtraCharactersInPhoneNumber =>
      replaceAll(RegExp(r'[.\\\-\/\s]'), '');
}
