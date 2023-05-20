mixin ValidationMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) {
      return message ?? 'Digite um texto';
    } else {
      return null;
    }
  }

  String? hasTwelveChars(String? value, [String? message]) {
    if (value!.length < 12) {
      return message ?? 'Deve-se usar pelo menos 12 caracteres';
    } else {
      return null;
    }
  }

  String? equalInputs(String? value, String? value2, [String? message]) {
    if (value != value2) {
      return message ?? 'Os valores não são iguais';
    } else {
      return null;
    }
  }

  String? notEqualInputs(String? value, String? value2, [String? message]) {
    if (value == value2) {
      return message ?? 'Os valores são iguais';
    } else {
      return null;
    }
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}
