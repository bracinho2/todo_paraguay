import 'package:todo_paraguay/src/pick_image/domain/entitity/image_entity.dart';

abstract class CameraStates {
  const CameraStates();
}

class EmptyProductState extends CameraStates {}

class LoadingProductState extends CameraStates {}

class ErrorProductState extends CameraStates {
  final String message;
  const ErrorProductState(this.message);
}

class SearchProductState extends CameraStates {
  final List<PickedImage> products;
  const SearchProductState(this.products);
}

class SuccessProductState extends CameraStates {
  final List<PickedImage> products;
  const SuccessProductState(this.products);
}
