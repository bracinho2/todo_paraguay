class ValidatorHelper {
  static String? validaString(String? value) =>
      value?.isEmpty ?? true ? 'Obrigatório' : null;
}
