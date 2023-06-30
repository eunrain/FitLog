class Validator {
  static isValidEmail(email) {
    final emailRegex =
        RegExp(r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$');

    return emailRegex.hasMatch(email);
  }
}
