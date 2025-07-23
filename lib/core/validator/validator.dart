class CustomValidator {
  static emailValidator({String? value}) {
    if (value == null || value.isEmpty) {
      return 'pass cant be empty';
    }
    return null;
  }

  static passValidator({String? value}) {
    if (value == null || value.isEmpty) {
      return 'pass cant be empty';
    }
    return null;
  }
}
