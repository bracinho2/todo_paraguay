abstract class PickImageFailure implements Exception {
  String get message;
}

class PickImageError extends PickImageFailure {
  @override
  final String message;

  PickImageError({required this.message});
}
