extension GenderExt on String {
  bool get gender {
    if (compareTo('Nam') == 0) {
      return true;
    }
    return false;
  }
}
