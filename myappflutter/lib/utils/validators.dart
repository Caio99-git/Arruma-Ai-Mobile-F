class Validators {
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp _cepRegex = RegExp(r'^\d{5}-?\d{3}$');

  static String? email(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'Informe o e-mail';
    if (!_emailRegex.hasMatch(v)) return 'E-mail inválido';
    return null;
  }

  static String? password(String? value) {
    final v = value ?? '';
    if (v.isEmpty) return 'Informe a senha';
    if (v.length < 6) return 'A senha deve ter no mínimo 6 caracteres';
    return null;
  }

  static String? notEmpty(String? value, {String fieldName = 'Campo'}) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return '$fieldName é obrigatório';
    return null;
  }

  static String? cep(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'Informe o CEP';
    if (!_cepRegex.hasMatch(v)) return 'CEP inválido (use 00000-000)';
    return null;
  }
}
